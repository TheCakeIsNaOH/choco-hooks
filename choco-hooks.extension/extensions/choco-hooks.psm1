
function Get-ChookScripts {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)][string]$packageID,
        [Parameter(Mandatory = $true)][string]$scriptType,
        [switch]$isPost
    )
    
    $chookDir = Join-Path $env:ChocolateyInstall 'choco-hooks'
    
    if ($isPost) {
        $allScripts = Get-ChildItem -Path $chookDir -Recurse -Filter "post_*.ps1"
    } else {
        $allScripts = Get-ChildItem -Path $chookDir -Recurse -Filter "pre_*.ps1"
    }
    
    if ($scriptType -ieq "ChocolateyInstall.ps1") {
        $allScripts | Where-Object { ($_.Name -match '_install_|_any_') -and ($_.Name -match "_$([regex]::Escape($packageID)).ps1|_all.ps1") }
    } elseif ($scriptType -ieq "ChocolateyUninstall.ps1") {
        $allScripts | Where-Object { ($_.Name -match '_uninstall_|_any_') -and ($_.Name -match "_$([regex]::Escape($packageID)).ps1|_all.ps1") }
    } elseif ($scriptType -ieq "ChocolateyBeforeModify.ps1") {
        $allScripts | Where-Object { ($_.Name -match '_modify_|_any_') -and ($_.Name -match "_$([regex]::Escape($packageID)).ps1|_all.ps1") }
    } else {
        Write-Error "Script type invalid, cannot get choco hook scripts"
    }
}

function Install-ChookPackage {
    [CmdletBinding()]
    param()

    $chookDir = Join-Path $env:ChocolateyInstall 'choco-hooks'
    $moveToDir = Join-Path $chookDir (($env:ChocolateyPackageName).Trim(".extension").Trim(".chook"))
    $moveFromDir = Join-Path $env:ChocolateyPackageFolder 'hook'
    
    if (!(Test-Path $moveFromDir)) {
        Write-Host -ForegroundColor green "No hook directory found, skipping copy to choco-hooks"
        return
    }    

    if (!(Test-Path $moveToDir)) {
        $null = New-Item -ItemType Directory -Path $moveToDir 
    }

    Write-Host -ForegroundColor green "Moving files from hook directory to choco-hooks"
    Get-Childitem -Recurse -Path $moveFromDir | Move-Item -Destination $moveToDir
}

function Uninstall-ChookPackage {
    [CmdletBinding()]
    param()

    $chookDir = Join-Path $env:ChocolateyInstall 'choco-hooks'
    $moveToDir = Join-Path $chookDir (($env:ChocolateyPackageName).Trim(".extension").Trim(".chook"))

    if (Test-Path $moveToDir) {
        Write-Host -ForegroundColor green "Removing folder from choco-hooks"
        Remove-Item -Ea 0 -Path $moveToDir
    }
}

Export-ModuleMember -Function Get-ChookScripts,Install-ChookPackage,Uninstall-ChookPackage