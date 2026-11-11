# Package the four shipped addon files without touching gameplay code.
# Compatible with Windows PowerShell 5.1+.
[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
$root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$files = @('LootOwner.toc','LootOwner.lua','README.txt','CHANGELOG.txt','LICENSE.txt')
foreach ($name in $files) {
    if (-not (Test-Path -LiteralPath (Join-Path $root $name) -PathType Leaf)) {
        throw "Missing required source file: $name"
    }
}
$toc = Get-Content -LiteralPath (Join-Path $root 'LootOwner.toc') -Raw
if ($toc -notmatch '(?m)^## Version:\s*0\.0\.12\s*$') {
    throw 'Unexpected version in TOC. Update the package name and review version before releasing.'
}
if ($toc -notmatch '(?m)^## X-License:\s*GPL-3\.0-only\s*
if (-not (Test-Path $dist)) { New-Item -ItemType Directory -Path $dist | Out-Null }
$stage = Join-Path $dist '_staging'
$addon = Join-Path $stage 'LootOwner'
$zip = Join-Path $dist 'LootOwner_0.0.12_BETA_CANDIDATE.zip'
if (Test-Path $stage) { Remove-Item -LiteralPath $stage -Recurse -Force }
New-Item -ItemType Directory -Path $addon -Force | Out-Null
try {
    foreach ($name in $files) { Copy-Item -LiteralPath (Join-Path $root $name) -Destination (Join-Path $addon $name) }
    if (Test-Path $zip) { Remove-Item -LiteralPath $zip -Force }
    Compress-Archive -Path $addon -DestinationPath $zip -CompressionLevel Optimal -Force
    Write-Host "Created: $zip"
    Get-FileHash -Algorithm SHA256 -LiteralPath $zip | Select-Object Hash, Path
} finally {
    if (Test-Path $stage) { Remove-Item -LiteralPath $stage -Recurse -Force }
}
) { throw 'Missing GPLv3 license metadata in TOC.' }
$license = Get-Content -LiteralPath (Join-Path $root 'LICENSE.txt') -Raw
if ($license -notmatch 'GNU GENERAL PUBLIC LICENSE' -or $license -notmatch 'Version 3') { throw 'Invalid GPLv3 license text.' }
$dist = Join-Path $root 'dist'
if (-not (Test-Path $dist)) { New-Item -ItemType Directory -Path $dist | Out-Null }
$stage = Join-Path $dist '_staging'
$addon = Join-Path $stage 'LootOwner'
$zip = Join-Path $dist 'LootOwner_0.0.12_BETA_CANDIDATE.zip'
if (Test-Path $stage) { Remove-Item -LiteralPath $stage -Recurse -Force }
New-Item -ItemType Directory -Path $addon -Force | Out-Null
try {
    foreach ($name in $files) { Copy-Item -LiteralPath (Join-Path $root $name) -Destination (Join-Path $addon $name) }
    if (Test-Path $zip) { Remove-Item -LiteralPath $zip -Force }
    Compress-Archive -Path $addon -DestinationPath $zip -CompressionLevel Optimal -Force
    Write-Host "Created: $zip"
    Get-FileHash -Algorithm SHA256 -LiteralPath $zip | Select-Object Hash, Path
} finally {
    if (Test-Path $stage) { Remove-Item -LiteralPath $stage -Recurse -Force }
}
