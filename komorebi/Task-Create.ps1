# Creating a Task Scheduler entry that starts
# komorebi.ahk at logon
#
# Abstract:
# Define componets                  -> Set up variables
# Define process + command line     -> New-ScheduledTaskAction
# When to run it                    -> New-ScheduledTaskTrigger
# Commit it                         -> Register-ScheduledTask

# 1.Define components:
# $exe = process    $arg = command line   $name = name of the task
$DEBUG = $true
$exe   = "C:\Users\morty\scoop\apps\autohotkey\current\UX\AutoHotkeyUX.exe"
$arg   = "C:\Users\morty\.config\autohotkey\komorebi.ahk"
$wd    = [System.IO.Path]::GetDirectoryName($arg)
$name  = "AutoHotkey Komorebi"

if ($DEBUG) {
    #clear
    Write-Host "`$DEBUG  = $DEBUG"  -ForegroundColor Red
    Write-Host "`$exe    = $exe"    -ForegroundColor Green
    Write-Host "`$arg    = $arg"    -ForegroundColor Green
    Write-Host "`$wd     = $wd"     -ForegroundColor Green
    Write-Host "`$name   = $name"   -ForegroundColor Green
}

# Check if task already exists
if (Get-ScheduledTask -TaskName $name -ErrorAction SilentlyContinue) {
    # Delete task if exists, before creating new:
    Unregister-ScheduledTask -TaskName $name -Confirm:$false
}

# 2.Create the action
$action = New-ScheduledTaskAction `
    -Execute $exe `
    -Argument "`"$arg`"" `
    -WorkingDirectory $wd

# 3.Create trigger (at logon)
$trigger = New-ScheduledTaskTrigger `
    -AtLogOn `
    -User $env:USERNAME

# 4.Optional settings
$settings = New-ScheduledTaskSettingsSet `
    -AllowStartIfOnBatteries `
    -DontStopIfGoingOnBatteries `
    -StartWhenAvailable

# 5. Register the task
Register-ScheduledTask `
    -TaskName $name `
    -Action $action `
    -Trigger $trigger `
    -Settings $settings `
    -Description "Run AutoHotkey komorebi script at logon"
