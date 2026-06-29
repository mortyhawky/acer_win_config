#### scoop

export:
```bash
scoop export > $Env:USERPROFILE\.config\scoop\installed_apps.json
scoop export > $Env:XDG_CONFIG_HOME\scoop\installed_apps-$(Get-Date -Format 'yyyy-MM-dd_HHmm').json
scoop list   > "$Env:XDG_CONFIG_HOME\scoop\list-$(Get-Date -Format 'yyyy-MM-dd_HHmm')"
```
