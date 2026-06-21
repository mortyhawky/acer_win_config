# Start-Komorebi-current.ps1

#clear
$procKomo = "komorebi"
#Write-Host "`$Env:KOMOREBI_CONFIG_HOME     = $Env:KOMOREBI_CONFIG_HOME" -ForegroundColor Yellow
#Write-Host "`$procKomo                     = $procKomo"                 -ForegroundColor Yellow

Get-Process -Name "$procKomo" 
#return

# Check if process exists
if (Get-Process -Name "$procKomo" -ErrorAction SilentlyContinue) {
   Write-Host "$procKomo is running.     Shift+F2 to stop $procKomo." -ForegroundColor Green
   return
} 
else {
   Write-Host "$procKomo is NOT running   ... Starting $procKomo ..." -ForegroundColor Green
   Start-Process 'komorebi.exe' -ArgumentList '--config="C:\Users\morty\.config\komorebi\komorebi.json"' -WindowStyle hidden
}

# Start komorebi-bar if not already running
if (!(Get-Process komorebi-bar -ErrorAction SilentlyContinue))
{
  Start-Process komorebi-bar -WindowStyle hidden
}

# Start masir, if not already running
if (!(Get-Process masir -ErrorAction SilentlyContinue))
{
  Start-Process masir -WindowStyle hidden
}

