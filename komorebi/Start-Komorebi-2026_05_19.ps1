# Start-Komorebi.ps1

#clear
$procKomo = "komorebi"
#Write-Host "`$Env:KOMOREBI_CONFIG_HOME     = $Env:KOMOREBI_CONFIG_HOME" -ForegroundColor Yellow
#Write-Host "`$procKomo                     = $procKomo"                 -ForegroundColor Yellow

Get-Process -Name "$procKomo" -ErrorAction SilentlyContinue
return

if (Get-Process -Name "$procKomo" -ErrorAction SilentlyContinue) {
   Write-Host "$procKomo is running.     Shift+F2 to stop $procKomo." -ForegroundColor Green
   return
} 
else {
   Write-Host "$procKomo is NOT running   ... Starting $procKomo ..." -ForegroundColor Green

   #Start-Process -FilePath "$procKomo"

#Start-Process -FilePath "$Env:ComSpec" -ArgumentList "/c dir `"%SystemDrive%\Program Files`""
Start-Process 'komorebi.exe' -ArgumentList '--config="C:\Users\morty\.config\komorebi\komorebi.json"' -WindowStyle hidden

if (!(Get-Process komorebi-bar -ErrorAction SilentlyContinue))
{
  Start-Process komorebi-bar -WindowStyle hidden
}

if (!(Get-Process masir -ErrorAction SilentlyContinue))
{
  Start-Process masir -WindowStyle hidden
}



#Start-Process -FilePath "$Env:ComSpec" -ArgumentList "/c dir `"%SystemDrive%\Program Files`""
#Start-Process -FilePath "$Env:ComSpec" -ArgumentList "/c","dir","`"%SystemDrive%\Program Files`""
  # Start-Process -FilePath "$procKomo" 
  #   -ArgumentList "--bar", "`"--masir`""


   #Start-Process "$procKomo" `
   # -ArgumentList '--config C:\Users\morty\.config\komorebi\komorebi.json'

   Sleep 1
   Get-Process -Name "$procKomo" -ErrorAction SilentlyContinue
}



    #-ArgumentList '--config "$Env:KOMOREBI_CONFIG_HOME\$procKomo.json"'
      #-WindowStyle hidden

#$exe    = "$env:USERPROFILE\scoop\apps\komorebi\current\komorebic.exe"
#$config = "$env:KOMOREBI_CONFIG_HOME\komorebi.json"
#
## Optional: ensure clean restart
## Stop existing instance if needed
## & $exe stop 2>$null
#
## Start komorebi
#& $exe start `
#    --config "$config" `
#    --bar `
#    --masir
