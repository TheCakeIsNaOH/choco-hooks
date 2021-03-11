﻿$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

#License types yanked from: https://github.com/chocolatey/rhino-licensing/blob/master/Rhino.Licensing/AbstractLicenseValidator.cs#L245-L252
#Only work with Professional or FOSS licenses types, anything else I don't have so I can't test it.
$unsupportedLicenceTypes = "Subscription","ManagedServiceProvider","Architect","Business","Enterprise","Education","Trial"
if ($unsupportedLicenceTypes -contains $env:ChocolateyLicenseType) {
    Throw "License type of $($env:ChocolateyLicenseType) is unsupported, exiting"
} elseif ($env:ChocolateyLicenseType -eq "Professional") {
    Write-Host -ForegroundColor red "____________________________________________________________"
    Write-Host -ForegroundColor red "|   !!  NOTICE for users of Chocolatey Professional  !!    |"
    Write-Host -ForegroundColor red "| By installing this package, you agree to not contact     |"
    Write-Host -ForegroundColor red "| Chocolatey private support about any issues with this    |"
    Write-Host -ForegroundColor red "| installation of Chocolatey because this modifies the     |"
    Write-Host -ForegroundColor red "| Chocolatey installation. Please instead report issues to |"
    Write-Host -ForegroundColor red "|     https://github.com/TheCakeIsNaOH/choco-hooks/        |"
    Write-Host -ForegroundColor red "------------------------------------------------------------"
}

#Only support specific choco versions that have an unchanged script runner and are tested
#This could be backported to 0.10.15-beta and 0.10.14 as the script runner is the same in those version as well
$supportedChocoVersions = "0.10.15.0","0.10.16-beta-20200806"
if ($supportedChocoVersions -notcontains $env:CHOCOLATEY_VERSION) {
    Throw "Unsupported version of chocolatey: $($env:CHOCOLATEY_VERSION)"
}

$configDir = Join-Path $env:ChocolateyInstall ".chocolatey"
$versionConfigDir = Get-ChildItem $configDir -Filter "chocolatey.*" | Where-Object { $_.name -match "chocolatey.\d" } | Select-Object -First 1 -ExpandProperty fullname
$pinFile = Join-Path $versionConfigDir '.pin'
Write-Debug "Pin file location found: $pinFile"

if (!(Test-Path $pinFile)) {
    #TODO - package parameter to pin chocolatey automatically?
    Write-Warning "Please do not install this without first pinning the version of chocolatey"
    Write-Warning "Run this: choco pin add -n chocolatey"
    Throw "Chocolatey does not appear to be pinned, exiting"
}

#TODO - actual copying of file here
$helpersDir = Join-Path $env:ChocolateyInstall "helpers"
$scriptRunnerFile = Join-Path $helpersDir "chocolateyScriptRunner.ps1"
$scriptRunnerBackup = Join-Path $helpersDir "chocolateyScriptRunner.ps1.backup"
$newScriptRunnerFile = Join-Path $toolsDir "chocolateyScriptRunner.ps1"

Write-Host -ForegroundColor green "Backing up original script runner to $scriptRunnerBackup"
Copy-Item -Path $scriptRunnerFile -Destination $scriptRunnerBackup -Force

Write-Host -ForegroundColor green "Copying new script runner file"
Copy-Item -Path $newScriptRunnerFile -Destination $scriptRunnerFile -Force