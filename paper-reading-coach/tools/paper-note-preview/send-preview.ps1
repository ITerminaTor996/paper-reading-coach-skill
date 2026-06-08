param(
  [Parameter(ValueFromPipeline = $true)]
  [string[]]$InputObject,
  [string]$Markdown,
  [string]$File,
  [int]$Port = 8765
)

begin {
  $pipelineText = New-Object System.Collections.Generic.List[string]
}

process {
  if ($InputObject) {
    foreach ($item in $InputObject) {
      $pipelineText.Add($item)
    }
  }
}

end {
$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
$HealthUrl = "http://127.0.0.1:$Port/health"
$PreviewUrl = "http://127.0.0.1:$Port"
$ApiUrl = "http://127.0.0.1:$Port/api/preview"

function Test-PreviewServer {
  try {
    $response = Invoke-RestMethod -Uri $HealthUrl -Method Get -TimeoutSec 2
    return $response.ok -eq $true
  } catch {
    return $false
  }
}

if (-not (Test-PreviewServer)) {
  & (Join-Path $Root "start-preview.ps1") -Port $Port | Out-Null
}

if ($File) {
  $markdownText = Get-Content -Raw -Encoding UTF8 -Path $File
} elseif ($Markdown) {
  $markdownText = $Markdown
} elseif ($pipelineText.Count -gt 0) {
  $markdownText = $pipelineText -join [Environment]::NewLine
} else {
  $markdownText = [Console]::In.ReadToEnd()
}

if ([string]::IsNullOrWhiteSpace($markdownText)) {
  throw "No Markdown provided. Pipe Markdown to this script, pass -Markdown <text>, or pass -File <path>."
}

$body = @{ markdown = $markdownText } | ConvertTo-Json -Compress
Invoke-RestMethod -Uri $ApiUrl -Method Post -ContentType "application/json; charset=utf-8" -Body $body | Out-Null

Write-Output $PreviewUrl
}
