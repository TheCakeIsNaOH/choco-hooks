$ErrorActionPreference = 'Stop';
$helpersDir = Join-Path $env:ChocolateyInstall "helpers"
$scriptRunnerFile = Join-Path $helpersDir "chocolateyScriptRunner.ps1"
$scriptRunnerBackup = Join-Path $helpersDir "chocolateyScriptRunner.ps1.backup"

Write-Host -ForegroundColor green "Restoring original script runner file"
Copy-Item -Path $scriptRunnerBackup -Destination $scriptRunnerFile -Force

Write-Host -ForegroundColor green "Removing backup script runner"
Remove-Item -Force -Path $scriptRunnerBackup