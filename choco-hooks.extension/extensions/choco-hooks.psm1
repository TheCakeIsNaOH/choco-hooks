
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
    }    
}

function Install-ChookPackage {
    [CmdletBinding()]
    param()

}

function Uninstall-ChookPackage {
    [CmdletBinding()]
    param()
}

Export-ModuleMember -Function Get-ChookScripts,Install-ChookPackage,Uninstall-ChookPackage