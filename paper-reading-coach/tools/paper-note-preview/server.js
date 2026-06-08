const http = require("node:http");
const fs = require("node:fs");
const path = require("node:path");

const PORT = Number(process.env.PAPER_NOTE_PREVIEW_PORT || 8765);
const HOST = "127.0.0.1";
const ROOT = __dirname;
const MAX_BODY_BYTES = 1024 * 1024 * 2;

let latest = {
  markdown: "",
  updatedAt: null
};

function sendJson(response, status, value) {
  response.writeHead(status, {
    "Content-Type": "application/json; charset=utf-8",
    "Cache-Control": "no-store",
    "Access-Control-Allow-Origin": "*"
  });
  response.end(JSON.stringify(value));
}

function sendText(response, status, text, contentType = "text/plain; charset=utf-8") {
  response.writeHead(status, {
    "Content-Type": contentType,
    "Cache-Control": "no-store"
  });
  response.end(text);
}

function readBody(request) {
  return new Promise((resolve, reject) => {
    let size = 0;
    const chunks = [];

    request.on("data", (chunk) => {
      size += chunk.length;
      if (size > MAX_BODY_BYTES) {
        reject(new Error("Request body too large"));
        request.destroy();
        return;
      }
      chunks.push(chunk);
    });

    request.on("end", () => resolve(Buffer.concat(chunks).toString("utf8")));
    request.on("error", reject);
  });
}

function parsePreviewBody(rawBody) {
  if (!rawBody.trim()) {
    return "";
  }

  try {
    const parsed = JSON.parse(rawBody);
    if (typeof parsed.markdown === "string") {
      return parsed.markdown;
    }
  } catch (error) {
    // Plain text body is also accepted.
  }

  return rawBody;
}

const server = http.createServer(async (request, response) => {
  const url = new URL(request.url, `http://${HOST}:${PORT}`);

  if (request.method === "OPTIONS") {
    response.writeHead(204, {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Methods": "GET,POST,OPTIONS",
      "Access-Control-Allow-Headers": "Content-Type"
    });
    response.end();
    return;
  }

  if (request.method === "GET" && url.pathname === "/health") {
    sendJson(response, 200, { ok: true, updatedAt: latest.updatedAt });
    return;
  }

  if (request.method === "GET" && url.pathname === "/api/latest") {
    sendJson(response, 200, latest);
    return;
  }

  if (request.method === "POST" && url.pathname === "/api/preview") {
    try {
      latest = {
        markdown: parsePreviewBody(await readBody(request)),
        updatedAt: new Date().toISOString()
      };
      sendJson(response, 200, { ok: true, updatedAt: latest.updatedAt });
    } catch (error) {
      sendJson(response, 400, { ok: false, error: error.message });
    }
    return;
  }

  if (request.method === "GET" && (url.pathname === "/" || url.pathname === "/index.html")) {
    const htmlPath = path.join(ROOT, "index.html");
    fs.readFile(htmlPath, "utf8", (error, html) => {
      if (error) {
        sendText(response, 500, "Could not load preview page.");
        return;
      }
      sendText(response, 200, html, "text/html; charset=utf-8");
    });
    return;
  }

  sendText(response, 404, "Not found.");
});

server.listen(PORT, HOST, () => {
  console.log(`Paper Note Preview running at http://${HOST}:${PORT}`);
});
