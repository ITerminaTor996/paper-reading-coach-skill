param(
  [int]$Port = 8765,
  [switch]$NoOpen
)

$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
$HealthUrl = "http://127.0.0.1:$Port/health"
$PreviewUrl = "http://127.0.0.1:$Port"

function Test-PreviewServer {
  try {
    $response = Invoke-RestMethod -Uri $HealthUrl -Method Get -TimeoutSec 2
    return $response.ok -eq $true
  } catch {
    return $false
  }
}

if (-not (Test-PreviewServer)) {
  $env:PAPER_NOTE_PREVIEW_PORT = "$Port"
  $outLog = Join-Path $Root "preview-server.out.log"
  $errLog = Join-Path $Root "preview-server.err.log"

  Start-Process `
    -FilePath "node" `
    -ArgumentList @("server.js") `
    -WorkingDirectory $Root `
    -WindowStyle Hidden `
    -RedirectStandardOutput $outLog `
    -RedirectStandardError $errLog

  $started = $false
  for ($i = 0; $i -lt 30; $i++) {
    Start-Sleep -Milliseconds 250
    if (Test-PreviewServer) {
      $started = $true
      break
    }
  }

  if (-not $started) {
    throw "Paper Note Preview server did not start. Check $errLog"
  }
}

if (-not $NoOpen) {
  Start-Process $PreviewUrl
}

Write-Output $PreviewUrl
