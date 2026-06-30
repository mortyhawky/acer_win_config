#Requires AutoHotkey 2
#SingleInstance Force

CoordMode "ToolTip", "Screen"
CoordMode "Mouse",   "Screen"
tipX := 800
tipY := 7

;;; Show tooltip, top center of bar
Info(string) {
   ; len to center align tooltip box
   len := strlen(string)
   ToolTip string, tipX-len*3.44, tipY
}

PID := 0
PID := ProcessExist("Flow.Launcher.exe")

if( !PID ) {
   Run "C:\Users\morty\scoop\apps\flow-launcher\current\Flow.Launcher.exe"
   Info "Flow.Launcher.exe is Started..."
} 
else {
   Info("Flow.Launcher.exe is already running with PID := " . PID)
}

; Send Alt-b if alacritty as running, tmux prefix
#HotIf WinActive("ahk_exe alacritty.exe")
!Space::{
    Info "!Space -> !b"
    Send "!b"
}
#HotIf

; ~ = pass-through
~Escape:: {
    Sleep 100
    Info "<Esc>"
}

~^s:: {
    Sleep 100
    Info "<C-s>"
}


;;; Launch komorebi when this script starts
cmd :=
(
    "pwsh -NoExit -WorkingDirectory "
    . "C:\Users\morty\.config\komorebi "
    . "-Command .\Start-Komorebi-current.ps1"
)
Run(cmd, , "Hide")
;Info "AutoHotkey " . A_PtrSize*8 . "bit " . A_ScriptName

KomoRunWait(cmd) {
   Info "RunWait komorebic.exe " . cmd
   RunWait(format("komorebic.exe {}", cmd),, "Hide" )
}

KomoRun(cmd) {
   cmdFrmt := format("komorebic.exe {}", cmd)
   Info "Run " . cmdFrmt
   Run(format("komorebic.exe {}", cmd), , "Hide")
}

#r:: {
   cmd := "Flow.Launcher.exe"
   Run "C:\Users\morty\scoop\apps\flow-launcher\current\Flow.Launcher.exe"
   Info "#r " . "cmd := " . cmd
}

F2:: {
   Info "F2 Wrapper: Start-Komorebi-current.ps1"
   Run "pwsh -NoExit -WorkingDirectory C:\Users\morty\.config\komorebi -Command .\Start-Komorebi-current.ps1",,"Hide"
}

+F2:: {
   KomoRun('stop --bar --masir')
}

#enter:: {
   cmd := "alacritty"
   ;Run cmd
   ;Sleep 300

   ;KomoRunWait("promote")
   Info "#enter " . "cmd := " . cmd
}

^#k:: {
   Run "komorebic start --bar"
}

#w:: {
   cmd := "firefox"
   ;Run "firefox.exe"
   ;Sleep 1000
   ;KomoRunWait("promote")
   Info "#w " . "cmd := " . cmd
}

+#r:: KomoRunWait("retile")

^#r:: { 
   KomoRunWait("retile")    ; komorebic retile
   Sleep 1000               ; Wait 1000ms
   reload                   ; Reloads this script
}

#q:: {
    Info "#q"
    KomoRunWait("close")
}

#+Q:: {
   Info "<#-S-Q>"
   ;Info "+#q"
   ;Run "pwsh -NoExit -Command C:\Users\morty\.config\komorebi\Wrap-Reboot.ps1"
   ;Run "shutdown.exe /r /t 5"
}

#^e:: {
   ;Info "^#e"
   Info "<#-C-e>"
   ;KomoRun("preselect-direction left")
   ;Sleep 300
   ;RunWait( format("nvim.exe {}", "C:\Users\morty\.config\komorebi\komorebi-current.ahk") )
   ;reload
}


+#enter:: {
    Info "+#enter"
    KomoRunWait("promote")
}

;; Move windows across workspaces
#+1::KomoRunWait("move-to-workspace 0")
#+2::KomoRunWait("move-to-workspace 1")
#+3::KomoRunWait("move-to-workspace 2")
#+4::KomoRunWait("move-to-workspace 3")
#+5::KomoRunWait("move-to-workspace 4")
#+6::KomoRunWait("move-to-workspace 5")
#+7::KomoRunWait("move-to-workspace 6")
#+8::KomoRunWait("move-to-workspace 7")

;; Focus workspaces       Win+1234567
#1::KomoRunWait("focus-workspace 0")
#2::KomoRunWait("focus-workspace 1")
#3::KomoRunWait("focus-workspace 2")
#4::KomoRunWait("focus-workspace 3")
#5::KomoRunWait("focus-workspace 4")
#6::KomoRunWait("focus-workspace 5")
#7::KomoRunWait("focus-workspace 6")
#8::KomoRunWait("focus-workspace 7")

;; Resize window    Win+Shift+hjkl
#+l::KomoRunWait("resize-axis horizontal increase")
#+h::KomoRunWait("resize-axis horizontal decrease")
#+k::KomoRunWait("resize-axis vertical increase")
#+j::KomoRunWait("resize-axis vertical decrease")

;; Focus window Win+hjkl
#h::KomoRunWait("focus left")
#j::KomoRunWait("focus down")
#k::KomoRunWait("focus up")
#l::KomoRunWait("focus right")
#n::KomoRunWait("cycle-focus next")
#+n::KomoRunWait("cycle-focus previous")

;; Manipulate windows
#m::KomoRunWait("toggle-monocle")
#t::KomoRunWait("toggle-monocle")
