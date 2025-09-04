#NoEnv

UrlDownloadToFile, https://raw.githubusercontent.com/TedyonGit/AHK/refs/heads/main/changes, changes.txt

if(FileExist("changes.txt"))
{
	Sleep, 3000
	Path := ""
	DownloadLink := ""
	Loop
	{
	    FileReadLine, line, changes.txt, %A_Index%
	    if ErrorLevel
	        break
	    if(Path == "")
	    {
	    	Path := line
	    } else {
	    	DownloadLink := line
	    }

	    if(Path && DownloadLink)
	    {
	    	RelativePath := A_Args[1]
	    	RelativePath .= Path
	    	UrlDownloadToFile, %DownloadLink%, %RelativePath%
	    }
	}
	Sleep, 2000
	FileDelete, changes.txt
	Command := A_Args[1]
	Command .= "/Tedy.ahk"
	Run, %Command%
	return
}
