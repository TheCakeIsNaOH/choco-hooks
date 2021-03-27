Write-Host -ForegroundColor green  "Attempting to stop the NordVPN app"
$Null = Remove-Process -NameFilter "NordVPN$"