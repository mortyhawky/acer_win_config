#!pwsh

#scoop export > $Env:USERPROFILE\.config\scoop\applist.json
scoop export > $Env:XDG_CONFIG_HOME\scoop\applist-$(Get-Date -Format 'yyyy-MM-dd_HHmm').json
scoop list   > $Env:XDG_CONFIG_HOME\scoop\applist-$(Get-Date -Format 'yyyy-MM-dd_HHmm').txt
