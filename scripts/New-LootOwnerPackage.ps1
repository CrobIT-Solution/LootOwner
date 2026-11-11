# Package LootOwner 0.1.0 Beta r1 for WoW Forever.
# Windows PowerShell 5.1+; no external modules or network use.
[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$files = @('LootOwner.toc', 'LootOwner.lua', 'README.txt', 'CHANGELOG.txt', 'LICENSE.txt')
foreach ($name in $files) {
    if (-not (Test-Path -LiteralPath (Join-Path $root $name) -PathType Leaf)) {
        throw "Missing addon file: $name"
    }
}
$toc = Get-Content -LiteralPath (Join-Path $root 'LootOwner.toc') -Raw
if ($toc -notmatch '(?m)^## Version:\s*0\.1\.0\s*$') {
    throw 'Expected version 0.1.0 in LootOwner.toc'
}
if ($toc -notmatch '(?m)^## X-License:\s*GPL-3\.0-only\s*$') {
    throw 'Expected GPL-3.0-only in LootOwner.toc'
}
$license = Get-Content -LiteralPath (Join-Path $root 'LICENSE.txt') -Raw
if ($license -notmatch 'GNU GENERAL PUBLIC LICENSE' -or $license -notmatch 'Version 3') {
    throw 'Full GPLv3 text is required in LICENSE.txt'
}
$dist = Join-Path $root 'dist'
if (-not (Test-Path -LiteralPath $dist)) {
    New-Item -ItemType Directory -Path $dist -Force | Out-Null
}
$stage = Join-Path $dist '_staging'
$addon = Join-Path $stage 'LootOwner'
$zip = Join-Path $dist 'Loot-Owner_b_0.1.0_r1.zip'
if (Test-Path -LiteralPath $stage) {
    Remove-Item -LiteralPath $stage -Recurse -Force
}
New-Item -ItemType Directory -Path $addon -Force | Out-Null
try {
    foreach ($name in $files) {
        Copy-Item -LiteralPath (Join-Path $root $name) -Destination (Join-Path $addon $name)
    }
    if (Test-Path -LiteralPath $zip) {
        Remove-Item -LiteralPath $zip -Force
    }
    Compress-Archive -Path $addon -DestinationPath $zip -CompressionLevel Optimal
    Write-Host "Created: $zip"
    Get-FileHash -LiteralPath $zip -Algorithm SHA256 | Select-Object Hash, Path
} finally {
    if (Test-Path -LiteralPath $stage) {
        Remove-Item -LiteralPath $stage -Recurse -Force
    }
}
