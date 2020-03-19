
Set oShell = CreateObject ("Wscript.Shell") 
Dim strArgs
strArgs = "bash.exe -c '/d/usr/Neovim/bin/nvim-1.sh " & Replace(WScript.Arguments(0), "\", "/") & "'"
' strArgs = "bash.exe -c '/d/usr/Neovim/bin/nvim-1.sh " & Replace(WScript.Arguments(0), "\", "\\\\") & "'"
oShell.Run strArgs, 0

