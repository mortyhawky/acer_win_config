$taskNAme = "AutoHotkey komorebi"

Get-ScheduledTask -TaskName "AutoHotkey Komorebi" | 
   Select-Object Actions, State, Description, Triggers, Author | 
       Format-List

Write-Host "---"
Get-ScheduledTask -TaskName "AutoHotkey Komorebi" | 
    Get-ScheduledTaskInfo
