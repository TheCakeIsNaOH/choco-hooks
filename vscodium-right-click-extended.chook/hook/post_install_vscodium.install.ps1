if((Test-Path -LiteralPath "HKLM:\SOFTWARE\Classes\*\shell\VSCodium") -ne $true) {  
    New-Item "HKLM:\SOFTWARE\Classes\Directory\Background\shell\VSCodium" -force -ea SilentlyContinue 
};
if((Test-Path -LiteralPath "HKLM:\SOFTWARE\Classes\Directory\Background\shell\VSCodium") -ne $true) {  
    New-Item "HKLM:\SOFTWARE\Classes\Directory\Background\shell\VSCodium" -force -ea SilentlyContinue 
};
if((Test-Path -LiteralPath "HKLM:\SOFTWARE\Classes\Directory\shell\VSCodium") -ne $true) {  
    New-Item "HKLM:\SOFTWARE\Classes\Directory\shell\VSCodium" -force -ea SilentlyContinue 
};
$null = New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Classes\Directory\Background\shell\VSCodium' -Name 'Extended' -Value '' -PropertyType String -Force -ea SilentlyContinue;
$null = New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Classes\Directory\shell\VSCodium' -Name 'Extended' -Value '' -PropertyType String -Force -ea SilentlyContinue;
$null = New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Classes\*\shell\VSCodium' -Name 'Extended' -Value '' -PropertyType String -Force -ea SilentlyContinue;