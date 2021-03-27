if((Test-Path -LiteralPath "HKLM:\SOFTWARE\Classes\Directory\Background\shell\git_shell") -ne $true) {  
    New-Item "HKLM:\SOFTWARE\Classes\Directory\Background\shell\git_shell" -force -ea SilentlyContinue 
};
if((Test-Path -LiteralPath "HKLM:\SOFTWARE\Classes\Directory\Background\shell\git_gui") -ne $true) {  
    New-Item "HKLM:\SOFTWARE\Classes\Directory\Background\shell\git_gui" -force -ea SilentlyContinue 
};
if((Test-Path -LiteralPath "HKLM:\SOFTWARE\Classes\Directory\shell\git_gui") -ne $true) {  
    New-Item "HKLM:\SOFTWARE\Classes\Directory\shell\git_gui" -force -ea SilentlyContinue 
};
if((Test-Path -LiteralPath "HKLM:\SOFTWARE\Classes\Directory\shell\git_shell") -ne $true) {
    New-Item "HKLM:\SOFTWARE\Classes\Directory\shell\git_shell" -force -ea SilentlyContinue 
};
$null = New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Classes\Directory\Background\shell\git_shell' -Name 'Extended' -Value '' -PropertyType String -Force -ea SilentlyContinue;
$null = New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Classes\Directory\Background\shell\git_gui' -Name 'Extended' -Value '' -PropertyType String -Force -ea SilentlyContinue;
$null = New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Classes\Directory\shell\git_gui' -Name 'Extended' -Value '' -PropertyType String -Force -ea SilentlyContinue;
$null = New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Classes\Directory\shell\git_shell' -Name 'Extended' -Value '' -PropertyType String -Force -ea SilentlyContinue;