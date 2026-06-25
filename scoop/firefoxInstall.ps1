scoop update
scoop update --all
scoop install firefox

Copy-Item A:\win\BU_Firefox\Profiles      `
            $Env:APPDATA\Mozilla\Firefox\  `
                -Recurse -Force
