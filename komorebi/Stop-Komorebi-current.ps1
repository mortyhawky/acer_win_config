# Stop-Komorebi.ps1

#$procName = "$env:USERPROFILE\scoop\apps\komorebi\current\komorebi.exe"
#$config = "$env:KOMOREBI_CONFIG_HOME\komorebi.json"

clear
$procName   = "komorebi"
Get-Process -Name "$procName" -ErrorAction SilentlyContinue

if ( Get-Process -Name "$procName" -ErrorAction SilentlyContinue ) 
{
    Write-Host "---"
    Write-Host "$procName IS Running  ... STOPPING $procName ..." -ForegroundColor Red
    Stop-Process -Name "$procName" -ErrorAction SilentlyContinue
    Stop-Process -Name komorebi-bar -ErrorAction SilentlyContinue
    Stop-Process -Name masir -ErrorAction SilentlyContinue
}
else
{
    Write-Host "$procName is NOT Running. F2 to start" -ForegroundColor Red
}

Sleep 2
Get-Process -Name "$procName" -ErrorAction SilentlyContinue
