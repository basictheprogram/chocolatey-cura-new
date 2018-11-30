Func Install($config)
   Local $install = $config.Item("install")
   ConsoleWrite($install & @LF)
   ; Run installation program
   Run($install)

   WinWaitActive("Ultimaker Cura Setup")
   Send("!n")
   WinWaitActive("Ultimaker Cura Setup")
   Send("!a")
   WinWaitActive("Ultimaker Cura Setup")
   Send("!n")
   WinWaitActive("Ultimaker Cura Setup")
   Send("!n")
   WinWaitActive("Ultimaker Cura Setup")
   Send("!i")

   WinWaitActive("Windows Security")
   Send("!i")
   WinWaitActive("Windows Security")
   Send("!i")
   WinWaitActive("Windows Security")
   Send("!i")

   WinWaitActive("Ultimaker Cura Setup", "Completing the Ultimaker Cura Setup Wizard")
   Send("!r")
   Send("!f")

EndFunc

Local $config = ObjCreate("Scripting.Dictionary")
$config.Add("install", $CmdLine[1])

Install($config)
ConsoleWrite("End of cura-new" & @LF)