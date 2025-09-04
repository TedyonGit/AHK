#MaxThreadsPerHotkey 2
#NoEnv
#SingleInstance Force

#Include %A_ScriptDir%/Modules/WebModule.ahk

Version := "v0.2"

RemoteVersion := GET("https://raw.githubusercontent.com/TedyonGit/AHK/refs/heads/main/version")

RemoteVersion := Trim(RemoteVersion, "`r`n ")

Path := A_Temp
Path .= "\AutoUpdate.ahk"

if(Version != RemoteVersion)
{
	UrlDownloadToFile, https://raw.githubusercontent.com/TedyonGit/AHK/refs/heads/main/AutoUpdate.ahk, %Path%
	Run, %Path% %A_ScriptDir%
	ExitApp
}

if(FileExist(Path))
{
	FileDelete, %Path%
}

Gui, New
Gui, Font, s10
Gui, Add, Text, x10 y10, Location:
Gui, Add, DropDownList, vLocation x+5 yp  w132, Fortune River|Crystal Caverns|Sunset Beach|Museum|Fortune River Delta|Caldera Island|Windswept Beach|The Magma Furnance|Snowy Shores|Frostbitten Path|Frozen Peak|

Gui, Add, Text, x10 y+15, 
Gui, Add, Button, gSubmit, Save
Gui, Add, Text, y+13, Enable/Disable use F3
Gui, Show, w220, Let's goo gambling

return


Submit:
    Gui, Submit, NoHide
    LocationPath := "./Locations/" . Location . ".png"
    LocationChosen := StrReplace(Location, " ")

    MsgBox, Saved!
return

BlackRect(x, y, w, h) {
	static n := 0
	n++
	Gui, %n%:-Caption +AlwaysOnTop +ToolWindow
	Gui, %n%:Color, Black
	Gui, %n%:Show, x%x% y%y% w%w% h%h%
	return n
}

DestroyBR(n) {
	Gui, %n%:Destroy
}

#Include %A_ScriptDir%/Modules/Controller.ahk
