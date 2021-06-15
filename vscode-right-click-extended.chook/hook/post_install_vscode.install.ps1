if((Test-Path -LiteralPath "HKLM:\SOFTWARE\Classes\*\shell\VSCode") -ne $true) {  
    New-Item "HKLM:\SOFTWARE\Classes\Directory\Background\shell\VSCode" -force -ea SilentlyContinue 
};
if((Test-Path -LiteralPath "HKLM:\SOFTWARE\Classes\Directory\Background\shell\VSCode") -ne $true) {  
    New-Item "HKLM:\SOFTWARE\Classes\Directory\Background\shell\VSCode" -force -ea SilentlyContinue 
};
if((Test-Path -LiteralPath "HKLM:\SOFTWARE\Classes\Directory\shell\VSCode") -ne $true) {  
    New-Item "HKLM:\SOFTWARE\Classes\Directory\shell\VSCode" -force -ea SilentlyContinue 
};
$null = New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Classes\Directory\Background\shell\VSCode' -Name 'Extended' -Value '' -PropertyType String -Force -ea SilentlyContinue;
$null = New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Classes\Directory\shell\VSCode' -Name 'Extended' -Value '' -PropertyType String -Force -ea SilentlyContinue;
$null = New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Classes\*\shell\VSCode' -Name 'Extended' -Value '' -PropertyType String -Force -ea SilentlyContinue;