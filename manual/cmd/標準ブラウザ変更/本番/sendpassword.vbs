Option Explicit
WScript.Sleep 2000

Dim objwinSh
Set objwinSh = CreateObject("WScript.Shell")
objwinSh.AppActivate("C:\WINDOWS\system32\runas.exe")
objwinSh.SendKeys WScript.Arguments(0)
objwinSh.SendKeys "{ENTER}"
Set objwinSh = Nothing