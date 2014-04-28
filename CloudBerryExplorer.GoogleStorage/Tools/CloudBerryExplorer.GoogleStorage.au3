AutoItSetOption ("TrayIconDebug", 1);0-off

;Path and filename of the installer executable
$InstallPackage="""" & $CmdLine[1] & """"

Run($InstallPackage, "", @SW_SHOWMAXIMIZED)
If @error <> 0  Then
    MsgBox(0, "Run failed", "The ""Run"" command failed with error " & Hex(@error, 8) & " for " & $InstallPackage & " - exiting")
    Exit
EndIf

$title="CloudBerry Explorer for Google Storage"
WinWaitActive($title, "Welcome")
Send("!n")
WinWaitActive($title, "License Agreement")
Send("!a")
WinWaitActive($title, "Choose Install Location")
Send("!i")
WinWaitActive($title, "Completing the")
Send("!r")
Send("!f")

Exit
