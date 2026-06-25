scoop uninstall firefox
scoop cache rm *
Copy-Item   $Env:APPDATA\Mozilla\Firefox\Profiles\*  `
            A:\win\BU_Firefox\Profiles\              `
            -Force -Recurse


Remove-Item $Env:APPDATA\Mozilla\Firefox\Profiles\*  `
            -Force -Recurse

