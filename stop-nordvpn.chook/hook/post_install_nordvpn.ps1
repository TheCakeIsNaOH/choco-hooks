Write-Host -ForgroundColor green "Attempting to stop the nordpvn app"
$Null = Remove-Process -NameFilter "NordVPN$"