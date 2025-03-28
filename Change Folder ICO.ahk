;@Ahk2Exe-SetVersion 1.1.37.02
;@Ahk2Exe-SetFileVersion v.2025.03.27.1
;@Ahk2Exe-SetProductName Change Folder ICO
;@Ahk2Exe-SetDescription Change Folder Icons from a Quick and Simple GUI
;@Ahk2Exe-SetInternalName Change Folder ICO
;@Ahk2Exe-SetLanguage 0409
;@Ahk2Exe-SetMainIcon icons\ChangeFolderIcon.ico
;@Ahk2Exe-SetProductVersion 1.1.37.02
global fileversion
filegetversion, fileversion, %a_scriptfullpath%
#SingleInstance Force
#Persistent
#Requires Autohotkey v1.1.33+

CoordMode, tooltip, mouse

if (A_IsCompiled)
{
splitpath, A_ScriptFullPath,,scriptfolder
; msgbox, asfp- %a_scriptfullpath%
if (InStr(scriptfolder, "C:\Program Files"))
	{
	msgbox, 262144,,It is not recommend to run this script from protected system folders such as %A_ProgramFiles%.`n`nWindows won't let it write to its own .ini.`n`nIf you encounter errors here try moving to your Users Folder instead.
	; Return
	}
if !(InStr(scriptfolder, "Change Folder ICO"))
	{
	MsgBox, 262145, Change Folder .Ico Portable GUI Installer, Thanks for checking out Change Folder .Ico`, a simple, portable AHK GUI Script for Setting and Editing Folder Icons via desktop.ini files.`n`nIt Seems this is the first time you're running this.`n`nThis will install into its own folder...`n@ %A_ScriptDir%\Change Folder ICO`n`nIt can be moved afterwards as long as you don't change its folder name.`n`nClick OK to Contintue...
	IfMsgBox Cancel
		Return
	IfMsgBox OK
		{
		tooltip Working on it . . .
			FileCreateDir,%A_ScriptDir%\Change Folder ICO

			sleep 300
			OwnFolder = %A_ScriptDir%\Change Folder ICO
			SetWorkingDir,%OwnFolder%
			FileCreateDir,%ownfolder%\Icons
			SetWorkingDir,%ownfolder%\Icons
			sleep 300
			; msgbox wd %a_workingdir%`n`nof -- %ownfolder%
			FileInstall, Icons\about.ico, %A_WorkingDir%\about.ico,1
			FileInstall, Icons\admin.ico, %A_WorkingDir%\admin.ico,1
			FileInstall, Icons\adminrunning.ico, %A_WorkingDir%\adminrunning.ico,1
			FileInstall, Icons\attention.ico, %A_WorkingDir%\attention.ico,1
			FileInstall, Icons\ChangeFolderIcon.ico, %A_WorkingDir%\ChangeFolderIcon.ico,1
			FileInstall, Icons\checkclipboard.ico, %A_WorkingDir%\checkclipboard.ico,1
			FileInstall, Icons\clipboardicon.ico, %A_WorkingDir%\clipboardicon.ico,1
			FileInstall, Icons\darkmode.ico, %A_WorkingDir%\darkmode.ico,1
			FileInstall, Icons\editdoc.ico, %A_WorkingDir%\editdoc.ico,1
			FileInstall, Icons\exitapp.ico, %A_WorkingDir%\exitapp.ico,1
			FileInstall, Icons\folderhistory.ico, %A_WorkingDir%\folderhistory.ico,1
			FileInstall, Icons\forcewinreload.ico, %A_WorkingDir%\forcewinreload.ico,1
			FileInstall, Icons\githubicon.ico, %A_WorkingDir%\githubicon.ico,1
			FileInstall, Icons\hotkeys.ico, %A_WorkingDir%\hotkeys.ico,1
			FileInstall, Icons\iconerror.ico, %A_WorkingDir%\iconerror.ico,1
			FileInstall, Icons\iniicon.ico, %A_WorkingDir%\iniicon.ico,1
			FileInstall, Icons\openfolders.ico, %A_WorkingDir%\openfolders.ico,1
			FileInstall, Icons\pinnedtotop.ico, %A_WorkingDir%\pinnedtotop.ico,1
			FileInstall, Icons\previeweye.ico, %A_WorkingDir%\previeweye.ico,1
			FileInstall, Icons\reload.ico, %A_WorkingDir%\reload.ico,1
			FileInstall, Icons\settingsaltini.ico, %A_WorkingDir%\settingsaltini.ico,1
			FileInstall, Icons\startmenu.ico, %A_WorkingDir%\startmenu.ico,1
			FileInstall, Icons\tooltip.ico, %A_WorkingDir%\tooltip.ico,1
			FileInstall, Icons\trashbin.ico, %A_WorkingDir%\trashbin.ico,1
			FileInstall, Icons\winpos.ico, %A_WorkingDir%\winpos.ico,1
			sleep 3000
			SetWorkingDir,%ownfolder%
			CFIEXE := "Change Folder ICO.exe"
			if Fileexist(CFIEXE)
				{
					filedelete, %CFIEXE%
				}
			FileCopy,%A_Scriptfullpath%,%OwnFolder%\Change Folder ICO.exe,1
			sleep 1000
			SetWorkingDir,%ownfolder%
			changelog := "Change Folder ICO - ChangeLog.txt"
			global changelog
			global inifile
			inifile := "Change Folder ICO.exe-SETTINGS.ini"
			if !FileExist(inifile)
				gosub makeini
			sleep 1000
			tooltip
			MsgBox, 262148, , All Set!`n`nChange Folder ICO is ready to go!`n`nDo you want to run it now?
			IfMsgBox No
				goto exitinstaller
			IfMsgBox Yes
				{
					sleep 10
					run %ownfolder%\Change Folder ICO.exe
					sleep 1000
					goto exitinstaller
				}
			exitinstaller:
			exitapp
			return
		}
	}
else
	{
		CFIEXE := "Change Folder ICO.exe"
		; if (A_ScriptName != "Change Folder ICO.exe")
			; {
			; }
		if Fileexist(CFIEXE) && (A_ScriptName != "Change Folder ICO.exe")
			{
			; msgbox hey, the exe names don't match, the old file needs to deleted and updated
			FileGetVersion, updatecheck, %CFIEXE%
			if (updatecheck != version)
				{
				if winexist("- Change Folder .Ico -")
					{
						MsgBox, 4145, Updating Change Folder ICO, This is an update to Change Folder .Ico`nwhich is running.`n`nIt will be closed before updateing.
							IfMsgBox Cancel
								return
						Winkill, - Change Folder .Ico -,#1 Pick a Folder to, 5,- Notepad++,
						sleep 500
					}
				Loop
					{
						FileDelete, %CFIEXE%
						Sleep, 200
						if !FileExist(CFIEXE)
							break
					}
				sleep 500
				filecopy,%A_Scriptfullpath%,%CFIEXE%
				sleep 2000
				MsgBox, 4132, Change Folder ICO - Updated, Update Completed.`n`nDo you want to run Change Folder .Ico now?
				IfMsgBox Yes
					{
					run %a_scriptdir%\%CFIEXE%
					sleep 200
					exitapp
					}
				IfMsgBox No
					exitapp
				; sleep 500
				; exitapp
				}
			}
	changelog := "Change Folder ICO - ChangeLog.txt"
	global changelog
	inifile := "Change Folder ICO.exe-SETTINGS.ini"
	Global inifile
	if !FileExist(inifile)
		gosub makeini
	FileCreateDir,%A_Scriptdir%\Icons
	SetWorkingDir,%A_scriptdir%\Icons
	gosub checkinstalledicons
	SetWorkingDir,%A_ScriptDir%
	}
}
else
{
inifile := A_scriptname "-SETTINGS.ini"
global inifile
changelog := "Change Folder ICO - ChangeLog.txt"
global changelog
if !FileExist(inifile)
	{
		gosub makeini
		tooltip Making a new Settings.ini
		SetTimer, RemoveTooltip, -2700
		sleep 1000
	}
Icons = %A_ScriptDir%\Icons
Global Icons
if !Fileexist(Icon)
	{
	; gosub checkinstalledicons
	
	}

}
;--------------------------------------------------

MenuDark(Dark:=2) { ;<<==<-CHANGE DEFAULT HERE. Only the # has to be changed.
static uxtheme := DllCall("GetModuleHandle", "str", "uxtheme", "ptr")
static SetPreferredAppMode := DllCall("GetProcAddress", "ptr", uxtheme, "ptr", 135, "ptr")
static FlushMenuThemes := DllCall("GetProcAddress", "ptr", uxtheme, "ptr", 136, "ptr")
DllCall(SetPreferredAppMode, "int", Dark)
DllCall(FlushMenuThemes)
;https://stackoverflow.com/a/58547831/894589
}
darkmode = true  ; Do not change or delete this line. It will break the toggle function. Even if you change the default below, that overrides this.
MenuDark()

;--------------------------------------------------
OnMessage(0x0201, "WM_LBUTTONDOWNdrag")    ;;∙------∙Gui Drag Pt 1.
;;∙======∙Gui Drag Pt 2∙==========================================∙
WM_LBUTTONDOWNdrag() {
   PostMessage, 0x00A1, 2, 0
}
;; global settings
SetWorkingDir,%A_scriptdir%

SetBatchLines -1
#MaxThreads 255

;; all gui vars
global folderpath
global Iconfile
global iconpath
global iconext
Global noneicowarning
Global IconResource
global applytoallsubs
Global IconIndex
global ChangeNumber
global infotip
global allowTTB
global allow
global OFM
global loadbutton
global icondir
global oldinfotip
desktopIni := folderpath "\desktop.ini"
global desktopIni
existinginimsg := "desktop.ini content.`n`nIf a folder has an existing desktop.ini file it will be displayed here."
folderinfotipmsg := "Add Optional Folder Info Tip"
ScriptName := "Change Folder ICO"
global ScriptName
Global 1stRelease
1stRelease := "v.2025.03.10"
LastUpdate := "v.2025.03.27"
global LastUpdate
Description := "Change Folder Icons from a Quick and Simple GUI"
global Description
githuburl := "https://github.com/indigofairyx/Change-Folder-ICO"
Startlink := A_StartMenu "\Programs\" ScriptName ".lnk"
global startlink
global StartLinkCreated
Icons = %A_ScriptDir%\Icons
Global Icons
;--------------------------------------------------


; INIReadHotkeySection(sectionName)
; INIReadSection(sectionName)
INIReadSection("Programs")
INIReadSection("Settings")


if (StartAsAdmin)
	gosub RunAsAdmin

if (RememberWindowPos)
	OnExit("RememberWinPos")
global x, y
if (iconerror = "" || "ERROR")
	iconerror = %icons%\iconerror.ico

if !FileExist(IconLibrary)
	IconLibrary = C:\Users\%A_UserName%

if (HideTooltips)
	AddTooltip("Deactivate")
else
	AddTooltip("Activate")
	
if (ShowAHKErrorWarnings)
	{
		#warn
	}
else
	{
		Menu, Tray, UseErrorLevel
		#warn, all, Off
		#warn, useenv, off
	}

iniread, showhotkeymenulabel, %inifile%, Hotkeys, showhotkeymenu
; showhotkeymenu= F1 | Show the hotkey menu
showhotkeymenu := RegExReplace(showhotkeymenulabel, "\|.*", "")
; msgbox, shmL: %showhotkeymenulabel%`n`nshm: %showhotkeymenu%
SetTitleMatchMode, 2
menu, k, add,
menu, k, deleteall
menu, k, add, Quick Actions && Hotkeys Menu`t%Showhotkeymenu%, Showhotkeymenu
menu, k, icon, Quick Actions && Hotkeys Menu`t%Showhotkeymenu%, %icons%\hotkeys.ico,,28
menu, k, default, Quick Actions && Hotkeys Menu`t%Showhotkeymenu%
menu, k, add, ; line -------------------------
Hotkey, IfWinActive, - Change Folder .Ico - ahk_class AutoHotkeyGUI
INIReadHotkeySection("Hotkeys")
hotkey, IfWinActive
INIReadHotkeySection("Global_Hotkeys")
; ReadableHotkey := ConvertAHKSymbolToWords(HotkeyValue)
menu, k, add, ; line -------------------------
menu, k, add, General About \ Help`t%AboutMessage%, AboutMessage
menu, k, icon, General About \ Help`t%AboutMessage%, %icons%\about.ico
menu, k, add, Hotkey Help, Hotkeyhelp
menu, k, icon, Hotkey Help, %icons%\about.ico
menu, k, add, Edit Settings File`t%EditCFISettings%, EditCFISettings
menu, k, icon, Edit Settings File`t%EditCFISettings%, %icons%\iniicon.ico
;---------------------------------------------------------------------------


;---------------------------------------------------------------------------
;; tray menu
gosub setmenu
traytiptext =
(
%A_ScriptName%
%Description%
)

trayicon = %icons%\changefoldericon.ico

Menu, Tray, Icon, %icons%\ChangeFolderIcon.ico
Menu, Tray, Tip, %traytiptext%

menu, tray, NoStandard
menu, Tray, Add, Show GUI`t%Show_CFICO_GUI%, Show_CFICO_GUI
menu, Tray, icon, Show GUI`t%Show_CFICO_GUI%, %icons%\ChangeFolderIcon.ico,,24
menu, tray, Default, Show GUI`t%Show_CFICO_GUI%
menu, tray, add, ; line -------------------------
menu, tray, add, Settings Menu >>>`t%ShowSettingsMenu%, :s
menu, tray, icon, Settings Menu >>>`t%ShowSettingsMenu%, %icons%\settingsaltini.ico
menu, tray, add, ; line -------------------------
menu, AHK, Standard
Menu, Tray, Add, AH&Ks Tray Menu >>>, :AHK
Menu, Tray, icon, AH&Ks Tray Menu >>>, %A_ahkpath%
menu, tray, add, ; line -------------------------
menu, tray, add, Reload`t%reloadCFI%, reloadCFI
menu, tray, icon, Reload`t%reloadCFI%, %icons%\reload.ico
Menu, tray, add, Quit \ Exit`t%exit%, exit
Menu, tray, icon, Quit \ Exit`t%exit%, %icons%\exitapp.ico

 if (showMenuBar) ;if (A_Username = "CLOUDEN")
	{
	gosub folderhistorymenu
	gosub setmenu
	menu, guimenu, add, Settings, :s
	menu, guimenu, add, History, :h
	menu, guimenu, add, Live Hotkeys, :K
	if WinExist("ahk_class dopus.lister")
		{
			gosub opendopustabsmenu
			gosub dopeiconmenu
			menu, guimenu, add, Dopus Open, :f
			menu, guimenu, add, Dopus Load, :d
		}
	menu, guimenu, add, Tray Menu, :tray
	Gui, Menu, guimenu 
	}

if (DarkMode)
	{
		DarkMode := true
		MenuDark(2) ; Set to ForceDark
gosub changefoldericonGUI
	}
	else
	{
		DarkMode := false
		MenuDark(3) ; Set to ForceLight
		gosub changefoldericonGUILightMode
	}

if (FirstRun = "1")
	{
	IniWrite, 0, %inifile%, Settings, FirstRun
	showcenter := 1
	sleep 400
	; msgbox go to bed
	gosub helloandwelcome
	}

Return ;; first return
;--------------------------------------------------
Show_CFICO_GUI:
if WinExist("- Change Folder .Ico -")
	{
	WinRestore
	WinActivate
	}
else
	{
	gui, new
	gosub changefoldericonGUI
	}
return
;--------------------------------------------------
changefoldericonGUI:  ;; start Gui

Gui, Font, s10 c0xBEFED3, Consolas
gui, color, 171717, 090909
gui, font, s5
gui, add, text, x0 y0 hidden, .
Gui, Font, s10

Gui, Font, s12
Gui, Add, Text, xm cyellow, #1 Pick a Folder to`n apply a custom icon to...
Gui, Font, s10


gui, add, picture, hwndhsmenu gShowsettingsmenu w24 h24 x+m, %icons%\settingsaltini.ico
AddTooltip(hsmenu, "Settings Menu")
gui, add, picture, hwndhhkmenu gShowhotkeymenu w24 h24 x+m, %icons%\hotkeys.ico
addtooltip(hhkmenu, "Live Hotkey \ Quick Actions Menu")


gui, add, picture, x+m w24 h24 gshowopenfoldermenu hwndhOFMtt vOFM, %icons%\openfolders.ico 
AddTooltip(hOFMtt, "Open Folders of the working`nfields in your file manager.")

if (StartOnTop)
	Gui, Add, CheckBox, hWndhpintip vpin gpinunpin +Checked x+15+m, Pin\Unpin to Top ;
else
	Gui, Add, CheckBox, hWndhpintip vpin gpinunpin x+15+m, Pin\Unpin to Top ;

iconpath := A_ScriptDir "\Icons\ChangeFolderIcon.ico"


Gui, Add, Button, XM vPF hwndPF hwndhpicfolder  gpickfolder w40 h23 , ...
GuiControlGet, hwndPF , Hwnd, PF
DllCall("uxtheme\SetWindowTheme", "ptr", hwndPF , "str", "DarkMode_Explorer", "ptr", 0)
addtooltip(hpicfolder, "Browse for a Folder or paste a path below.")
GuiButtonIcon(hpicfolder, "shell32.dll", 4, "s16 a0")

if winexist("ahk_class dopus.lister")
	If FileExist("C:\Program Files\GPSoftware\Directory Opus\dopusrt.exe")
		gui, add, Picture, hwndhdope x+m w24 h24 gShowLoadFolderfromDOPUSmenu, C:\Program Files\GPSoftware\Directory Opus\dopusrt.exe
	else
		gui, add, Picture, hwndhdope x+m w24 h24 gShowLoadFolderfromDOPUSmenu, explorer.exe
AddTooltip(hdope, "Load a folder from a Dopus tab.")


gui, add, picture, hwndhcheckclip gcheckclipboard4FOLDER x+m w24 h24, %icons%\checkclipboard.ico
addtooltip(hcheckclip, "Check your clipboard.`nIf you have a file or folder path in it,`nclick here to load it automatically.")
if (RememberHistory)
	gui, add, picture, hwndhhistorybut vhashistory gshowfolderhistorymenu x+m w24 h24 , %a_scriptdir%\Icons\folderhistory.ico
else
	gui, add, picture, hwndhhistorybut vhashistory gshowfolderhistorymenu x+m w24 h24 hidden, %a_scriptdir%\Icons\folderhistory.ico
addtooltip(hhistorybut, "Pick & Reload from your history`nof 30 previously edited folders & icons.")

Gui, Add, Button, X+M hwndhloadbut vloadbutton gLoadFolderPath h23 w175 , Load Folder [%LoadFolderPath%]
GuiControlGet, hwndloadbutton , Hwnd, loadbutton
DllCall("uxtheme\SetWindowTheme", "ptr", hwndloadbutton , "str", "DarkMode_Explorer", "ptr", 0)
GuiButtonIcon(hloadbut, "Shell32.dll", 111, "s22 a1 r5")
; gui, add, button, x+m hwndhloadbut vloadbutton gLoadFolderPath, Load Folder [%LoadFolderPath%]
addtooltip(hloadbut, "If a Path is pasted `nclick here to check its desktop.ini info.`n`nIf found it will be loaded below.")

;-------------------------
Gui, Add, Edit, hWndhFolderedit vfolderpath xm w475 h21 genableloadButton, ;; edit1
addtooltip(hFolderedit, "Folder Path")

Gui, Font, s12
Gui, Add, Text, xm cyellow, #2 Pick an Icon file to`n apply to the above folder...
Gui, Font, s10

Gui, Add, Button, XM vPI gPickIcon w40 h23 hWndhPI , ...
GuiControlGet, hwndPI , Hwnd, PI
DllCall("uxtheme\SetWindowTheme", "ptr", hwndPI , "str", "DarkMode_Explorer", "ptr", 0)
GuiButtonIcon(hPI, "shell32.dll", 20, "s16 a0")
; Gui, Add, Button, hWndhPI vPI gPickIcon xm w29 h23, ... ;; light button
addtooltip(hPI, "Browse for an .Ico file or paste a path below.*`n`n** .ico format recommend.")
gui, add, picture, w24 h24 hwndhicoclip gcheckclipboard4ICO x+m, %icons%\clipboardicon.ico
addtooltip(hicoclip, "Check your clipboard.`nIf you have an .ico file in it,`nclick here to load`n& preview it automatically.")
Gui, Add, Button, vpreviewbutton gPreviewIcon x+m hwndhPreviewloadx w125 h24, Preview .Ico
GuiControlGet, hwndpreviewbutton , Hwnd, previewbutton
DllCall("uxtheme\SetWindowTheme", "ptr", hwndpreviewbutton , "str", "DarkMode_Explorer", "ptr", 0)
GuiButtonIcon(hPreviewloadx, "Icons\previeweye.ico", 1, "s20 a1 r5")
; gui, add, button, hwndhPreviewloadx x+m vpreviewbutton gPreviewIcon, Preview .Ico  ; hidden
addtooltip(hPreviewloadx, "Load an .ico file into the`npreview box.")
gui, add, picture, x+m w16 h16 hwndhicowarn vnoneicowarning gdllmsgbox hidden, %icons%\attention.ico ; Hidden +Border
addtooltip(hicowarn,"This icon file isn't an .ico`nClick here for more info...")
	
gui, add, picture, x320 y105 w64 h64 hwndhicoprev vIconPreview gdonothing border, %iconpath% ; %icons%\ChangeFolderIcon.ico
addtooltip(hicoprev, "Icon Preview`n   ~64x64~")
Gui, Add, Edit, hWndhiconedit vIconPath genablepreviewButton xm w475 h21 ;gapplyicon gloadiconpreview ;; edit 2
addtooltip(hiconedit, "Icon Path")
if (ShowAppBar)
	{
	gui, add, text, gdonothing hwndhapps xm, Icon Apps Launcher ...
	AddTooltip(happs, "Quick links for programs.`n`n**Set the paths to your Icons Apps in the setting file.`nWhen a .ico filepath is in the edit box above,`nit will open that path in your software,`nor if empty, it just launches the program.")
	if FileExist(IconViewer)
		Gui, add, picture, hwndhicv x+10+m w24 h24 vIV gIconRunner, %iconViewer%
	addtooltip(hicv, "Icon Viewer")
	if FileExist(IconConverter)
		GUI, add, Picture, hwndhictt x+m w24 h24 vIC gIconRunner, %IconConverter%
	addtooltip(hictt, "Icon Converter")
	if FileExist(IconEditor1)
		Gui, add, picture, hwndhice14 x+m w24 h24 vIE1 gIconRunner, %iconeditor1%
	addtooltip(hice14, "Icon Editors 1 - 4 *")
	if FileExist(IconEditor2)
		Gui, add, picture, x+m w24 h24 vIE2 gIconRunner, %iconeditor2%
	if FileExist(IconEditor3)
		Gui, add, picture, x+m w24 h24 vIE3 gIconRunner, %iconeditor3%
	if FileExist(IconEditor4)
		Gui, add, picture, x+m w24 h24 vIE4 gIconRunner, %iconeditor4%
	if FileExist(mspaint)
		Gui, add, picture, hwndhmspaint1 x+m w24 h24 vMSP gIconRunner, %mspaint% ;C:\Windows\System32\mspaint.exe
	addtooltip(hmspaint1, "Open .Ico in MS Paint")
	if Fileexist(everything15a)
		gui, add, Picture, hwndhe x+m w24 h24 vev15a gIconRunner, %everything15a%
	addtooltip(he, "Search for .Ico Files via Everything.`n`nSearch Terms from the Icon Path`nwill be sent.")
	}

;-------------------------
Gui, Add, Edit, xm w468 r7 +readonly vIniPreview Disabled, %existinginimsg% ;; inipreviw edit3
gui, add, text, xm vtexthasini cyellow hidden , This folder has a desktop.ini file.
gui, add, picture, section x+m w24 h24 hwndhISINI vhasini gopenini hidden, %icons%\editdoc.ico ; hidden
addtooltip(hisini, "This Folder has an existing desktop.ini file.`nYou can click here to edit it directly in notepad or default app.")


Gui, Add, CheckBox, x+m w15 h15 hwndhtbinbox vallowDELINI gAllowOptions hidden,
addtooltip(htbinbox, "Check this to allow the`nDeleting of this desktop.ini`nDoing this will get rid of a custom icon.")
gui, add, picture, x+y h24 w24 hwndhtbpic vDELINI gDeletedesktopini hidden disabled, %icons%\trashbin.ico
addtooltip(htbpic, "Send this desktop.ini`nto the Recycle Bin!!`n`n**Deleting Windows system folder desktop.ini`, `ne.g. 'My Documents' can cause errors!!`nAnd Windows will usually put them back anyway.")
;-------------------------
gui, add, text, x+m vFPatb, 
gui, add, text, x+m gdonothing hwndhatb, |
addtooltip(hatb, "Folder Path &|& desktop.ini`n Attributes")
gui, add, text, x+m vINIatb, 
	
	
;-------------------------
Gui, Add, Text, xm w475 h2 +0x10 ;add, ; line -------------------------
if (ShowInfoTipExtras)
	{
	Gui, Add, CheckBox, xm w204 h23 hwndhaddtt vallowTTB gAllowOptions , Add Folder Info Tip ...
	addtooltip(haddtt, "You can add an optional InfoTip here`,`nwhich will display as a comment when`nhover over this folder in a file manager.")

	Gui, Add, CheckBox, x+m h23 hwndhicodixO vChangeNumber gAllowOptions, Override IconIndex #`, *
	Gui, Add, Edit, hWndINtip vIconIndex gapplyicon x+y-15 w52 h21  +Disabled, 0 ; +Number ; ;; edit4
	addtooltip(hicodixO, "Apply a custom IconResource Index #`n** EXPERIMENTAL !! Click .dll attention button above.")

	Gui, Add, Edit, xm w468 r3 +Disabled vInfoTip, ;+disabled

	Gui, Add, Text, xm w475 h2 +0x10 ;add, ; line -------------------------
	}

;; more options??

; Gui, Add, Button, xm w158 h34 gSetNewIcon, Set New Icon - [%setnewicon%]  ;&set
Gui, Add, Button, XM vSaveIcon gSetNewIcon w144 h34 hwndsaveicon, Set Icon [%setnewicon%]
GuiControlGet, hwndSaveIcon , Hwnd, SaveIcon
DllCall("uxtheme\SetWindowTheme", "ptr", hwndSaveIcon , "str", "DarkMode_Explorer", "ptr", 0)
; GuiButtonIcon(SaveIcon, File, Index := 1, Options := "")
GuiButtonIcon(SaveIcon, "shell32.dll", 259, "s32 a0 l5")

gui, add, picture, icon270 x+m section h16 w16, imageres.dll
if (ForceApplyNOW)
	Gui, Add, CheckBox, hWndhREXPtip vforcewindownsreload gapplyicon x+m +Checked, Force Windows to Apply Icon New Now !** ; x16 y488 w226 h41 gapplyicon
else
	Gui, Add, CheckBox, hWndhREXPtip vforcewindownsreload gapplyicon x+m , Force Windows to Apply Icon New Now !** ; x16 y488 w226 h41 gapplyicon
addtooltip(hrexptip,"When Checked --> This will force a restart of Windows Explorer`nand reloads windows icon cache, to apply new icons instantly.`n`n**! It will close any File Explorer windows you have open!`nIf you're using Dopus ignore this.")

gui, add, picture, icon301 xs h16 w16, shell32.dll
Gui, Add, CheckBox, hWndhallsubswarn vapplytoallsubs gapplyicon x+m, Apply this Icon to ALL Subfolders ** 
addtooltip(hallsubswarn,"This will create a desktop.ini file in every`nsub-folder below the chosen path so that`nthe entire folder tree will have the same icon.`n`n**All other ini settings will be reset to Generic!")
;"
Gui, Add, Text, xm w475 h2 +0x10 ;add, ; line -------------------------

; gui, add, button, xm hwndhanE h22 gfastsetnewicon, Fast Set - Apply Now! && Exit - [%fastsetnewicon%]
Gui, Add, Button, XM vFastset gfastsetnewicon h22 w357 hwndhanE , Fast Set - Apply Now! && Exit - [%fastsetnewicon%]
GuiControlGet, hwndFastset , Hwnd, Fastset
DllCall("uxtheme\SetWindowTheme", "ptr", hwndFastset , "str", "DarkMode_Explorer", "ptr", 0)
addtooltip(hanE, "For a Speedy Icon Change -->`nApply Icon`nReload Windows Explorer`nand Exit This App!")
GuiButtonIcon(hanE, "shell32.dll", 300, "s20 a1 r10")


; Gui, Add, Button, xm h22 gexit, Quit \ Exit - [%exit%]
Gui, Add, Button, XM vei gexit h22 w175 hwndhexi , Quit \ Exit - [%exit%]
GuiControlGet, hwndei , Hwnd, ei
DllCall("uxtheme\SetWindowTheme", "ptr", hwndei , "str", "DarkMode_Explorer", "ptr", 0)
GuiButtonIcon(hexi, "Icons\exitapp.ico", 1, "s20 a1 r10")


; Gui, Add, Button, x+m hwndhrestbut h22 gReload, Reload App - [%reloadCFI%] ; x+s+y
Gui, Add, Button, X+M vre gReload h22 w175 hwndhrestbut , Reload App - [%reloadCFI%]
GuiControlGet, hwndre , Hwnd, re
DllCall("uxtheme\SetWindowTheme", "ptr", hwndre , "str", "DarkMode_Explorer", "ptr", 0)
AddTooltip(hrestbut, "Reload CFI to Clear & Reset all input boxes")
GuiButtonIcon(hrestbut, "Icons\reload.ico", 1, "s20 a1 r10")

Gui, +hWndhMainWnd -MaximizeBox +Border +LastFound ; +E0x10 +0x200
; Gui, +E0x10  ; WS_EX_ACCEPTFILES
; Gui, +E0x10  +E0x200  ; Allow file drops

if (StartOnTop)
	Gui,  +AlwaysOnTop 
if (RememberWindowPos)
	{
		IniRead, X, %IniFile%, WindowPos, X, 500
		IniRead, Y, %IniFile%, WindowPos, Y, 500
		Gui, Show, x%X% y%Y%, - Change Folder .Ico -
	}
else
	Gui, Show, , - Change Folder .Ico - 

if (AutoCheckClipboard4Path)
	gosub checkclipboardonload
guicontrol,focus,folderpath
if (debugonstartup)
	listlinesx()
return ;; end GUI DarkMode ;;  ;; first return 2nd return



changefoldericonGUILightMode:  ;; start Gui light mode
; gui, new
Gui, Font, s10 , Consolas
gui, color, C8C8C8 ;, 090909
gui, font, s5
gui, add, text, x0 y0 hidden, . ; this is here to ui margins
Gui, Font, s10

Gui, Font, s12
Gui, Add, Text, xm , #1 Pick a Folder to`n apply a custom icon to...
Gui, Font, s10


gui, add, picture, hwndhsmenu gShowsettingsmenu w24 h24 x+m, %icons%\settingsaltini.ico
AddTooltip(hsmenu, "Settings Menu")

gui, add, picture, hwndhhkmenu gShowhotkeymenu w24 h24 x+m, %icons%\hotkeys.ico
addtooltip(hhkmenu, "Live Hotkey \ Quick Actions Menu")

gui, add, picture, x+m w24 h24 gshowopenfoldermenu hwndhOFMtt vOFM, %icons%\openfolders.ico 
AddTooltip(hOFMtt, "Open Folders of the working`nfields in your file manager.")

if (StartOnTop)
	Gui, Add, CheckBox, hWndhpintip vpin gpinunpin +Checked x+15+m, Pin\Unpin to Top ;
else
	Gui, Add, CheckBox, hWndhpintip vpin gpinunpin x+15+m, Pin\Unpin to Top ;

iconpath := A_ScriptDir "\Icons\ChangeFolderIcon.ico"


Gui, Add, Button, XM vPF hwndPF hwndhpicfolder  gpickfolder w40 h23 , ...

addtooltip(hpicfolder, "Browse for a Folder or paste a path below.")
GuiButtonIcon(hpicfolder, "shell32.dll", 4, "s16 a0")


; Gui, Add, Button, vPF hwndhpicfolder gpickfolder xm w30 h23, ...

if winexist("ahk_class dopus.lister")
	If FileExist("C:\Program Files\GPSoftware\Directory Opus\dopusrt.exe")
		gui, add, Picture, hwndhdope x+m w24 h24 gShowLoadFolderfromDOPUSmenu, C:\Program Files\GPSoftware\Directory Opus\dopusrt.exe
	else
		gui, add, Picture, hwndhdope x+m w24 h24 gShowLoadFolderfromDOPUSmenu, explorer.exe
AddTooltip(hdope, "Load a folder from a Dopus tab.")


gui, add, picture, hwndhcheckclip gcheckclipboard4FOLDER x+m w24 h24, %icons%\checkclipboard.ico
addtooltip(hcheckclip, "Check your clipboard.`nIf you have a file or folder path in it,`nclick here to load it automatically.")
if (RememberHistory)
	gui, add, picture, hwndhhistorybut vhashistory gshowfolderhistorymenu x+m w24 h24 , %a_scriptdir%\Icons\folderhistory.ico
else
	gui, add, picture, hwndhhistorybut vhashistory gshowfolderhistorymenu x+m w24 h24 hidden, %a_scriptdir%\Icons\folderhistory.ico
addtooltip(hhistorybut, "Pick & Reload from your history`nof 30 previously edited folders & icons.")


Gui, Add, Button, X+M hwndhloadbut vloadbutton gLoadFolderPath h23 w175 , Load Folder [%LoadFolderPath%]
GuiButtonIcon(hloadbut, "Shell32.dll", 111, "s22 a1 r5")
; gui, add, button, x+m hwndhloadbut vloadbutton gLoadFolderPath, Load Folder [%LoadFolderPath%]
addtooltip(hloadbut, "If a Path is pasted `nclick here to check its desktop.ini info.`n`nIf found it will be loaded below.")
;-------------------------
Gui, Add, Edit, hWndhFolderedit vfolderpath xm w475 h21 genableloadButton, ;; edit1
addtooltip(hFolderedit, "Folder Path")

Gui, Font, s12
Gui, Add, Text, xm , #2 Pick an Icon file to`n apply to the above folder...
Gui, Font, s10

Gui, Add, Button, XM vPI gPickIcon w40 h23 hWndhPI , ...
GuiButtonIcon(hPI, "shell32.dll", 20, "s16 a0")


; Gui, Add, Button, hWndhPI vPI gPickIcon xm w29 h23, ... ;; light button
addtooltip(hPI, "Browse for an .Ico file or paste a path below.*`n`n** .ico format recommend.")
gui, add, picture, w24 h24 hwndhicoclip gcheckclipboard4ICO x+m, %icons%\clipboardicon.ico
addtooltip(hicoclip, "Check your clipboard.`nIf you have an .ico file in it,`nclick here to load`n& preview it automatically.")

Gui, Add, Button, vpreviewbutton gPreviewIcon x+m hwndhPreviewloadx w125 h24, Preview .Ico
GuiButtonIcon(hPreviewloadx, "Icons\previeweye.ico", 1, "s20 a1 r5")

; gui, add, button, hwndhPreviewloadx x+m vpreviewbutton gPreviewIcon, Preview .Ico  ; hidden
addtooltip(hPreviewloadx, "Load an .ico file into the`npreview box.")
gui, add, picture, x+m w16 h16 hwndhicowarn vnoneicowarning gdllmsgbox hidden, %icons%\attention.ico ; Hidden +Border
addtooltip(hicowarn,"This icon file isn't an .ico`nClick here for more info...")
	
gui, add, picture, x320 y105 w64 h64 hwndhicoprev vIconPreview gdonothing border, %iconpath% ; %icons%\ChangeFolderIcon.ico
addtooltip(hicoprev, "Icon Preview`n   ~64x64~")
Gui, Add, Edit, hWndhiconedit vIconPath genablepreviewButton xm w475 h21 ;gapplyicon gloadiconpreview ;; edit 2
addtooltip(hiconedit, "Icon Path")
if (ShowAppBar)
	{
	gui, add, text, gdonothing hwndhapps xm, Icon Apps Launcher ...
	AddTooltip(happs, "Quick links for programs.`n`n**Set the paths to your Icons Apps in the setting file.`nWhen a .ico filepath is in the edit box above,`nit will open that path in your software,`nor if empty, it just launches the program.")
	if FileExist(IconViewer)
		Gui, add, picture, hwndhicv x+10+m w24 h24 vIV gIconRunner, %iconViewer%
	addtooltip(hicv, "Icon Viewer")
	if FileExist(IconConverter)
		GUI, add, Picture, hwndhictt x+m w24 h24 vIC gIconRunner, %IconConverter%
	addtooltip(hictt, "Icon Converter")
	if FileExist(IconEditor1)
		Gui, add, picture, hwndhice14 x+m w24 h24 vIE1 gIconRunner, %iconeditor1%
	addtooltip(hice14, "Icon Editors 1 - 4 *")
	if FileExist(IconEditor2)
		Gui, add, picture, x+m w24 h24 vIE2 gIconRunner, %iconeditor2%
	if FileExist(IconEditor3)
		Gui, add, picture, x+m w24 h24 vIE3 gIconRunner, %iconeditor3%
	if FileExist(IconEditor4)
		Gui, add, picture, x+m w24 h24 vIE4 gIconRunner, %iconeditor4%
	if FileExist(mspaint)
		Gui, add, picture, hwndhmspaint1 x+m w24 h24 vMSP gIconRunner, %mspaint% ;C:\Windows\System32\mspaint.exe
	addtooltip(hmspaint1, "Open .Ico in MS Paint")
	if Fileexist(everything15a)
		gui, add, Picture, hwndhe x+m w24 h24 vev15a gIconRunner, %everything15a%
	addtooltip(he, "Search for .Ico Files via Everything.`n`nSearch Terms from the Icon Path`nwill be sent.")
	}

;-------------------------
Gui, Add, Edit, xm w468 r7 +readonly vIniPreview Disabled, %existinginimsg% ;; inipreviw edit3
gui, add, text, xm vtexthasini cyellow hidden , This folder has a desktop.ini file.
gui, add, picture, section x+m w24 h24 hwndhISINI vhasini gopenini hidden, %icons%\editdoc.ico ; hidden
addtooltip(hisini, "This Folder has an existing desktop.ini file.`nYou can click here to edit it directly in notepad or default app.")


Gui, Add, CheckBox, x+m w15 h15 hwndhtbinbox vallowDELINI gAllowOptions hidden,
addtooltip(htbinbox, "Check this to allow the`nDeleting of this desktop.ini`nDoing this will get rid of a custom icon.")
gui, add, picture, x+y h24 w24 hwndhtbpic vDELINI gDeletedesktopini hidden disabled, %icons%\trashbin.ico
addtooltip(htbpic, "Send this desktop.ini`nto the Recycle Bin!!`n`n**Deleting Windows system folder desktop.ini`, `ne.g. 'My Documents' can cause errors!!`nAnd Windows will usually put them back anyway.")
;-------------------------
gui, add, text, x+m vFPatb, 
gui, add, text, x+m gdonothing hwndhatb, |
addtooltip(hatb, "Folder Path &|& desktop.ini`n Attributes")
gui, add, text, x+m vINIatb, 
	
	
;-------------------------
Gui, Add, Text, xm w475 h2 +0x10 ;add, ; line -------------------------
if (ShowInfoTipExtras)
	{
	Gui, Add, CheckBox, xm w204 h23 hwndhaddtt vallowTTB gAllowOptions , Add Folder Info Tip ...
	addtooltip(haddtt, "You can add an optional InfoTip here`,`nwhich will display as a comment when`nhover over this folder in a file manager.")

	Gui, Add, CheckBox, x+m h23 hwndhicodixO vChangeNumber gAllowOptions, Override IconIndex #`, *
	Gui, Add, Edit, hWndINtip vIconIndex gapplyicon x+y-15 w52 h21  +Disabled, 0 ; +Number ; ;; edit4
	addtooltip(hicodixO, "Apply a custom IconResource Index #`n** EXPERIMENTAL !! Click .dll attention button above.")

	Gui, Add, Edit, xm w468 r3 +Disabled vInfoTip, ;+disabled

	Gui, Add, Text, xm w475 h2 +0x10 ;add, ; line -------------------------
	}

;; more options??

; Gui, Add, Button, xm w158 h34 gSetNewIcon, Set New Icon - [%setnewicon%]  ;&set
Gui, Add, Button, XM vSaveIcon gSetNewIcon w144 h34 hwndsaveicon, Set Icon [%setnewicon%]

GuiButtonIcon(SaveIcon, "shell32.dll", 259, "s32 a0 l5")

gui, add, picture, icon270 x+m section h16 w16, imageres.dll
if (ForceApplyNOW)
	Gui, Add, CheckBox, hWndhREXPtip vforcewindownsreload gapplyicon x+m +Checked, Force Windows to Apply Icon New Now !** ; x16 y488 w226 h41 gapplyicon
else
	Gui, Add, CheckBox, hWndhREXPtip vforcewindownsreload gapplyicon x+m , Force Windows to Apply Icon New Now !** ; x16 y488 w226 h41 gapplyicon
addtooltip(hrexptip,"When Checked --> This will force a restart of Windows Explorer`nand reloads windows icon cache, to apply new icons instantly.`n`n**! It will close any File Explorer windows you have open!`nIf you're using Dopus ignore this.")

gui, add, picture, icon301 xs h16 w16, shell32.dll
Gui, Add, CheckBox, hWndhallsubswarn vapplytoallsubs gapplyicon x+m, Apply this Icon to ALL Subfolders ** 
addtooltip(hallsubswarn,"This will create a desktop.ini file in every`nsub-folder below the chosen path so that`nthe entire folder tree will have the same icon.`n`n**All other ini settings will be reset to Generic!")
;"
Gui, Add, Text, xm w475 h2 +0x10 ;add, ; line -------------------------

Gui, Add, Button, XM vFastset gfastsetnewicon h22 w357 hwndhanE , Fast Set - Apply Now! && Exit - [%fastsetnewicon%]
addtooltip(hanE, "For a Speedy Icon Change -->`nApply Icon`nReload Windows Explorer`nand Exit This App!")
GuiButtonIcon(hanE, "shell32.dll", 300, "s20 a1 r10")


; Gui, Add, Button, xm h22 gexit, Quit \ Exit - [%exit%]
Gui, Add, Button, XM vei gexit h22 w175 hwndhexi , Quit \ Exit - [%exit%]
GuiButtonIcon(hexi, "Icons\exitapp.ico", 1, "s20 a1 r10")


Gui, Add, Button, X+M vre gReload h22 w175 hwndhrestbut , Reload App - [%reloadCFI%]
AddTooltip(hrestbut, "Reload CFI to Clear & Reset all input boxes")
GuiButtonIcon(hrestbut, "Icons\reload.ico", 1, "s20 a1 r10")

Gui, +hWndhMainWnd -MaximizeBox +Border +LastFound ; +E0x10 +0x200

if (StartOnTop)
	Gui,  +AlwaysOnTop 
if (RememberWindowPos)
	{
		IniRead, X, %IniFile%, WindowPos, X, 500
		IniRead, Y, %IniFile%, WindowPos, Y, 500
		Gui, Show, x%X% y%Y%, - Change Folder .Ico -
	}
else
	Gui, Show, , - Change Folder .Ico - 

if (AutoCheckClipboard4Path)
	gosub checkclipboardonload
guicontrol,focus,folderpath
if (debugonstartup)
	listlinesx()


return ;; end GUI DarkMode ;;  ;; first return 2nd return
;---------------------------------------------------------------------------


resetCFIgui: ; #TODO ** and then order them. ** √ ~~this needs a 3rd label reset:, update:, and cleanup:~~
GuiControl,, folderpath
; guicontrol,hide,OFM
; GuiControl,hide,loadbutton
updateCFIgui: ;; if 
GuiControl,, IconPath ; %iconpath%  ; Update icon edit box
GuiControl,, IconPreview ; %iconpath%  ; Update icon preview
guicontrol,, ChangeNumber,0
GuiControl,, IconIndex, 0 ; %iconindex%  ; Update icon index
;-------------------------
; GuiControl,hide,loadbutton
guicontrol,,IniPreview, %existinginimsg%
guicontrol,hide,hasini
guicontrol,hide,delini
guicontrol,hide,allowdelini
guicontrol,hide,noneicowarning
guicontrol,disabled, IniPreview
guicontrol,, allowTTB,0
guicontrol,disabled,InfoTip
guicontrol,, InfoTip
GuiControl,hide,texthasini
; guicontrol,disabled,ApplyFolderType
; cleanupCFIgui: ;; if #todo do i need a third clean up here???
; guicontrol,, allowFT,0
return

#ifwinactive - Change Folder .Ico - ahk_class AutoHotkeyGUI
~Lbutton:: ;; double click to select all in edit boxes
if (A_PriorHotkey != "~Lbutton" or A_TimeSincePriorHotkey > 300)
	{
		KeyWait, Lbutton, u
		return
	}
else
	{
		sleep 20
		send ^a
	}
return

#ifwinactive 

donothing:
return
enableloadButton:
GuiControl,show,loadbutton
return
enablepreviewbutton:
gui,submit,nohide
if FileExist(iconpath)
	{
	splitpath,iconpath,,,ext
	if (ext = "ico")
		{
		GuiControl,show,previewbutton
		return
		}
	}
return

AllowOptions:
gui, submit, nohide
if (allowTTB=1)
	guicontrol,Enabled,InfoTip
else
	guicontrol,Disabled,InfoTip
if (ChangeNumber)
	GuiControl,Enable,IconIndex
else
	{
	GuiControl,Disabled,IconIndex
	guicontrol,text,IconIndex,0
	}
if (allowDELINI)
	GuiControl,Enable,DELINI
else
	{
	GuiControl,Disable,DELINI
	}
return

openini:
try run, "%desktopini%"
catch
try run, nopepad++.exe "%desktopini%"
catch
try run, notepad.exe "%desktopini%"
return

AlwaysOnTopToggle:
pinunpin:
gui, submit, nohide
if (pin)
	Gui, +alwaysontop
else
	Gui, -alwaysontop
return

Browse4FOLDERtoLoad:
pickfolder:
FileSelectFolder, folderpath, *C:\Users\%a_username%,6,Select A Folder that you want to set a custom Icon to...
if !FileExist(folderpath) ;; this should never happen with the fileseletfolder but just-in-case.
	{
	tooltip, ERR! @ Line:  %A_LineNumber% -- %A_scriptname%`n`nFolder Doesn't Exist! Operation Canceled.
	SetTimer, RemoveTooltip, -2000	
	return	
	}
GuiControl,, folderpath, %folderpath%
; guicontrol,show,OFM
Gosub, loadFolderPath 
Return

checkclipboard4FOLDER:
if FileExist(clipboard)
	gosub checkclipboardonload
else
	{
	tooltip, Your clipboard does not contain`nan existing folder\file path.
	SetTimer, RemoveTooltip, -2000	
	}
return
checkclipboardonload:
;; onload check the clipboard for an existing filepath, if found load it automatically into the folderpath.
if FileExist(clipboard)
{
	SplitPath,clipboard,,,ext
	if (ext = "ico")
		{
			GuiControl,,iconpath,%clipboard%
			gosub PreviewIcon
gosub autoloadtt
			return
		}
	else
	{
		FileGetAttrib, clipboardcheck, %clipboard%
		if InStr(clipboardcheck, "D")
			{
				guicontrol,,folderpath,%clipboard%
				gosub LoadFolderPath
gosub autoloadtt
				Return
			}
		else
			{
				splitpath,clipboard,filename,folderpath
				guicontrol,,folderpath,%folderpath%
				gosub LoadFolderPath
gosub autoloadtt
				Return
			}
	}
}
return

autoloadtt:
tooltip Your clipboard contained an`nexisting folder path or icon.`nIt was automatically loaded into the GUI...
SetTimer, RemoveTooltip, -3000
return



LoadFolderPath: ;; load the pasted folder path , read existing icon info from a desktop.ini if found
folderpath := ""
iconpath := ""
iconext := ""
noneicowarning := ""
IconResource := ""
iconindex := ""

autoLoadFolderPath:
sleep 10
gui, submit, nohide
;; reset guicontrols from the start
sleep 50
gosub updateCFIgui
sleep 50

FileGetAttrib, filecheck, %folderpath% ; check if the pasted path is a file. && that it exists ; msgbox %filecheck%
if InStr(filecheck,"D") ;; it's a folder
	{

	guicontrol,,FPatb,%filecheck%
	goto inicheck
	}
else ; it's a file check
{
	splitpath, folderpath, , FileCheckDir
	folderpath := FileCheckDir
	if !FileExist(folderpath)
		{
			Tooltip, ERR! @ Line#:  %A_LineNumber%`nThe Folder path pasted here cannot be found!
			SetTimer, RemoveTooltip, -2000	
			Return
		}
	else
		{
			GuiControl,, folderpath, %filecheckdir%
			FileGetAttrib,filecheck, %filecheckdir%
			guicontrol,,FPatb,%filecheckdir%
			Tooltip, This is FILE. Loading the Parent Directory instead.`nFinal Path: %folderpath%
			SetTimer, RemoveTooltip, -2000	
			; guicontrol,show,OFM
			goto inicheck
		}
}
return

inicheck:
inireaderror := "There was an ERROR reading this desktop.ini file."
inireadempty := "There was no content in this desktop.ini`nThere was not text found in it."

desktopIni := folderpath "\desktop.ini" ;; look for a desktop.ini file

if !FileExist(desktopini) ;; if a desktop.ini file doesn't exits reset all the guicontrols except the folder
	{
	goto updateCFIgui
	return ;; and stop
	}

FileRead, inicontent, %desktopini% ; Read desktop.ini content
FileGetAttrib,INIatb,%desktopini%
GuiControl,,iniatb,%iniatb%
if (inicontent = "")
	{ ;; the desktopini is empty or can't be read
		GuiControl,,inipreview,%inireadempty%
	}
	
if (inicontent = "ERROR")
	{ ;; the desktopini is empty or can't be read
		GuiControl,,inipreview,%inireaderror%
	}
	
GuiControl,show,texthasini
GuiControl,enable,IniPreview, ; %inicontent%
GuiControl,,IniPreview,%inicontent%
guicontrol,show,allowdelini
guicontrol,show,delini
guicontrol,show,hasini

if (ShowInfoTipExtras) ; read and load InfoTip
	{
	IniRead, InfoTip, %desktopini%, .ShellClassInfo, InfoTip, %A_space%
	if (InfoTip != "")
		guicontrol,,InfoTip,%InfoTip%
	}  

goto inilookforicon
return
;-------------------------
ShowError(lineNum, folderpath, IconResource, iconpath, iconfile, iconindex, desktopini)
	{
	MsgBox wtfahk Error at line %lineNum% .`n`nFolderPath: %folderpath%`n`nIconResource=%IconResource%`n`nIconPath= %iconpath%`nIconFile=%iconfile%`n`niconindex`,%iconindex%`n`nReading desktop.ini: %desktopini%`n
	}
; ShowError(A_LineNumber, folderpath, IconResource, iconpath, iconfile, desktopini)
;------------------------- 
inilookforicon:
; GuiControlGet, currentIconPath,, iconpath
; Try reading "IconResource" first, this is most common
IniRead, IconResource, %desktopIni%, .ShellClassInfo, IconResource, %A_Space%
IniRead, IconFile, %desktopIni%, .ShellClassInfo, IconFile, %A_Space%

;-------------------------  START GETINIICON LOGIC
if (IconResource = "" && iconfile = "")
	{
		; No IconResource and no IconFile - Possibly no desktop.ini or Windows CLSID folder
		; ShowError(A_LineNumber, folderpath, IconResource, iconpath, iconfile, desktopini)
		; guicontrol,,iconpath, No iconpath was found in this desktop.ini
	} 
else if (IconResource != "" && iconfile = "")
	{
		; IconResource exists correctly, and no IconFile is present
		goto SeparateIconResource
		; ShowError(A_LineNumber, folderpath, IconResource, iconpath, iconfile, desktopini)
	} 
else if (IconResource != "" && iconfile != "")
	{
		; Both IconResource and IconFile exist - Should IconFile be removed?
		goto SeparateIconResource
		; ShowError(A_LineNumber, folderpath, IconResource, iconpath, iconfile, desktopini)
	}
else if (IconResource = "" && iconfile != "")
	{
		; IconFile exists and needs to be converted to IconResource
		if (ShowInfoTipExtras)
			{
				IniRead, IconIndex, %desktopIni%, .ShellClassInfo, IconIndex, 0
				guicontrol,,IconIndex,%iconindex%
			}
		if FileExist(iconfile)
			{
				guicontrol,,iconpath,%iconfile%
				gosub checkico
			}
		else
			gosub findiconpath
		; ShowError(A_LineNumber, folderpath, IconResource, iconpath, iconfile, desktopini)
	} 
return



;; broken, not seeing relative paths
SeparateIconResource:
if (IconResource != "")
	{
	
	RegExMatch(IconResource, ",[[:space:]]*([-]?\d+)$", match) ; Set the icon index to the GUI control (defaults to 0 if not found)
    iconindex := match1 != "" ? match1 : 0
    guicontrol,,IconIndex,%iconindex%
    iconpath := RegExReplace(IconResource, ",[[:space:]]*[-]?\d+$", "")
	guicontrol,,iconpath,%iconpath%

			; ShowError(A_LineNumber, folderpath, IconResource, iconpath, iconfile, desktopini)
	if FileExist(iconpath)
		{
			; ShowError(A_LineNumber, folderpath, IconResource, iconpath, iconfile, desktopini)
			guicontrol,,iconpath,%iconpath%
			gosub checkico
		}
	else
		{
			; ShowError(A_LineNumber, folderpath, IconResource, iconpath, iconfile, desktopini)
			gosub findiconpath
		}
	}
	;-------------------------
return 



;------------------------- 
useIconresource:
checkini_break: 
;-------------------------
findiconpath:
locateiconfile:
if (iconpath != "ERROR")  ; If an icon path is found 
    {
		if instr(iconpath, "%")  ; Normalize environment variables
			{
				EnvGet, sysRoot, SystemRoot
				iconPath := StrReplace(iconPath, "%SystemRoot%", sysRoot)
				iconPath := StrReplace(iconPath, "%WinDir%", sysRoot)
				goto skippedrelative
			; ShowError(A_LineNumber, folderpath, IconResource, iconpath, iconfile, desktopini)
			; gosub checkico
			}
        
        if !InStr(iconpath, ":") ; Handle relative paths for "IconFile" ; No drive letter or full path
			If instr(iconpath, "\")
				{
					iconpath := folderpath iconpath
				; ShowError(A_LineNumber, folderpath, IconResource, iconpath, iconfile, desktopini)
				}
			else
				{
					if (IconResource = "")
						{
						; ShowError(A_LineNumber, folderpath, IconResource, iconpath, iconfile, desktopini)
						iconpath := folderpath "\" iconfile  ; Convert to absolute path ;; todo but he icon might be in sub dir of the folder e.g., iconfile=\icons\thisicon.ico
						}
					else
						{
						iconpath := folderpath "\" iconpath 
				; ShowError(A_LineNumber, folderpath, IconResource, iconpath, iconfile, desktopini)
						guicontrol,,iconpath,%iconpath%
						; iconpath := folderpath "\" IconResource 
						}
				}

		; ShowError(A_LineNumber, folderpath, IconResource, iconpath, iconfile, desktopini)
return
skippedrelative:
        ; Update GUI
        GuiControl,, IconPath, %iconpath%  ; Update icon edit box
		IconPath := GetFileIcon(folderpath)
        GuiControl,, IconPreview, *w64 *h64 %IconPath%  ; Update icon preview ;; og
		gosub checkico

    }
    else
    {
			; ShowError(A_LineNumber, folderpath, IconResource, iconpath, iconfile, desktopini)
        GuiControl,, IconPreview, *w64 *h64 %iconerror%  ; Set to default error icon
    }

	if (Debugonfolderload)
		ListLinesx()

return
checkico:
GuiControlGet, currentIconPath,, iconpath
gui, submit, nohide

global iconpath, nonicowarning
if FileExist(iconpath)
	{
	splitpath, iconpath, ,,iconext
	; MsgBox, path: %iconpath%`n`next: %iconext%`n`nIfile: %iconfile%`n`niRescour: %IconResource%
	if (iconext = "ico")
		{
			; msgbox iconfile: %iconfile% `n`niconpath %iconpath%
			guicontrol,hide,noneicowarning
			GuiControl,show,previewbutton
			GuiControl,, IconPreview, *w64 *h64 %IconPath%  ; Update icon preview
			guicontrol,,iconpath,%iconpath%
			gosub previewicon
		}
	else
		{
			GuiControl,show,noneicowarning
			gosub trytoloaddll
		}
	}
return
trytoloaddll:
; return
        ; Update GUI
		; guicontrol,,iconpath,
        GuiControl,, IconPath, %iconpath%  ; Update icon edit box
		IconPath := GetFileIcon(folderpath)
        GuiControl,, IconPreview, *w64 *h64 %IconPath%  ; Update icon preview ;; og
return


PreviewIcon:
gui,submit,nohide
if FileExist(iconpath)
	{
	splitpath,iconpath,,,ext
	if (ext != "ico")
		{
			tooltip, Sorry only .ico files can manually`n be loaded into the preview at the moment.
			SetTimer, RemoveTooltip, -2000	
			return
		}
	else
		{
			guicontrol,,iconpreview, *w64 *h64 %iconpath%
		}
	}
else
	{
		Tooltip, ERR! This File Cannot be found.`n  @ Line#:  %A_LineNumber%
		SetTimer, RemoveTooltip, -2000	
	}
return

Browse4ICONtoLoad:
pickicon:
FileSelectFile, iconpath, 1, %IconLibrary%, Select an Icon File., Icon Files (*.ico)
if (IconPath = "")
	return
guicontrol,text,IconPath,%IconPath%
guicontrol,,iconpreview, *w64 *h64 %iconpath%
Return


;; claude 2  ;; this breakings pliting the path abput to theck if this fill is dll or not. wtf.
GetFileIcon(File) {
    Global iconerror
    SplitPath, File, , , ext
    
    if (ext = "ico") {
        ; Explicitly load a 64x64 icon
        hIcon := DllCall("LoadImage", "Ptr", 0, "Str", File, "UInt",1, "Int", 64, "Int", 64, "UInt", 0x2008)
        if (hIcon)
            return "HICON:" hIcon
    }
    
    ; Fallback to shell method for other files
    VarSetCapacity(FileInfo, A_PtrSize + 688)
    Flags := 0x102  ; SHGFI_ICON | SHGFI_LARGEICON
    if DllCall("shell32\SHGetFileInfoW", "WStr", File, "UInt", 0, "Ptr", &FileInfo, "UInt", A_PtrSize + 688, "UInt", Flags) {
        hIcon := NumGet(FileInfo, 0, "UPtr")
        return "HICON:" hIcon
    }
    return %iconerror%
}



checkclipboard4ICO:
if FileExist(clipboard)
	{
	FileGetAttrib, foldercheck, %clipboard%
	
	if (InStr(foldercheck, "D"))
		{
			Tooltip, Sorry your clipboard contains a folder.`nTry Loading that above.`nNeed and .ico file here
			SetTimer, RemoveTooltip, -3000	
			return		
		}
	else ; if its file, check for ico
		{
		splitpath,clipboard,,,ext
		; msgbox ext %ext%`n`nc: %clipboard%`n`nip:  %iconpath%
		if (ext = "ico")
			{
				guicontrol,text,iconpath,%clipboard%
				guicontrol,show,OFM
				guicontrol,hide,noneicowarning
				guicontrol,,iconpreview,%iconpath%
				goto PreviewIcon
			}
		else
			{
				tooltip Sorry at the moment this`n preview can only handle .ico files
				SetTimer, RemoveTooltip, -2500
				return
			
			}
		
		}
	}
else
	{
		tooltip, Your clipboard does not contain`nan existing file path.
		SetTimer, RemoveTooltip, -2000	
	}
return


runicon:

ControlGetText, iconfilepath, Edit2, - Change Folder .Ico - ahk_class AutoHotkeyGUI,
if (iconfilepath = "")
	{
	tooltip there's nothing there
	SetTimer, RemoveTooltip, -2000	
	return
	}

if FileExist(iconfilepath)
	{
	splitpath, iconfilepath,,,iconfileext
		msgbox ife: %iconfileext%`n`nIFP: %iconfilepath%`n`nIP: %iconpath%
	if (iconfileext != "ico")
		{
			Tooltip You can only try to edit`n.ico file from here.
			SetTimer, RemoveTooltip, -2000	
			return
		}
	else
	if (iconfileext = "ico")
		{

			try run "%iconfilepath%"
			catch
			try run C:\Program Files\XnViewMP\xnviewmp.exe "%iconfilepath%"
			catch
			try run icofx.exe "%iconfilepath%"
			catch
			try run photoshop.exe "%iconfilepath%"
			catch 
			try run paint.exe "%iconfilepath%"
		}
	}
return

Toggleappbar:
ShowAppBar := !ShowAppBar
if (ShowAppBar)
	{
		iniwrite, 1, %inifile%, Settings, ShowAppBar
		menu, s, togglecheck, Hide the App Bar
	}
else
	{
		iniwrite, 0, %inifile%, Settings, ShowAppBar
		menu, s, togglecheck, Hide the App Bar
	}
tooltip, This change requires a reload to take affect...
SetTimer, RemoveTooltip, -3000	
return

Toginfotips:
ShowInfoTipExtras := !ShowInfoTipExtras
if (ShowInfoTipExtras)
	{
		iniwrite, 1, %inifile%, Settings, ShowInfoTipExtras
		menu, s, togglecheck, Hide Optional Folder Info Tip Extras
	}
else
	{
		iniwrite, 0, %inifile%, Settings, ShowInfoTipExtras
		menu, s, togglecheck, Hide Optional Folder Info Tip Extras
	}
tooltip, This change requires a reload to take affect...
SetTimer, RemoveTooltip, -3000
return

IconRunner:
gui, submit, nohide
ControlGetText, iconfilepath, Edit2, - Change Folder .Ico - ahk_class AutoHotkeyGUI,
if (iconfilepath = "")
	{
		tooltip Launching...
		SetTimer, RemoveTooltip, -1000
		if (A_GuiControl = "IV")
			Run, %IconViewer%
		else if (A_GuiControl = "IE1")
			Run, %IconEditor1%
		else if (A_GuiControl = "IE2")
			Run, %IconEditor2%
		else if (A_GuiControl = "IE3")
			Run, %IconEditor3%
		else if (A_GuiControl = "IE4")
			Run, %IconEditor4%
		else if (A_GuiControl = "IC")
			Run, %IconConverter%
		else if (A_GuiControl = "MSP")
			run, %mspaint%
		else if (A_GuiControl = "ev15a")
			{
			; run, %everything15a% 
			if (A_Username = "CLOUDEN")
				run "%everything15a%" -s* ico: %a_space%
			Else
				run "%everything15a%" -s* ext:ico c: %a_space%
			}
	return
	}
	
	if (iconpath != "") && (A_GuiControl = "ev15a")
		{
		splitpath, iconfilepath, iconname
		if (A_Username = "CLOUDEN")
			run "%everything15a%" -s* ico: %iconname%
		Else
			run "%everything15a%" -s* ext:ico c: %iconname%
		return
		}
		
	splitpath, iconfilepath,,,iconfileext
	if (iconfileext != "ico")
		{
			Tooltip You can only try to edit`na .ico file from here.
			sleep 2000
			tooltip
			return
		}
	if FileExist(iconfilepath)
		{
			; msgbox ife: %iconfileext%`n`nIFP: %iconfilepath%`n`nIP: %iconpath%

		if (A_GuiControl = "IV")
			Run, %IconViewer% "%iconfilepath%"
		else if (A_GuiControl = "IE1")
			Run, %IconEditor1% "%iconfilepath%"
		else if (A_GuiControl = "IE2")
			Run, %IconEditor2% "%iconfilepath%"
		else if (A_GuiControl = "IE3")
			Run, %IconEditor3% "%iconfilepath%"
		else if (A_GuiControl = "IE4")
			Run, %IconEditor4% "%iconfilepath%"
		else if (A_GuiControl = "IC")
			Run, %IconConverter% "%iconfilepath%"
		else if (A_GuiControl = "MSP")
			run, %mspaint% "%iconfilepath%"
		else if (A_GuiControl = "ev15a")
				{
					splitpath, iconfilepath, iconname
					if (A_Username = "CLOUDEN")
						run "%everything15a%" -s* ico: %iconname%
					Else
						run "%everything15a%" -s* ext:ico c: %iconname%
					return
				}
		}
		
return 
SearchforiconsinEverything:
if !FileExist(everything15a)
	{
	tooltip Everything cannot menu found!
	SetTimer, RemoveToolTip, -2700
	return
	}
gui, submit, nohide
ControlGetText, iconfilepath, Edit2, - Change Folder .Ico - ahk_class AutoHotkeyGUI,
if (iconfilepath = "")
{
if (A_Username = "CLOUDEN")
	run "%everything15a%" -s* ico: %a_space%
Else
	run "%everything15a%" -s* ext:ico c: %a_space%
}
else
{
	splitpath, iconfilepath, iconname
if (A_Username = "CLOUDEN")
	run "%everything15a%" -s* ico: %iconname%
Else
	run "%everything15a%" -s* ext:ico c: %iconname%
}
return

RemoveTooltip:
Tooltip
return

GuiContextMenu:
menu, cfi, add, test menu, donothing
Return


GuiEscape:
GuiClose:
if (ExitOnClose)
	Exitapp
else
	gui, hide
return
Exit:
    ExitApp
	
Reload:
ReloadCFI:
if (RememberWindowPos)
	RememberWinPos()
Reload
Return

RememberWinPos() ;; function
{
	global
    WinGetPos, X, Y,,, A  ; Get current window position
    IniWrite, %X%, %IniFile%, WindowPos, X
    IniWrite, %Y%, %IniFile%, WindowPos, Y
	sleep 200
}
; return

;---------------------------------------------------------------------------



ShowLoadFolderfromDOPUSmenu:
gosub dopeiconmenu
CoordMode, menu, client
menu, d, show,10,10
return
ddmenu:
	Menu, dd, add, Err! Dopusrt.exe not found. Click here to update its location., updatedopusrt
	Menu, dd, icon, Err! Dopusrt.exe not found. Click here to update its location., %icons%\adminrunning.ico
	Menu, dd, show
return
dopeiconmenu:
if !FileExist(dopusrt)
	{
		goto ddmenu
		return
	}

Menu, d, add
Menu, d, deleteall

Menu, d, add, Change Folder Icon From A Dopus Tab, ShowLoadFolderfromDOPUSmenu 
Menu, d, icon, Change Folder Icon From A Dopus Tab, %dopus%,,24
Menu, d, default, Change Folder Icon From A Dopus Tab
Menu, d, add, ; line ------------------------- 

if FileExist(dopusrt)
	gosub livedopustabs
; Menu, d, add,
; Menu, d, add,
; Menu, d, add,

if (A_Username = "CLOUDEN")
{
WinGetTitle, dopetitle, ahk_class dopus.lister ; | - Directory Opus v13 - |, 
dopetab := Regexreplace(dopetitle, " \| - Directory Opus v13 - .*", "") ;; parentdir
dopesel := regexreplace(dopetitle, ".* \| - Directory Opus v13 - \| ", "") ;; selected

	Menu, d, add, ; line -------------------------

Menu, d, add, Active Tab: %dopetab%, applyAtab
; Menu, d, Icon, Parent: %tabdir%\%tabfilename%, % GetFileIcon(dopetab) ;; get file icon
Menu, d, Icon, Active Tab: %dopetab%, % GetFileIcon(dopetab) ;; get file icon
	
if !FileExist(dopesel) ; if nothing is selected
	{
	; Menu, d, add, ; line -------------------------
	}
else
	{
	; splitpath, dopesel, selfilename, seldir, selext
	FileGetAttrib, dopeselAttr, %dopesel%
	if (InStr(dopeselattr, "D"))
		{
		Menu, d, add, Selected: %dopesel%, applySel 
		Menu, d, Icon, Selected: %dopesel%, % GetFileIcon(dopesel) ;; get file icon
		; Menu, d, add, ; line -------------------------
		}
	}
;--------------------------------------------------

}

return

livedopustabs:
dopetabs = %temp%\dopustabs.xml


	run, %dopusrt% /info %dopetabs%`,paths`,

sleep 150

GetTABSFromXML(dopetabs)
paths := GetTABSFromXML(dopetabs)

FileDelete, %dopetabs%
; Create the submenu
if (IsObject(paths)) {
    ; MsgBox, % "Submenu created with " paths.Count() " paths."

    for index, pathObj in paths {
        ; menuItem := "Path " index ": " pathObj.DisplayPath
        menuItem := pathObj.DisplayPath
		Menu, d, Add, %menuItem%, applyactivetab

		iconPath := GetFileIcon(menuitem)

        Menu, d, Icon, %menuItem%, % GetFileIcon(pathObj.Path)
        MenuPath%A_Index% := pathObj.Path  ; Store paths for later access
    }

} else {
	if (A_IsAdmin)
	{
	Menu, d, add, ERR! Reading Tabs. Try running script not as Admin, donothing
	Menu, d, icon, ERR! Reading Tabs. Try running script not as Admin, %icons%\adminrunning.ico
	Menu, d, add, ; line -------------------------
	Menu, d, add, Click here to EXIT. You have to manual launch the script again., exit
	Menu, d, icon, Click here to EXIT. You have to manual launch the script again., %icons%\exitapp.ico
	}
	else
	{
    Menu, d, add, ERR! Reading tabs. Maybe the Dope isn't open?, donothing
    Menu, d, icon, ERR! Reading tabs. Maybe the Dope isn't open?, %iconerror%	
	}
}
return
opendopustabsmenu:
; msgbox %temp%
dopetabs = %temp%\dopustabs.xml


	run, %dopusrt% /info %dopetabs%`,paths`, 

sleep 150

GetTABSFromXML(dopetabs)
paths := GetTABSFromXML(dopetabs)

FileDelete, %dopetabs%
; Create the submenu
if (IsObject(paths)) {
    ; MsgBox, % "Submenu created with " paths.Count() " paths."

    for index, pathObj in paths {

        menuItem := pathObj.DisplayPath
		menu, f, Add, %menuItem%, opendopustab

		iconPath := GetFileIcon(menuitem)
        menu, f, Icon, %menuItem%, % GetFileIcon(pathObj.Path)
        MenuPath%A_Index% := pathObj.Path  ; Store paths for later access
    }
} else {
	if (A_IsAdmin)
	{
	menu, f, add, ERR! Reading Tabs. Try running script not as Admin, donothing
	menu, f, icon, ERR! Reading Tabs. Try running script not as Admin, %icons%\adminrunning.ico
	menu, f, add, ; line -------------------------
	menu, f, add, Click here to EXIT. You have to manual launch the script again., exit
	menu, f, icon, Click here to EXIT. You have to manual launch the script again., %icons%\exitapp.ico
	}
	else
	{
    menu, f, add, ERR! Reading tabs. Maybe the Dope isn't open?, donothing
    menu, f, icon, ERR! Reading tabs. Maybe the Dope isn't open?, %iconerror%	
	}
}
return
showopenfoldermenu:
gui, submit, nohide
gosub openfoldermenu
CoordMode, menu, client
menu, f, show, 10,10
return
openfoldermenu:
menu, f, add, 
menu, f, deleteall
menu, f, add, Open Which Folder?, showopenfoldermenu
menu, f, icon, Open Which Folder?, %icons%\openfolders.ico,,24
menu, f, default, Open Which Folder?
menu, f, add, ; line -------------------------
if FileExist(folderpath)
	{
	menu, f, add, Working Folder: %folderpath%, openworkingfolder ; openfolderpathfolder
	; menu, f, icon, Working Folder: %folerpath%,  openfolderpathfolder ; #todo, add folder icons here
	}
if FileExist(iconpath)
	{
	SplitPath, iconpath, iconame, icodir
	menu, f, add, Icon Folder: %icodir%, openiconfolder ; openiconpathfolder
	; menu, f, icon, Icon Folder: %icodir%, ; #todo, add folder icons here
	}
if (folderpath = "" && iconpath = "")
	{
		menu, f, add, Both path fields are empty., donothing
		menu, f, icon, Both path fields are empty., %iconerror%,,24
		menu, f, Default, Both path fields are empty.
	}
if Fileexist(IconLibrary)
	{
	menu, f, add, ; line -------------------------
	menu, f, add, Open Icon Library`t%OpenIconLib%, OpenIconLib
	Menu, f, icon, Open Icon Library`t%OpenIconLib%, % GetFileIcon(IconLibrary),,24
	}
if FileExist(dopusrt)
	{
	if winexist("ahk_class dopus.lister")
		{
			menu, f, add, ; line -------------------------
			menu, f, add, Open a Dopus Tab , donothing
			menu, f, icon, Open a Dopus Tab, %dopus%,,24
			menu, f, add, ; line -------------------------
			gosub opendopustabsmenu
		}
	}
return
OpenIconLib:
run %IconLibrary%
return
openworkingfolder:
run "%folderpath%"
return
openiconfolder:
run "%icodir%"
return

opendopustab:
run %A_ThisMenuItem%
return
GetTABSFromXML(file) {
; working keep
Global
    FileRead, xml, %file%
    if (ErrorLevel) {
        ; tooltip, Failed to read file: %file% `n`n%A_ScriptFile%`nline: %A_LineNumber%
		; SetTimer, RemoveTooltip, -2000	
        return
    }

    xmldom := ComObjCreate("MSXML2.DOMDocument.6.0") ; Create an MSXML DOMDocument object
    xmldom.async := false

    if (!xmldom.loadXML(xml)) { ; Load the XML content
        ; tooltip, Failed to load XML: %file% `n`n%A_ScriptFile%`nline: %A_LineNumber%
		; sleep 3000
		; tooltip
        return
    }
    paths := [] ; Initialize an empty array to hold the paths
    nodes := xmldom.selectNodes("//path") ; Select all <path> nodes
    Loop % nodes.length {
        node := nodes.item(A_Index - 1)
        pathValue := node.text ; Extract path text and display_path attribute
        displayPath := node.getAttribute("display_path")
        paths.Push({Path: pathValue, DisplayPath: displayPath}) ; Push both the path and its attributes to the array
    }
    return paths ; Return the array of paths
}

; Helper function to loop through COM nodes
LoopCOMNodes(nodes) {
    nodesArray := []
    if IsObject(nodes) {
        count := nodes.length
        Loop, %count% {
            nodesArray.Push(nodes.item(A_Index - 1)) ; 0-based index for COM collections
        }
    }
    return nodesArray
}



updatedopusrt:
gui, ud: new
gui, ud: color, 171717, 050505
gui, ud: font, s12 c0xBEFED3, Consolas
gui, ud: add, text, xm w500, dopusrt.exe was not found in it default location @ %A_ProgramFiles%\GPSoftware\Directory Opus\`n`nIt's needed to build this menu of open tabs.`n`nIf you have Dopus installed in custom location paste or pick the file path below to update it.

gui, ud: add, edit, xm vndrt w450,
gui, ud: add, Button, x+m gpickdrt, . . .
gui, ud: add, button, xm gapplynewdrt, &Apply New Path && Reload
gui, ud: add, button, x+m gcloseud, &Cancel
gui, ud: +AlwaysOnTop
gui, ud: show,,- Change Folder .Ico - ! Update Dopus Location
return

pickdrt:
fileselectfile, ndrtpath,1,,Select the path to dopusrt.exe,(*.exe)
GuiControl,,ndrt,%ndrtpath%
return
applynewdrt:
gui, submit, nohide
if !FileExist(ndrt)
	{
		MsgBox, Err! The path pasted does not exisit.`n`nPlease Try again.
		return
	}
else
	{
	splitpath, ndrt, ndrtfilename, ndrtdir
	if (ndrtfilename = "dopusrt.exe")
		{
			IniWrite, %ndrt%, %inifile%, Programs, dopusrt
			IniWrite, %ndrtdir%\dopus.exe, %inifile%, Programs, dopus
			sleep 750
			reload
		}
	else if (ndrtfilename = "dopus.exe")
		{
			; MsgBox we have a winner
			IniWrite, %ndrtdir%\dopusrt.exe, %inifile%, Programs, dopusrt
			IniWrite, %ndrtdir%\dopus.exe, %inifile%, Programs, dopus
			sleep 750
			reload
		}
	else if (ndrtfilename != "dopusrt.exe" || "dopus.exe")
		{
			Msgbox, Err! This is not dopusrt.exe or dopus.exe`n`n`tPlease try again.
			return
		}
	}

return
closeud:
gui, ud: destroy
return
applyAtab:
guicontrol,,folderpath, %dopetab%
goto LoadFolderPath
return
applySel:
guicontrol,,folderpath, %dopesel%
goto Loadfolderpath
return
applyactivetab:
guicontrol,,folderpath, %A_thismenuitem%
goto loadfolderpath
return
opentabspath:
tooltip %A_thismenuitem%
SetTimer, RemoveTooltip, -2000	
return


;"



;----------------------------------------------------------------------------------------------------
;----------------------------------------------------------------------------------------------------
fastsetnewicon:
gui, submit, nohide
if !Fileexist(folderpath) && !Fileexist(iconpath)
	{
	tooltip The Folder && Icons Paths Cannot Be Found.`nOperation Canceled.
	SetTimer, RemoveTooltip, -2000	
	return
	}
if (fastsetwarning)
	{
	MsgBox, 4148, - Change Folder .Ico - ! Fast Set, This is the only time this button will bug you.`n`nUse this button for a speedy icon change. Its Skips Conformations and only saves basic details to the desktop.ini file.`n`nIt only works with .ico files.`nAND! It will Force Windows Explorer to reload each time you use it. Then - Change Folder .Ico - will close.`n`n`nContinue...  ???
	IfMsgBox no
		return
	IfMsgBox Yes
		{
		iniwrite, 0, %inifille%, Settings, FastSetWarning
		goto carryon
		}
	}
carryon:
splitpath, iconpath,,,ext
if (ext != "ico")
	{
	tooltip This Button only works with .ico files.`nOperation Canceled
	SetTimer, RemoveTooltip, -2000	
	return
	}
AskMeToConfirmOnSave := 0
forcewindownsreload := 1
gosub SetNewIcon
sleep 1000
exitapp
return

;; &apply
applyicon: ;; this is attracted to edit2 iconpath
Return


SetNewIcon:  ; &set
Gui, Submit, NoHide
folderpath := RegExReplace(folderpath, "\\$") ; Ensure no trailing backslash
			; ShowError(A_LineNumber, folderpath, IconResource, iconpath, iconfile, desktopini, iconindex)
; varcheckbox()
SplitPath, folderpath,, dir,, drive
if (folderpath = drive)  ; Now "C:" will match "C:"
	{
		MsgBox, 4112, - Change Folder .Ico - ! Save Error, You cannot save a custom icon to the root level of a hard drive.`n`nOperation canceled., 7
		return
	}

if !FileExist(folderpath) && (iconpath = "")
; if !FileExist(folderpath) || (iconpath = "")
	{
	   MsgBox, 262160, - Change Folder .Ico - ! Save Error, Your missing required elements to set a new folder icon.`n`nThe folder & icons path do not exist or are empty!`n`nPlease check your paths and try again., 7
	   return
	}
	
if (AskMeToConfirmOnSave)
	{
	MsgBox, 4164, - Change Folder .Ico - ! Setting New Folder Icon, This command will update the system file:`n%Desktopini%`n`nIf there is an existing desktop.ini in this directory it will be sent to the recycle bin!`n`nIt may take 10-15 seconds or up to one minute before Windows shows the new folder icon. (Forcing a Windows Explorer Reload usually helps it set faster. ** This option will close your File Explorer windows.)`n`nIf you use this tool a lot`, and don't want to see this message every time`, there is an option in the settings file to turn it off.`n  --> Set...  AskMeToConfirmOnSave= from =1 to =0.`n`nConintue .... ???
	IfMsgBox No
		return
	}

if !FileExist(iconpath) && (iconpath != "")
	{
		if (AskMeToConfirmOnSave)
		{
			MsgBox, 4148, - Change Folder .Ico - ! Save Warning, The Icon path you provided cannot be found thou is not empty. `n`nIf your saving a relative path to an icon click YES to continue.`n`nClick NO to stop and re-check your icon path.
			IfMsgBox NO
				return
		}	
	}

if FileExist(desktopini)
	{
		iniread, oldinfotip, %desktopini%, .ShellClassInfo, Infotip
		iniread, oldIconfile, %desktopini%, .ShellClassInfo, IconFile
		iniread, IF_IconIndex, %desktopini%, .ShellClassInfo, IconIndex, 0
		iniread, oldviewstate, %destopini%, ViewState
		; msgbox oldviewstate: %oldviewstate%
		; iniread,
		sleep 100
		FileRecycle, %desktopini%
	}


if (changenumber) ;; this is main iniwrite section
	{
		iniwrite, %iconpath%`,%iconindex%, %desktopini%, .ShellClassInfo, IconResource
		IniWrite, 0, %DesktopIni%, .ShellClassInfo, ConfirmFileOp
	}
else
	{
		iniwrite, %iconpath%`,0 , %desktopini%, .ShellClassInfo, IconResource
		IniWrite, 0, %DesktopIni%, .ShellClassInfo, ConfirmFileOp	
	}


if (oldinfotip != "")
	{
		; msgbox oldtip: %oldinfotip%
	if (oldinfotip = "ERROR")
		{
			IniWrite, %a_space%, %DesktopIni%, .ShellClassInfo, InfoTip
		}
	else
		{
			IniWrite, %oldinfotip%, %desktopini%, .ShellClassInfo, InfoTip
		}
	}

if (allowTTB)
	{
		; msgbox get the v.infotip`n`n %infotip%
		iniwrite, %infotip%, %desktopini%, .ShellClassInfo, Infotip
	}
if (oldviewstate != "")
	iniwrite, %oldviewstate%, %desktopini%, ViewState,
	

FileSetAttrib, +R, %folderpath%, 2
FileSetAttrib, +H+S, %DesktopIni%

;; referance
; iniwrite, %iconpath%, %desktopini%, .ShellClassInfo, IconResource
; IniWrite, 0, %DesktopIni%, .ShellClassInfo, ConfirmFileOp
;------------------------- ;; extras
if (RememberHistory)
	{
		SaveFolderHistory(folderpath)
		SaveIconHistory(iconpath)
	}

if (applytoallsubs)
	{
		; SetFolderIcons(rootFolder, iconPath)
		sleep 200
		SetIconALLFOLDERS(folderpath, desktopini)
	}
if (forcewindownsreload) ;; force windows to relaod
	{
		sleep 200
		gosub ForceWindowExplorerReload	
	}
; (Continue applying the new icon functionality here)
gosub cleanupsavevars
sleep 200
gosub loadFolderPath
Return


cleanupsavevars:
oldinfotip := ""
oldIconfile := ""
IF_IconIndex := ""
oldviewstate := ""
return

varcheckbox()
{
MsgBox, 262144, Debug Check %A_scriptname%, dtini:  %desktopini%`n`nFP: %folderpath%`n`nIP: %iconpath% `n`nthis is what the output in desktop.ini should looke like...`nIconResource=%IconResource% : read from exsiting inis`n`n + vChangeNumber: `,%changenumber%   ---   IconIndex= %IconIndex% `,`n`nInfoTip- vallowTTB: %allowTTB% `, vInfoTip: %infotip%`n`n`nExtras ...`nForce apply now vforcewindownsreload: %forcewindownsreload% `n apply all subs vapplytoallsubs: %applytoallsubs%
}


Deletedesktopini: ;;; from qap todo for reset folder icon
if !Fileexist(desktopini)
	{
	tooltip There's No desktop.ini here to delete.
	SetTimer, RemoveTooltip, -2000	
	return
	}
if (AskMeToConfirmOnSave)
		{
			MsgBox, 4148, - Change Folder .Ico - ! Delete Warning, You are deleting a system file:`n%desktopini%`n`nThis will reset the icon and any other settings in it. This is not recommend for Windows Actual system folders.`n`nContinue... ??? 
			IfMsgBox NO
				return
		}	
FileRecycle, %desktopini%
FileSetAttrib, -R, %folderpath%, 2
gosub loadFolderPath
return

applyiconnow: ;; gpt ;; old ;; oktd
    Desktopinifile := foldernewicon "\desktop.ini"
    
    ; Write desktop.ini with icon settings
    ; FileDelete, %Desktopinifile% ; Ensure clean overwrite
    FileRecycle, %Desktopinifile% ; Ensure clean overwrite
    FileAppend, 
    (
    [.ShellClassInfo]
    IconResource=%iconpath%,0
    ), %Desktopinifile%

    ; Make folder read-only and desktop.ini hidden/system
    FileSetAttrib, +R, %foldernewicon%
    FileSetAttrib, +SH, %Desktopinifile%
	
	    ; Refresh Windows Explorer to apply changes ;; this might not be necessary, windows will eventually see the change, this will just force it.
	RunWait, ie4uinit.exe -show
	RunWait, taskkill /F /IM explorer.exe
	sleep 1000
    Run, explorer.exe

return
;--------------------------------------------------
SetIconALLFOLDERS(folder, desktopini)  
{
    ; Ensure the source desktop.ini exists before proceeding
    if !FileExist(desktopini)
    {
        MsgBox, 16, Error, The source desktop.ini file does not exist!`n`nOperation Canceled.
        return
    }
   
    ; Loop, %folder%\*, 2 ; Loop through all subfolders
	Loop, %folder%\*, 2, 1  ; The "1" makes it search all subdirectories
    {
        targetDesktopIni := A_LoopFileFullPath . "\desktop.ini"

        ; Copy desktop.ini to each subfolder
        FileCopy, %desktopini%, %targetDesktopIni%, 1  ; Overwrite existing ini

        ; Apply necessary attributes
        FileSetAttrib, +SH, %targetDesktopIni%  ; Hide + System for desktop.ini
        FileSetAttrib, +R, %A_LoopFileFullPath%  ; Read-only for the folder
		sleep 10
    }

}

/*

 SetIconALLFOLDERS(folder, desktopini)  ;; Function: Copy existing desktop.ini to all subfolders
{
    ; Ensure the source desktop.ini exists before proceeding
    if !FileExist(desktopini)
    {
        MsgBox, 16, Error, The source desktop.ini file does not exist!`n`nOperation canceled.
        return
    }

    ; Loop through all subfolders and copy desktop.ini into each one
    Loop, %folder%\*, 2
    {
        targetDesktopIni := A_LoopFileFullPath . "\desktop.ini"

        ; Copy desktop.ini from the source folder to the subfolder
        FileCopy, %desktopini%, %targetDesktopIni%, 1  ; Overwrite if exists

        ; Set attributes for desktop.ini and the folder
        FileSetAttrib, +SH, %targetDesktopIni%  ; Hide + System for desktop.ini
        FileSetAttrib, +R, %A_LoopFileFullPath%  ; Read-only for the folder

        ; Debugging message (optional)
        MsgBox, Copied %desktopini% to %targetDesktopIni%
    }
    
    sleep 200
} 

*/

Setfoldericonsinallsubs: ; gpt, not being used atm but is good working option.
;; ** I've only texted this with `.ico` files, use caution if your wanting to set an icon from a `.dll` or `.exe`


FileSelectFolder, rootFolder, *c:\Users\%a_username%,6,Select A Folder that you want to set a custom Icon to...
if !FileExist(rootfolder)
	{
	tooltip, ERR! @ Line:  %A_LineNumber% -- %A_scriptname%`n`nFolder Doesn't Exist! Opration Canceled.
	SetTimer, RemoveTooltip, -2000	
	return	
	}

FileSelectFile, iconpath, 1, *%A_MyDocuments%, Select a Icon.ico File.,
if ErrorLevel
	{
	;; todo, expand error check for acceptable icon types.
	tooltip, Err! A line:  %A_LineNumber% -- %A_scriptname%`n`nA Icon File Must Be Selected! Operation Canceled.
	SetTimer, RemoveTooltip, -2000	
	return	
	}

SetFolderIcons(rootFolder, iconPath)
    ; Refresh Windows Explorer to apply changes
	RunWait, ie4uinit.exe -show
	RunWait, taskkill /F /IM explorer.exe
	sleep 1000
    Run, explorer.exe
	
return

SetFolderIcons(folder, icon) ;; () ;; Function, set folder icons through all subfolders
{

    FileAppend, 
    (
    [.ShellClassInfo]
    IconResource=%iconpath%,0
    ), %Desktopinifile%

    ; Make folder read-only and desktop.ini hidden/system
    FileSetAttrib, +R, %folder%
    FileSetAttrib, +SH, %Desktopinifile%

    ; Loop through all subfolders
    Loop, %folder%\*, 2
        {
		SetFolderIcons(A_LoopFileFullPath, icon)
		}
	
	sleep 200
}


ForceWindowExplorerReload:
forcewinreload:
	RunWait, ie4uinit.exe -show
	RunWait, taskkill /F /IM explorer.exe
	sleep 1000
    Run, explorer.exe
return
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;----------0-----------------------------------------------------------------


ListLinesx() ;; function
{
	global debugonfolderload, debugoniconpreview, debugonstartup
listLines
; sleep 500
; WinMove, A, , 2035, 1281, 1080, 720
return
} 

AboutMessage:
aboutbox1 = 
( 

Description: A Quick and Simple AutoHotkey GUI for applying a Icon to a Folder, with options for apply the icon to a full folder tree & InfoTips.

#1 - Provide a folder path 1st in the top edit field. This should be loaded first! As it will look for an existing desktop.ini, if found it read and load the content into the gui.

#2 - Then provide an icon file path in the 2nd edit field. Which will set, or overwrite, the IconResource key into a new or existing desktop.ini file upon applying.  E.g. ...

[.ShellClassInfo]
IconResource=C:\Path to your\icon\file.ico,0

*** .ICO files are STRONGLY recommend with this tool! ***

Other file types can and will work such as .dlls, .exes or .icls ...
BUT! Windows requires additional icon index definitions that I won't be fully implementing or testing here. I'm going for ease, speed and simplity with this tool making the .ico format optimal!

You can read more about desktop.ini files here...
https://hwiegman.home.xs4all.nl/desktopini.html
and more about windows icons.dll's here...
https://www.digitalcitizen.life/where-find-most-windows-10s-native-icons/


This Script was written and testing on...
Windows 10 using AutoHotkey v1.1.37+
First Release.... v.2025.03.06 
Last Update..... %version%


Click YES to visit this apps Github page for more info.
Click NO to carry on.



)
MsgBox, 262148, - Change Folder .Ico - ? About ?, %aboutbox1%
; MsgBox, 262147, , %aboutbox1% , ; #todo make this yes or no box
IfMsgBox Yes
	Run %githuburl%
IfMsgBox No
	gosub DoNothing
IfMsgBox Cancel
	gosub DoNothing
IfMsgBox Timeout
	gosub DoNothing
return



;------------------------------
;
; Function: AddTooltip v2.0
;
; Description:
;
;   Add/Update tooltips to Gui, controls.
;
; Parameters:
;
;   p1 - Handle to a Gui, control.  Alternatively, set to "Activate" to enable
;       the tooltip control, "AutoPopDelay" to set the autopop delay time,
;       "Deactivate" to disable the tooltip control, or "Title" to set the
;       tooltip title.
;
;   p2 - If p1 contains the handle to a Gui, control, this parameter should
;       contain the tooltip text.  Ex: "My tooltip".  Set to null to delete the
;       tooltip attached to the control.  If p1="AutoPopDelay", set to the
;       desired autopop delay time, in seconds.  Ex: 10.  Note: The maximum
;       autopop delay time is ~32 seconds.  If p1="Title", set to the title of
;       the tooltip.  Ex: "Bob's Tooltips".  Set to null to remove the tooltip
;       title.  See the *Title & Icon* section for more information.
;
;   p3 - Tooltip icon.  See the *Title & Icon* section for more information.
;
; Returns:
;
;   The handle to the tooltip control.
;
; Requirements:
;
;   AutoHotkey v1.1+ (all versions).
;
; Title & Icon:
;
;   To set the tooltip title, set the p1 parameter to "Title" and the p2
;   parameter to the desired tooltip title.  Ex: AddTooltip("Title","Bob's
;   Tooltips"). To remove the tooltip title, set the p2 parameter to null.  Ex:
;   AddTooltip("Title","").
;
;   The p3 parameter determines the icon to be displayed along with the title,
;   if any.  If not specified or if set to 0, no icon is shown.  To show a
;   standard icon, specify one of the standard icon identifiers.  See the
;   function's static variables for a list of possible values.  Ex:
;   AddTooltip("Title","My Title",4).  To show a custom icon, specify a handle
;   to an image (bitmap, cursor, or icon).  When a custom icon is specified, a
;   copy of the icon is created by the tooltip window so if needed, the original
;   icon can be destroyed any time after the title and icon are set.
;
;   Setting a tooltip title may not produce a desirable result in many cases.
;   The title (and icon if specified) will be shown on every tooltip that is
;   added by this function.
;
; Remarks:
;
;   The tooltip control is enabled by default.  There is no need to "Activate"
;   the tooltip control unless it has been previously "Deactivated".
;
;   This function returns the handle to the tooltip control so that, if needed,
;   additional actions can be performed on the Tooltip control outside of this
;   function.  Once created, this function reuses the same tooltip control.
;   If the tooltip control is destroyed outside of this function, subsequent
;   calls to this function will fail.
;
; Credit and History:
;
;   Original author: Superfraggle
;   * Post: <http://www.autohotkey.com/board/topic/27670-add-tooltips-to-controls/>
;
;   Updated to support Unicode: art
;   * Post: <http://www.autohotkey.com/board/topic/27670-add-tooltips-to-controls/page-2#entry431059>
;
;   Additional: jballi.
;   Bug fixes.  Added support for x64.  Removed Modify parameter.  Added
;   additional functionality, constants, and documentation.
;
;-------------------------------------------------------------------------------
; #warn, off

AddTooltip(p1,p2:="",p3="")
    {
    Static hTT := ""
    ; Global hTT

          ;-- Misc. constants
          ,CW_USEDEFAULT:=0x80000000
          ,HWND_DESKTOP :=0

          ;-- Tooltip delay time constants
          ,TTDT_AUTOPOP:=2
                ;-- Set the amount of time a tooltip window remains visible if
                ;   the pointer is stationary within a tool's bounding
                ;   rectangle.

          ;-- Tooltip styles
          ,TTS_ALWAYSTIP:=0x1
                ;-- Indicates that the tooltip control appears when the cursor
                ;   is on a tool, even if the tooltip control's owner window is
                ;   inactive.  Without this style, the tooltip appears only when
                ;   the tool's owner window is active.

          ,TTS_NOPREFIX:=0x2
                ;-- Prevents the system from stripping ampersand characters from
                ;   a string or terminating a string at a tab character.
                ;   Without this style, the system automatically strips
                ;   ampersand characters and terminates a string at the first
                ;   tab character.  This allows an application to use the same
                ;   string as both a menu item and as text in a tooltip control.

          ;-- TOOLINFO uFlags
          ,TTF_IDISHWND:=0x1
                ;-- Indicates that the uId member is the window handle to the
                ;   tool.  If this flag is not set, uId is the identifier of the
                ;   tool.

          ,TTF_SUBCLASS:=0x10
                ;-- Indicates that the tooltip control should subclass the
                ;   window for the tool in order to intercept messages, such
                ;   as WM_MOUSEMOVE.  If this flag is not used, use the
                ;   TTM_RELAYEVENT message to forward messages to the tooltip
                ;   control.  For a list of messages that a tooltip control
                ;   processes, see TTM_RELAYEVENT.

          ;-- Tooltip icons
          ,TTI_NONE         :=0
          ,TTI_INFO         :=1
          ,TTI_WARNING      :=2
          ,TTI_ERROR        :=3
          ,TTI_INFO_LARGE   :=4
          ,TTI_WARNING_LARGE:=5
          ,TTI_ERROR_LARGE  :=6

          ;-- Extended styles
          ,WS_EX_TOPMOST:=0x8

          ;-- Messages
          ,TTM_ACTIVATE      :=0x401                    ;-- WM_USER + 1
          ,TTM_ADDTOOLA      :=0x404                    ;-- WM_USER + 4
          ,TTM_ADDTOOLW      :=0x432                    ;-- WM_USER + 50
          ,TTM_DELTOOLA      :=0x405                    ;-- WM_USER + 5
          ,TTM_DELTOOLW      :=0x433                    ;-- WM_USER + 51
          ,TTM_GETTOOLINFOA  :=0x408                    ;-- WM_USER + 8
          ,TTM_GETTOOLINFOW  :=0x435                    ;-- WM_USER + 53
          ,TTM_SETDELAYTIME  :=0x403                    ;-- WM_USER + 3
          ,TTM_SETMAXTIPWIDTH:=0x418                    ;-- WM_USER + 24
          ,TTM_SETTITLEA     :=0x420                    ;-- WM_USER + 32
          ,TTM_SETTITLEW     :=0x421                    ;-- WM_USER + 33
          ,TTM_UPDATETIPTEXTA:=0x40C                    ;-- WM_USER + 12
          ,TTM_UPDATETIPTEXTW:=0x439                    ;-- WM_USER + 57

    ;-- Save/Set DetectHiddenWindows
    l_DetectHiddenWindows:=A_DetectHiddenWindows
    DetectHiddenWindows On

    ;-- Tooltip control exists?
    if not hTT
        {
        ;-- Create Tooltip window
        hTT:=DllCall("CreateWindowEx"
            ,"UInt",WS_EX_TOPMOST                       ;-- dwExStyle
            ,"Str","TOOLTIPS_CLASS32"                   ;-- lpClassName
            ,"Ptr",0                                    ;-- lpWindowName
            ,"UInt",TTS_ALWAYSTIP|TTS_NOPREFIX          ;-- dwStyle
            ,"UInt",CW_USEDEFAULT                       ;-- x
            ,"UInt",CW_USEDEFAULT                       ;-- y
            ,"UInt",CW_USEDEFAULT                       ;-- nWidth
            ,"UInt",CW_USEDEFAULT                       ;-- nHeight
            ,"Ptr",HWND_DESKTOP                         ;-- hWndParent
            ,"Ptr",0                                    ;-- hMenu
            ,"Ptr",0                                    ;-- hInstance
            ,"Ptr",0                                    ;-- lpParam
            ,"Ptr")                                     ;-- Return type

        ;-- Disable visual style
        ;   Note: Uncomment the following to disable the visual style, i.e.
        ;   remove the window theme, from the tooltip control.  Since this
        ;   function only uses one tooltip control, all tooltips created by this
        ;   function will be affected.
; DllCall("uxtheme\SetWindowTheme","Ptr",hTT,"Ptr",0,"UIntP",0)

        ;-- Set the maximum width for the tooltip window
        ;   Note: This message makes multi-line tooltips possible
        ; SendMessage TTM_SETMAXTIPWIDTH,0,A_ScreenWidth,,ahk_id %hTT% ;; og
		SendMessage TTM_SETMAXTIPWIDTH,0,A_ScreenWidth*96//A_ScreenDPI,,ahk_id %hTT%  ; <--- was A_ScreenWidth
        }

    ;-- Other commands
    if p1 is not Integer
        {
        if (p1="Activate")
            SendMessage TTM_ACTIVATE,True,0,,ahk_id %hTT%

        if (p1="Deactivate")
            SendMessage TTM_ACTIVATE,False,0,,ahk_id %hTT%

        if (InStr(p1,"AutoPop")=1)  ;-- Starts with "AutoPop"
            SendMessage TTM_SETDELAYTIME,TTDT_AUTOPOP,p2*1000,,ahk_id %hTT%
        
        if (p1="Title")
            {
            ;-- If needed, truncate the title
            if (StrLen(p2)>99)
                p2:=SubStr(p2,1,99)

            ;-- Icon
            if p3 is not Integer
                p3:=TTI_NONE

            ;-- Set title
            SendMessage A_IsUnicode ? TTM_SETTITLEW:TTM_SETTITLEA,p3,&p2,,ahk_id %hTT%
            }

        ;-- Restore DetectHiddenWindows
        DetectHiddenWindows %l_DetectHiddenWindows%
    
        ;-- Return the handle to the tooltip control
        Return hTT
        }

    ;-- Create/Populate the TOOLINFO structure
    uFlags:=TTF_IDISHWND|TTF_SUBCLASS
    cbSize:=VarSetCapacity(TOOLINFO,(A_PtrSize=8) ? 64:44,0)
    NumPut(cbSize,      TOOLINFO,0,"UInt")              ;-- cbSize
    NumPut(uFlags,      TOOLINFO,4,"UInt")              ;-- uFlags
    NumPut(HWND_DESKTOP,TOOLINFO,8,"Ptr")               ;-- hwnd
    NumPut(p1,          TOOLINFO,(A_PtrSize=8) ? 16:12,"Ptr")
        ;-- uId

    ;-- Check to see if tool has already been registered for the control
    SendMessage
        ,A_IsUnicode ? TTM_GETTOOLINFOW:TTM_GETTOOLINFOA
        ,0
        ,&TOOLINFO
        ,,ahk_id %hTT%

    l_RegisteredTool:=ErrorLevel

    ;-- Update the TOOLTIP structure
    NumPut(&p2,TOOLINFO,(A_PtrSize=8) ? 48:36,"Ptr")
        ;-- lpszText

    ;-- Add, Update, or Delete tool
    if l_RegisteredTool
        {
        if StrLen(p2)
            SendMessage
                ,A_IsUnicode ? TTM_UPDATETIPTEXTW:TTM_UPDATETIPTEXTA
                ,0
                ,&TOOLINFO
                ,,ahk_id %hTT%
         else
            SendMessage
                ,A_IsUnicode ? TTM_DELTOOLW:TTM_DELTOOLA
                ,0
                ,&TOOLINFO
                ,,ahk_id %hTT%
        }
    else
        if StrLen(p2)
            SendMessage
                ,A_IsUnicode ? TTM_ADDTOOLW:TTM_ADDTOOLA
                ,0
                ,&TOOLINFO
                ,,ahk_id %hTT%

    ;-- Restore DetectHiddenWindows
    DetectHiddenWindows %l_DetectHiddenWindows%

    ;-- Return the handle to the tooltip control
    Return hTT
    }
GuiButtonIcon(Handle, File, Index := 1, Options := "")
{
	RegExMatch(Options, "i)w\K\d+", W), (W="") ? W := 16 :
	RegExMatch(Options, "i)h\K\d+", H), (H="") ? H := 16 :
	RegExMatch(Options, "i)s\K\d+", S), S ? W := H := S :
	RegExMatch(Options, "i)l\K\d+", L), (L="") ? L := 0 :
	RegExMatch(Options, "i)t\K\d+", T), (T="") ? T := 0 :
	RegExMatch(Options, "i)r\K\d+", R), (R="") ? R := 0 :
	RegExMatch(Options, "i)b\K\d+", B), (B="") ? B := 0 :
	RegExMatch(Options, "i)a\K\d+", A), (A="") ? A := 4 :
	Psz := A_PtrSize = "" ? 4 : A_PtrSize, DW := "UInt", Ptr := A_PtrSize = "" ? DW : "Ptr"
	VarSetCapacity( button_il, 20 + Psz, 0 )
	NumPut( normal_il := DllCall( "ImageList_Create", DW, W, DW, H, DW, 0x21, DW, 1, DW, 1 ), button_il, 0, Ptr )	; Width & Height
	NumPut( L, button_il, 0 + Psz, DW )		; Left Margin
	NumPut( T, button_il, 4 + Psz, DW )		; Top Margin
	NumPut( R, button_il, 8 + Psz, DW )		; Right Margin
	NumPut( B, button_il, 12 + Psz, DW )	; Bottom Margin	
	NumPut( A, button_il, 16 + Psz, DW )	; Alignment
	SendMessage, BCM_SETIMAGELIST := 5634, 0, &button_il,, AHK_ID %Handle%
	return IL_Add( normal_il, File, Index )
}
;*********************************************************************8*****
;***************************************************************************
;***************************************************************************

DMToggle:
    If (DarkMode)
    {
		DarkMode := false
		MenuDark(3) ; Set to ForceLight
		iniwrite, 0, %inifile%, settings, DarkMode
		tooltip Dark Mode OFF!`nA Reload is required to change GUI Theme.
    }
    else
    {
        DarkMode := true
        MenuDark(2) ; Set to ForceDark
		iniwrite, 1, %inifile%, settings, DarkMode
		tooltip Dark Mode ON!`nA Reload is required to change GUI Theme.
	}
SetTimer, RemoveToolTip, -3000
return

RunAsAdmin:
	if !(A_IsAdmin)
		Run *RunAs "%A_ScriptFullPath%" ; Relaunch script as admin
return
	
warnadmin:
if (A_IsAdmin)
{
	MsgBox, 4420, Running As Admin, If you don't want this script running as Admin any longer you must Exit it completely and Re-Run it.`n`nWould you like to EXIT\QUIT now?`n`nYou have to Restart it Manually afterward.`n`nYES = KILL`nNO = Continue as Admin, 30
	IfMsgBox Yes
	{
		; iniwrite, 0, %inifile%, Settings, StartAsAdmin
		sleep 750
		exitapp
	}
	IfMsgBox No
		return
	IfMsgBox timeout
		return
}
return








;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
checkinstalledicons:
installicons:
FileInstall, Icons\about.ico, %A_WorkingDir%\about.ico,1
FileInstall, Icons\admin.ico, %A_WorkingDir%\admin.ico,1
FileInstall, Icons\adminrunning.ico, %A_WorkingDir%\adminrunning.ico,1
FileInstall, Icons\attention.ico, %A_WorkingDir%\attention.ico,1
FileInstall, Icons\ChangeFolderIcon.ico, %A_WorkingDir%\ChangeFolderIcon.ico,1
FileInstall, Icons\checkclipboard.ico, %A_WorkingDir%\checkclipboard.ico,1
FileInstall, Icons\clipboardicon.ico, %A_WorkingDir%\clipboardicon.ico,1
FileInstall, Icons\darkmode.ico, %A_WorkingDir%\darkmode.ico,1
FileInstall, Icons\editdoc.ico, %A_WorkingDir%\editdoc.ico,1
FileInstall, Icons\exitapp.ico, %A_WorkingDir%\exitapp.ico,1
FileInstall, Icons\folderhistory.ico, %A_WorkingDir%\folderhistory.ico,1
FileInstall, Icons\forcewinreload.ico, %A_WorkingDir%\forcewinreload.ico,1
FileInstall, Icons\githubicon.ico, %A_WorkingDir%\githubicon.ico,1
FileInstall, Icons\hotkeys.ico, %A_WorkingDir%\hotkeys.ico,1
FileInstall, Icons\iconerror.ico, %A_WorkingDir%\iconerror.ico,1
FileInstall, Icons\iniicon.ico, %A_WorkingDir%\iniicon.ico,1
FileInstall, Icons\openfolders.ico, %A_WorkingDir%\openfolders.ico,1
FileInstall, Icons\pinnedtotop.ico, %A_WorkingDir%\pinnedtotop.ico,1
FileInstall, Icons\previeweye.ico, %A_WorkingDir%\previeweye.ico,1
FileInstall, Icons\reload.ico, %A_WorkingDir%\reload.ico,1
FileInstall, Icons\settingsaltini.ico, %A_WorkingDir%\settingsaltini.ico,1
FileInstall, Icons\startmenu.ico, %A_WorkingDir%\startmenu.ico,1
FileInstall, Icons\tooltip.ico, %A_WorkingDir%\tooltip.ico,1
FileInstall, Icons\trashbin.ico, %A_WorkingDir%\trashbin.ico,1
FileInstall, Icons\winpos.ico, %A_WorkingDir%\winpos.ico,1
return

makeini:
fileappend,
(
[Settings]
AskMeToConfirmOnSave=1
AutoCheckClipboard4Path=1
DarkMode=1
ExitOnClose=1
FirstRun=1
FastSetWarning=1
ForceApplyNOW=1
HideTooltips=0
iconerror=
IconLibrary=C:\xSysIcons
RememberHistory=1
RememberWindowPos=0
ShowAppBar=1
ShowInfoTipExtras=1
ShowMenuBar=0
StartAsAdmin=0
StartOnTop=1

;; you should only turn these on if creating an "issue" report on github. these can help the dev find his Oops
ShowAHKErrorWarnings=0
Debugonfolderload=0
debugoniconpreview=0
Debugonstartup=0

;-------------------------

[Global_Hotkeys]
Reload= | Reload Change Folder .Ico
Show_CFICO_GUI= | Activate Change Folder .Ico
;; For a full list of AutoHotkey's {Special_KeyNames} such as ESC, Home, Mouse Buttons, Space etc... and their uses visit the Docs page for reference.  https://www.autohotkey.com/docs/v1/KeyList.htm
;; You Can Change or Removed Hotkeys Here...
;; ** hotkey layout...
;; labelName= (set your hotkey here) | Description for the live hotkey menu
;; LabelName=  <-- DO NOT CHANGE anything before the "="
;; Set, or remove, the hotkey between the "=" & "|"

;; AutoHotkey's Modifier Symbols are... 
;; Ctrl = ^  ; Shift = + ; Win = # ; Alt = !
[Hotkeys]
AboutMessage=^F1 | About Overview Message
AlwaysOnTopToggle=^P | Pin - UnPin from Top
Browse4FOLDERtoLoad=^O | Browse for a Folder
Browse4ICONtoLoad=^I | Browse for a Icon
CheckClipboard4FOLDER=^+V | Paste && Load Folder Path from Clipboard
CheckClipboard4ICO=^!V | Paste && Preview Icon Path from Clipboard
DMToggle=^F3 | Toggle Dark-Light Mode Menus
EditCFISettings=^F11 | Editing Settings File
Exit=!F4 | Quit \ Exit Change Folder .Ico
ForceWindowExplorerReload=^+#END | Force Windows Explorer to Reload
LoadFolderPath=^Enter | Load Folder Path Field
OpenScriptDir=^+D | Open App Directory
OpenIconLib=^!I | Open Icon Lib (if set)
ReloadCFI=F5 | Reload Change Folder .Ico
RunAsAdmin=^!#F1 | Run as Administrator
SearchforiconsinEverything= ^E | Search for Icons in Everything
SetNewIcon=^S | Set New Folder Icon
FastSetNewIcon=!+F | Set New Folder Icon && Exit App
SaveFolderToHistory=^+F | Save Working Folder Path to History
SaveIcontoHistory=^+I | Save Working Icon path to History
ShowFolderHistoryMenu=^H | Show Menu - History
ShowHotkeyMenu=F1 | Show Menu - Quick Actions && Hotkeys
ShowLoadFolderfromDOPUSmenu=^D | Show Menu - Load Folder from Dopus Tabs
ShowOpenFolderMenu=^G | Show Menu - Open Folder in File Manager
ShowSettingsMenu=F11 | Show Menu - Settings
togToolTips=^F8 | Toggle GUI Tooltips
VisitGithubWebpage=^+F1 | Visit Change Folder .Ico Webpage

;-------------------------
[Programs]
dopus=C:\Program Files\GPSoftware\Directory Opus\dopus.exe
dopusrt=C:\Program Files\GPSoftware\Directory Opus\dopusrt.exe
;; For the Apps Launcher Bar... Replace these example programs paths with your own Favorite apps. use the full path.
;; These buttons will not appear on the gui until your set them here.
IconViewer=C:\Program Files\XnViewMP\xnviewmp.exe
IconConverter=C:\Program Files\XnConvert\xnconvert.exe
IconEditor1=C:\Program Files\Adobe\Adobe Photoshop CS6 (64 Bit)\Photoshop.exe
IconEditor2=C:\Program Files Portable\icofx3\icofx3.exe
IconEditor3=C:\Program Files\Adobe\Adobe Photoshop 2020\photoshop.exe
IconEditor4=C:\Program Files\GIMP 3\bin\gimp-3.exe
MSPaint=C:\Windows\System32\mspaint.exe
EveryThing15a=C:\Program Files\Everything 1.5a\Everything64.exe
texteditor=C:\Program Files\Notepad++\notepad++.exe
;-------------------------
[WindowPos]
X=500
Y=500
;-------------------------


), %inifile%
sleep 1000

FileAppend,
(


;------------------------- v.2025.03.27

* GUI Updates...
*+ added icons to all GUI buttons, because... ICONS!
* changed all buttons to darkmode.
+ added light mode theme 
! improved tooltip handling so that they don't pause the program

NOTE! This is the Last Release!

Unless anyone reports bug issues. There's likely a few small ones.
Thou...
I've been using this and am content with it.
I'll be uploading the source code and required icons to github soon.
Y'all can have some fun tweaking it if you wish.


;------------------------- v.2025.03.23

** changed app icon to the new win11 fluent style
!* adjusted searching icons with everything to only send the icon name rather then the full path, and removed the "quotes" it was sending around search terms
+ added a hotkey to send icon searches to everything
! fixed reload hotkey conflict that was causing it not to show up in live menu and buttons


;------------------------- v.2025.03.20

* gui layout tweaks
+ added dynamic hotkeys labels to buttons
! fixed window position incorrectly being written to .ini
!+ fixed and added saving window position on a Reload, it only saved on Exit before

* Cleaned up dynamic menus a bit...
+ increased the folder & icon history to 30 items from 15
+ added modifier + click functionality History menu with labels where they apply.
+ added the ability to delete individual items from the history if the menu starts to get to large without erasing the entire history. Hold ctrl+shift and click to delete a single item.
+ added Friendly\Readable Menu names to the items on the Quick Actions & Live Hotkeys Menu


;------------------------- v.2025.03.15

+ added Everything1.5a, https://www.voidtools.com/forum/viewtopic.php?t=9787, integration to the apps bar. it will send any search text or an .ico path to Everything with extension file filter in place for searching .ico's on your C: drive, e.g. ext:ico c: folder icon

+ started and included this changelog

! improvements to saving folder & icon history when update the ini file


;------------------------- v2025.03.11

added the ability to click and drag on the gui to move it

! important ! FIX - Removed an accidentally left behind hotkey, NumbadSub that was being used for testing

Fixed\Improved file versioning checks for proper updates when a new version\installer is run from within or at the parent level dir

To update, run this inside the folder an existing install.

updated github in app menu

fixed minor menu error

fixed typo in start menu link

;------------------------- v2025.03.10

1st Release

Download Portable Installer, it will copy itself into its own directory with some icons and a settings.ini

No system changes are made.

;------------------------- v.2025.03.27

* GUI Updates...
*+ added icons to all GUI buttons, because... ICONS!
* changed all buttons darkmode.
+ added light mode theme
! improved tooltip handling so that they don't pause the program

NOTE! This is the Last Release!

Unless anyone reports bug issues. There's likely a few small ones.
Thou...
I've been using this and am content with it.
I'll be uploading the source code and assistes to github soon.
Y'all can have some fun tweaking it if you wish.


;------------------------- v.2025.03.23

** changed app icon to the new win11 fluent style
!* adjusted searching icons with everything to only send the icon name rather then the full path, and removed the "quotes" it was sending around search terms
+ added a hotkey to send icon searches to everything
! fixed reload hotkey conflict that was causing it not to show up in live menu and buttons


;------------------------- v.2025.03.20

* gui layout tweaks
+ added dynamic hotkeys labels to buttons
! fixed window position incorrectly being written to .ini
!+ fixed and added saving window position on a Reload, it only saved on Exit before

* Cleaned up dynamic menus a bit...
+ increased the folder & icon history to 30 items from 15
+ added modifier + click functionality History menu with labels where they apply.
+ added the ability to delete individual items from the history if the menu starts to get to large without erasing the entire history. Hold ctrl+shift and click to delete a single item.
+ added Friendly\Readable Menu names to the items on the Quick Actions & Live Hotkeys Menu


;------------------------- v.2025.03.15

+ added Everything1.5a, https://www.voidtools.com/forum/viewtopic.php?t=9787, integration to the apps bar. it will send any search text or an .ico path to Everything with extension file filter in place for searching .ico's on your C: drive, e.g. ext:ico c: folder icon

+ started and included this changelog

! improvements to saving folder & icon history when update the ini file


;------------------------- v2025.03.11

added the ability to click and drag on the gui to move it

! important ! FIX - Removed an accidentally left behind hotkey, NumbadSub that was being used for testing

Fixed\Improved file versioning checks for proper updates when a new version\installer is run from within or at the parent level dir

To update, run this inside the folder an existing install.

updated github in app menu

fixed minor menu error

fixed typo in start menu link

;------------------------- v2025.03.10

1st Release

Download Portable Installer, it will copy itself into its own directory with some icons and a settings.ini

No system changes are made.


), %changelog%, utf-8
sleep 500
return

INIReadSection(sectionName) ;; function
{
    global
    IniRead, SectionContent, %inifile%, %sectionName%
    if (SectionContent = "ERROR")
        return

    Loop, Parse, SectionContent, `n, `r
    {
        if (A_LoopField = "")
            continue

        KeyParts := StrSplit(A_LoopField, "=")
        if (KeyParts.Length() < 2)
            continue

        VarName := KeyParts[1]
        VarValue := KeyParts[2]

        if (VarValue = "" || VarValue = "ERROR")
            VarValue := (sectionName = "Settings") ? 0 : ""  ; Default Settings to 0 if empty

        ; Assign dynamically as a global variable
        %VarName% := VarValue
    }
}



/*

 INIReadHotkeySection(sectionName) ;; function ;; old , works great, updated to make a live menu of the active hotkeys.
{
    global
    IniRead, HotkeySection, %inifile%, %sectionName%
    if (HotkeySection = "ERROR")
        return

    Loop, Parse, HotkeySection, `n, `r
    {
        if (A_LoopField = "")
            continue

        KeyParts := StrSplit(A_LoopField, "=")
        if (KeyParts.Length() < 2)
            continue

        LabelName := KeyParts[1]
        HotkeyValue := KeyParts[2]

        if (HotkeyValue = "" || HotkeyValue = "ERROR")
            continue

        ; Store hotkey as a global variable
        %LabelName% := HotkeyValue

        ; Register hotkey
        try {
            Hotkey, %HotkeyValue%, %LabelName%, On
        } catch {
            continue
        }

; Convert symbols to words for display
        ReadableHotkey := ConvertAHKSymbolToWords(HotkeyValue)

		Menu, k, Add, %LabelName%`t%ReadableHotkey%, %LabelName%
        ; Add to menu dynamically
        ; Menu, HotkeyMenu, Add, %LabelName%`t[%HotkeyValue%], %LabelName%
		
    }
} 

*/

INIReadHotkeySection(sectionName) ;; function ;; v8 - FIXED: Menu shows ReadableHotkey, keeps raw hotkeys global
{
    global
    IniRead, HotkeySection, %inifile%, %sectionName%
    if (HotkeySection = "ERROR")
        return

    local inikeycount := 0
    local MenuItems := ""  ; String to store sortable items

    Loop, Parse, HotkeySection, `n, `r
    {
        if (A_LoopField = "")
            continue

        KeyParts := StrSplit(A_LoopField, "=")
        if (KeyParts.Length() < 2)
            continue

        LabelName := Trim(KeyParts[1])
        FullValue := Trim(KeyParts[2])

        if (FullValue = "" || FullValue = "ERROR")
            continue

        ValueParts := StrSplit(FullValue, "|")
        HotkeyValue := Trim(ValueParts[1])
        FriendlyName := (ValueParts.Length() > 1 && ValueParts[2] != "") ? Trim(ValueParts[2]) : LabelName

        ; Store raw hotkey globally under its label
        %LabelName% := HotkeyValue  

        try {
            Hotkey, %HotkeyValue%, %LabelName%, On
            inikeycount++
            totaliniCount++
        } catch {
            continue
        }

        ReadableHotkey := ConvertAHKSymbolToWords(HotkeyValue)
        MenuItems .= FriendlyName "¦" ReadableHotkey "¦" LabelName "`n"  ; Store sortable format
    }

    ; **Sort menu items alphabetically by FriendlyName**
    Sort, MenuItems

    ; **Rebuild menu with sorted items**
    Loop, Parse, MenuItems, `n
    {
        if (A_LoopField = "")
            continue

        Parts := StrSplit(A_LoopField, "¦")
        FriendlyName := Parts[1]
        ReadableHotkey := Parts[2]  ; Now storing human-readable hotkey
        LabelName := Parts[3]

        DisplayName := FriendlyName . "`t" . ReadableHotkey  ; Now menu shows readable hotkeys

        MenuVars[DisplayName] := LabelName  ; Store label name under the menu item
        Menu, k, Add, %DisplayName%, %LabelName%
    }
}

ConvertAHKSymbolToWords(hotkey)
{
    hotkey := StrReplace(hotkey, "+", "Shift+")
    hotkey := StrReplace(hotkey, "^", "Ctrl+")
    hotkey := StrReplace(hotkey, "!", "Alt+")
    hotkey := StrReplace(hotkey, "#", "⊞+") ; ⊞ + 
    ; hotkey := StrReplace(hotkey, "⊞", "Win+")
    return hotkey
}

showhotkeymenu:
CoordMode,menu,client
menu, k, show,10,10
return

INIReadHotkeys() ;; function
{
    global
    IniRead, HotkeySection, %inifile%, Hotkeys
    if (HotkeySection = "ERROR")
        return

    Loop, Parse, HotkeySection, `n, `r
    {
        if (A_LoopField = "")
            continue

        KeyParts := StrSplit(A_LoopField, "=")
        if (KeyParts.Length() < 2)
            continue

        LabelName := KeyParts[1]
        HotkeyValue := KeyParts[2]

        if (HotkeyValue = "" || HotkeyValue = "ERROR")
            continue

        try {
			; Hotkey, IfWinActive, - Change Folder .Ico - ahk_class AutoHotkeyGUI
            Hotkey, %HotkeyValue%, %LabelName%, On
			; hotkey, IfWinActive
        } catch {
            continue
        }
    }
}
UpdateINI(inifile, section, key, defaultValue) {
	;; e.g. UpdateINI(inifile, "General", "Theme", "Dark")
    IniRead, userValue, %inifile%, %section%, %key%, ERRORVALUE  ; Reliable default

    if (userValue = "ERRORVALUE") {  ; If key is missing, write default
        IniWrite, %defaultValue%, %inifile%, %section%, %key%
    }
}


	
VisitGithub:
VisitGithubWebpage:
run %githuburl%
return


;; work, keep testing others
folderhistorymenu:
MENU, h, add
Menu, h, DeleteAll ; Clear previous menu

Menu, h, Add, Folder History  --> (Click to Save Active Folder For Later)`t%SaveFolderToHistory%, SaveFolderToHistory
Menu, h, icon, Folder History  --> (Click to Save Active Folder For Later)`t%SaveFolderToHistory%, %icons%\folderhistory.ico,,24
Menu, h, default, Folder History  --> (Click to Save Active Folder For Later)`t%SaveFolderToHistory%
Menu, h, Add ; Separator

historyFound := false
; log := "Reading History Entries:`n`n" ;; debug
Loop, 30
{
    IniRead, folder, %IniFile%, Folder_History, Entry%A_Index%, %A_Space%
    ; log .= "Entry " A_Index ": " folder "`n"  ; Log what was read ;; debug
    if (folder != "" && folder != A_Space) {
        Menu, h, Add, %folder%, LoadHistoryFolder
        Menu, h, icon, %folder%, % GetFileIcon(folder)
        historyFound := true
		
    }
}
if (historyfound)
	{
		Menu, h, add, ; line -------------------------
		menu, h, add, 🡱 Hold Ctrl && Click to Open Folder in File Manager 🡱 , donothing
		menu, h, icon, 🡱 Hold Ctrl && Click to Open Folder in File Manager 🡱 , %icons%\about.ico
	}
if (!historyFound) ; If no history exists, add a placeholder entry
    {
	Menu, h, Add, (No History Found!), donothing
    Menu, h, icon, (No History Found!), %iconerror%,,32
	Menu, h, default, (No History Found!)
	; menu, h, delete, Delete History
	}
menu, h, add, ; line -------------------------
menu, h, add, Icon History  --> (Click to Save Active Icon For Later)`t%SaveIconToHistory%, SaveIconToHistory
menu, h, Icon, Icon History  --> (Click to Save Active Icon For Later)`t%SaveIconToHistory%, %icons%\ChangeFolderIcon.ico,,24
menu, h, add, ; line -------------------------
Loop, 30
{
    IniRead, Icon, %IniFile%, Icon_History, Entry%A_Index%, %A_Space%
    ; log .= "Entry " A_Index ": " folder "`n"  ; Log what was read ;; debug
    if (icon != "" && icon != A_Space) {
        Menu, h, Add, %icon%, loadhistoryicon
        Menu, h, icon, %icon%, % GetFileIcon(icon)
        historyFound := true
    }
}
if (historyfound)
	{
		menu, h, add, ; line -------------------------
		menu, h, add, Hold Ctrl+Shift && Click to Delete Single Items from History. Delete All in Settings Menu., ShowSettingsMenu
		menu, h, icon, Hold Ctrl+Shift && Click to Delete Single Items from History. Delete All in Settings Menu., %icons%\about.ico,,24
	}
Return
showfolderhistorymenu:
coordmode,Menu,Client
gosub folderhistorymenu
menu, h, show,10,10
return
LoadHistoryFolder:
if (GetKeyState("Ctrl", "P") && GetKeyState("Shift", "P"))
{
	clickedEntry := A_ThisMenuItem  ; The text of the clicked menu item
	Loop, 30 ; Loop through your INI entries to find the matching one
	{
		IniRead, thisEntry, %inifile%, Folder_History, Entry%A_Index%
		if (thisEntry = clickedEntry)
		{
			IniDelete, %inifile%, Folder_History, Entry%A_Index%
			break
		}
	}
	Return  ; Stop further processing
}
if (GetKeyState("Ctrl", "P"))
{
	clickedEntry := A_ThisMenuItem
	run %A_ThisMenuItem%
	return
}
folder := A_ThisMenuItem
GuiControl,, folderpath, %folder%
gosub LoadFolderPath
Return
loadhistoryicon:
if (GetKeyState("Ctrl", "P") && GetKeyState("Shift", "P"))
{
	clickedEntry := A_ThisMenuItem  ; The text of the clicked menu item
	Loop, 30 ; Loop through your INI entries to find the matching one
	{
		IniRead, thisEntry, %inifile%, Icon_History, Entry%A_Index%
		if (thisEntry = clickedEntry)
		{
			IniDelete, %inifile%, Icon_History, Entry%A_Index%
			break
		}
	}
	Return  ; Stop further processing
}
icon := A_ThisMenuItem
GuiControl,,iconpath, %icon%
gosub PreviewIcon
return
deletefolderhistorysection:
MsgBox, 4148, - Change Folder .Ico - ? Delete History, Deleting Folder & Icon History...`n`nThis cannot be undone.`n`nContinue... ??
IfMsgBox No
	return
inidelete, %inifile%, Folder_History
inidelete, %inifile%, Icon_History
return


SaveFolderToHistory:
gui,submit,nohide
if Fileexist(folderpath)
	{
		SaveFolderHistory(folderpath)
		tooltip Folder saved to history.
	}
else
	{
		tooltip The Folder path does not exisit.`nNothing to save.
	}
SetTimer, RemoveTooltip, -2000	
return
SaveIconToHistory:
gui,submit,nohide
if Fileexist(iconpath)
	{
	splitpath,iconpath,,,ext
	if (ext = "ico")
		{
		SaveIconHistory(iconpath)
		tooltip Icon saved to history.
		SetTimer, RemoveTooltip, -2000	
		return
		}
	else
		{
		tooltip, Only .ico files can be saved.
		SetTimer, RemoveTooltip, -2000	
		return
		}
	}
else
	{
		tooltip The Icon path does not exisit.`nNothing to save.
		SetTimer, RemoveTooltip, -2000	
	}
return

SaveFolderHistory(folder) {
    global IniFile

    history := []    ; Read existing history from the [History] section
    seen := {}  ; Dictionary to track unique entries

    Loop, 30
    {
        IniRead, entry, %IniFile%, Folder_History, Entry%A_Index%, %A_Space%  ; Default to space if not found
        entry := Trim(entry)  ; Remove accidental spaces

        if (entry != "" && entry != A_Space && !seen.HasKey(entry)) {        ;  Only add if not blank and not already in dictionary (case insensitive)
            history.Push(entry)
            seen[entry] := true  ; Mark as seen
        }
    }

    folder := Trim(folder)  ; Ensure no accidental spaces    ; Prevent adding a duplicate of `folder`
    if (folder != "" && !seen.HasKey(folder)) {
        history.InsertAt(1, folder)  ; Add new entry at the top
        seen[folder] := true  ; Mark it as seen
    }

    while (history.Length() > 30)    ; Keep only the last 30 entries
        history.Pop()

    IniDelete, %IniFile%, Folder_History    ; Clear the INI section before writing to prevent gaps

    Loop % history.Length()    ;  Write the cleaned-up list back
        IniWrite, % history[A_Index], %IniFile%, Folder_History, Entry%A_Index%
}

SaveIconHistory(icon) {
    global IniFile

    history := []    ; Read existing history from the [History] section
    seen := {}  ; Dictionary to track unique entries

    Loop, 30
    {
        IniRead, entry, %IniFile%, Icon_History, Entry%A_Index%, %A_Space%  ; Default to space if not found
        entry := Trim(entry)  ; Remove accidental spaces

        if (entry != "" && entry != A_Space && !seen.HasKey(entry)) {        ;  Only add if not blank and not already in dictionary (case insensitive)
            history.Push(entry)
            seen[entry] := true  ; Mark as seen
        }
    }

    icon := Trim(icon)  ; Ensure no accidental spaces    ; Prevent adding a duplicate of `folder`
    if (icon != "" && !seen.HasKey(icon)) {
        history.InsertAt(1, icon)  ; Add new entry at the top
        seen[icon] := true  ; Mark it as seen
    }

    while (history.Length() > 30)    ; Keep only the last 30 entries
        history.Pop()

    IniDelete, %IniFile%, Icon_History    ;  Clear the INI section before writing to prevent gaps

    Loop % history.Length()    ;  Write the cleaned-up list back
        IniWrite, % history[A_Index], %IniFile%, Icon_History, Entry%A_Index%
}


setmenu:
menu, s, add
menu, s, deleteall
menu, s, add, Change Folder .Ico -- Settings Menu`t%showsettingsmenu%, showsettingsmenu
menu, s, icon, Change Folder .Ico -- Settings Menu`t%showsettingsmenu%, %icons%\changefoldericon.ico,,24
menu, s, default, Change Folder .Ico -- Settings Menu`t%showsettingsmenu%,
menu, s, add, ; line -------------------------
if WinExist("ahk_class dopus.lister") && !FileExist(dopusrt)
	{
	menu, s, add, Update Dopus Location!!!, updatedopusrt
	menu, s, icon, Update Dopus Location!!!, %icons%\attention.ico,,28
	menu, s, default, Update Dopus Location!!!
	menu, s, add, ; line -------------------------
	}
Menu, s, Add, Toggle  Dark <> Light  Theme`t%DMToggle%, DMToggle 
Menu, s, icon, Toggle  Dark <> Light  Theme`t%DMToggle%, %icons%\darkmode.ico

menu, s, add, Remember Window Position, togrememeberwindowpostion
menu, s, icon, Remember Window Position, %icons%\winpos.ico
if (RememberWindowPos)
	menu, s, ToggleCheck, Remember Window Position
menu, s, add, Start Pinned to Top, Pintoggle
menu, s, icon, Start Pinned to Top, %icons%\pinnedtotop.ico
if (startontop)
	menu, s, ToggleCheck, Start Pinned to Top
	
menu, s, add, Remember Changed Folder History, historytoggle
menu, s, icon, Remember Changed Folder History, %icons%\folderhistory.ico 
if (RememberHistory)
	menu, s, ToggleCheck, Remember Changed Folder History

	
menu, s, add, Auto check for folder path in clipboard on startup, togautoclipboard
menu, s, icon, auto check for folder path in clipboard on startup, %icons%\checkclipboard.ico
if (AutoCheckClipboard4Path)
	menu, s, togglecheck, Auto check for folder path in clipboard on startup



menu, s, add, Hide Tooltips. I know my way around now.`t%togToolTips%, togtooltips
menu, s, icon, Hide Tooltips. I know my way around now.`t%togToolTips%, %icons%\tooltip.ico
if (HideTooltips)
	menu, s, ToggleCheck, Hide Tooltips. I know my way around now.`t%togToolTips%
menu, s, add, Hide the App Bar, Toggleappbar
menu, s, icon, Hide the App Bar, %mspaint%
if !(ShowAppBar)
	menu, s, togglecheck, Hide the App Bar
menu, s, add, Hide Optional Folder Info Tip Extras, Toginfotips
menu, s, icon, Hide Optional Folder Info Tip Extras, %icons%\tooltip.ico
if !(showInfoTipExtras)
	menu, s, togglecheck, Hide Optional Folder Info Tip Extras

menu, s, add, Create Shortcut in Start Menu, startlink
menu, s, icon, Create Shortcut in Start Menu, %icons%\startmenu.ico	
if FileExist(startlink)
	menu, s, disable, Create Shortcut in Start Menu
menu, s, add, ; line -------------------------
menu, s, add, Edit Settings File`t%editCFIsettings%, editini
menu, s, icon, Edit Settings File`t%editCFIsettings%, %icons%\settingsaltini.ico
if !(a_isadmin)
	{
	menu, s, add, Run as Admin`t%RunAsAdmin%, RunAsAdmin
	menu, s, icon, Run as Admin`t%RunAsAdmin%, %Icons%\admin.ico
	}
else
	{
	Menu, s, add, Script is Running as ADMIN, warnadmin
	menu, s, icon, Script is Running as ADMIN, %Icons%\adminrunning.ico
	}
	
menu, s, add, Always Force Windows to Apply New Icons on Save, ForceApplyNOWtoggle ;ForceApplyNOWtoggle
menu, s, icon, Always Force Windows to Apply New Icons on Save, %icons%\forcewinreload.ico
if (ForceApplyNOW)
	menu, s, ToggleCheck,  Always Force Windows to Apply New Icons on Save
menu, s, add, Force Windows Explorer && Icon Cache Reload **NOW`t%ForceWindowExplorerReload%, ForceWindowExplorerReload ;forcewinreload
menu, s, icon, Force Windows Explorer && Icon Cache Reload **NOW`t%ForceWindowExplorerReload%, %Icons%\adminrunning.ico
; If (A_Username != "CLOUDEN")
	; {
		menu, s, add, Delete Folder && Icon History's, deletefolderhistorysection
		menu, s, icon, Delete Folder && Icon History's, %icons%\trashbin.ico
	; }
menu, s, add, ; line -------------------------
Menu, s, add, About`t%AboutMessage%, AboutMessage
Menu, s, icon, About`t%AboutMessage%, %icons%\about.ico
menu, s, add, Visit Github Webpage`t%visitgithubwebpage%, VisitGithub
menu, s, icon, Visit Github Webpage`t%visitgithubwebpage%, %icons%\Githubicon.ico
; menu, s, add, Full Hotkey Menu >>>`t%showhotkeymenu%, :k
menu, s, add, Quick Actions && Hotkeys Menu >>>`t%showhotkeymenu%, :k
menu, s, icon, Quick Actions && Hotkeys Menu >>>`t%showhotkeymenu%, %icons%\hotkeys.ico
menu, s, add, ; line ------------------------- 
menu, s, add, Reload`t%reloadCFI%, reloadCFI
menu, s, icon, Reload`t%reloadCFI%, %icons%\reload.ico
menu, s, add, Quit \ Exit`t%exit%, exit
menu, s, icon, Quit \ Exit`t%exit%, %icons%\exitapp.ico
	If (A_IsCompiled)
		{
		}
	else
		{
			menu, s, add, ; line ------------------------- 
			menu, s, add, Edit Script`t%editscript%, editscript
			menu, s, icon, Edit Script`t%editscript%, %texteditor%
			menu, s, add, Open A_ScriptDir`t%openscriptdir%, openscriptdir
			menu, s, icon, Open A_ScriptDir`t%openscriptdir%, explorer.exe
		}

return
Showsettingsmenu:
gosub setmenu
CoordMode,menu,client
menu, s, show,10,10
return
openscriptdir:
run "%a_scriptdir%"
return
Editscript:
if !(A_IsCompiled)
	run notepad++.exe "%a_scriptfullpath%"
else
	Run "%A_scriptdir%"
return

openfolderpropteries:
gui, submit,hide
if fileexist(folderpath)
	if FileExist(dopusrt)
		run, %dopusrt% /cmd Properties "%iconpath%"
	else
		run, Properties "%folderpath%"
else
	{
		Tooltip, ERR! @ Line#:  %A_LineNumber%`nThe file from your selection could not be found.
		SetTimer, RemoveTooltip, -2000	
	}
return

togrememeberwindowpostion:

RememberWindowPos := !RememberWindowPos
if (RememberWindowPos) ; RememberWindowPos
	{
		iniwrite, 1, %inifile%, Settings, RememberWindowPos
		menu, s, ToggleCheck, Remember Window Position
	}
else
	{
		iniwrite, 0, %inifile%, Settings, RememberWindowPos
		menu, s, ToggleCheck, Remember Window Position
	}
tooltip This setting requires a reload to take affect
SetTimer, RemoveTooltip, -3000	
return

togtooltips:
HideTooltips := !HideTooltips
if (HideTooltips)
	{
		iniwrite, 1, %inifile%, Settings, HideTooltips
		AddTooltip("Deactivate")	
		menu, s, ToggleCheck, Hide Tooltips. I know my way around now.`t%togToolTips%
	}
else
	{
		iniwrite, 0, %inifile%, Settings, HideTooltips
		AddTooltip("Activate")
		menu, s, ToggleCheck, Hide Tooltips. I know my way around now.`t%togToolTips%
	}
return

Hotkeyhelp:
Hotkeytip= 
(

There are more hotkeys than there are menuitems in the setting file that you can customaize from the settings menu.

The Hotkeys menu will update if you change them and only appear when set. You're free to removed them as well.

[Hotkeys]
This Section only works when the...
- Change Folder .Ico -
... window is active. Most but not all have menu items

[Global_Hotkeys]
These apply system wide!
You can move the labels from above down here
if you want to and they will change according. 
Thou most of them aren't practily as global keys.


TO SET HOTKEYS

Set the Key after, to the right of the " = " and before the " | "
** Do not rename the labels to left of the " = "
if you feel like you broke something, just rename or delete the settings file. The program will make a new default one upon reloading.

AutoHotkey's Modifier Symbols are...
Ctrl = ^
Shift = +
Win = #
Alt = !

Would you like to open the settins file now?

OK = Open -SETTINGS.ini
Cancel = Maybe Next Time
)

MsgBox, 262468, - Change Folder .Ico - ? Hotkey Help ?,%Hotkeytip%
IfMsgBox, Yes
	goto EditCFISettings
return

EditCFISettings:
editini:
try run "%inifile%"
catch
try run notepad++.exe "%inifile%"
catch
try run notepad.exe "%inifile%"
return
Pintoggle:
StartOnTop := !StartOnTop
if (StartOnTop)
	{
	IniWrite, 1, %inifile%, Settings, StartOnTop
	; WinSet, SubCommand, Value [, WinTitle, WinText, ExcludeTitle, ExcludeText]
	WinSet, AlwaysOnTop, On,,Pin\Unpin From Top,Notepad++
	menu, s, ToggleCheck, Start Pinned to Top
	GuiControl,,pin,1
	}
else
	{
	IniWrite, 0, %inifile%, Settings, StartOnTop
	WinSet, AlwaysOnTop, Off,,Pin\Unpin From Top,Notepad++
	menu, s, ToggleCheck, Start Pinned to Top
	GuiControl,,pin,0
	}
Return

historytoggle:
RememberHistory := !RememberHistory
if (RememberHistory)
	{
		iniwrite, 1, %inifile%, Settings, RememberHistory
		menu, s, ToggleCheck, Remember Changed Folder History
		GuiControl,show,hashistory
	}
else
	{
		iniwrite, 0, %inifile%, Settings, RememberHistory
		GuiControl,hide,hashistory
	}

Return
startlink:
FileCreateShortcut, %A_ScriptFullPath%, %A_StartMenu%\Programs\%ScriptName%.lnk,,,%Description%,%trayicon%,,0
iniwrite, 1, %inifile%, Settings, StartLinkCreated ;; todo, read for link for broken\changed path. remove it that happens.
return
ForceApplyNOWtoggle:
ForceApplyNOW := !ForceApplyNOW
if (ForceApplyNOW)
	{
		iniwrite, 1, %inifile%, Settings, ForceApplyNOW
		menu, s, ToggleCheck,  Always Force Windows to Apply New Icons on Save
		GuiControl,,forcewindownsreload,1
	}
else
	{
		iniwrite, 0, %inifile%, Settings, ForceApplyNOW
		menu, s, ToggleCheck,  Always Force Windows to Apply New Icons on Save
		GuiControl,,forcewindownsreload,0
	}
Return


togautoclipboard:
AutoCheckClipboard4Path := !AutoCheckClipboard4Path
if (AutoCheckClipboard4Path)
	{
		iniwrite, 1, %inifile%, Settings, AutoCheckClipboard4Path
		menu, s, togglecheck, Auto check for folder path in clipboard on startup
	}
else
	{
		iniwrite, 0, %inifile%, Settings, AutoCheckClipboard4Path
		menu, s, togglecheck, Auto check for folder path in clipboard on startup
	}
return

dllmsgbox:

dllwarning =
(

This file is not a .ico

This tool was written with the simplicity, ease and speed .ico files in mind. I recommend them here. I have NOT fully tested using .dll files. `(And currently don't plan on it either.`)

It can obviously, and in most casees, will work to apply .dll's, .exe's and .icl's, Windows does it all the time for most of its system folders.

HOWEVER! These File Types require an additional IconIndex or IconResource # assigned to them.

The "Override IconIndex #" checkbox will allow you to assign a custom Index# to the end of IconResource. `(The default is 0 which is what an existing .ico file.`)

It will be written like this in the desktop.ini file.
IconResource=C:\path to\your.dll,`(your index #`)

** THIS IS EXPERIMENTAL !! This may apply the wrong icon !! ** Continue at your own risk. **

An error, the wrong icon being applied, is fairly harmless, more-so annoying if you need to Re-Set a desktop.ini

You've Been Warned!

)

MsgBox, 262144, - Change Folder .Ico - ? Non-ico Warning ?,  %dllwarning%

return



helloandwelcome:
guicontrol,,folderpath,%a_scriptdir%
gosub loadfolderpath
sleep 300
guicontrol,,iconpath,%a_scriptdir%\Icons\ChangeFolderIcon.ico
gosub PreviewIcon
guicontrol,,forcewindownsreload,0
guicontrol,,allowTTB,1
guicontrol,enable,infotip,
guicontrol,,infotip,%Description%

hellobox =

(
Thank for checking out - Change Folder .Ico -
It can %Description%.

-------------------------

It seems this is your first time running it, or you just reset your settings.ini file.

It was written to set ".ico" file paths into a folders desktop.ini file which Windows uses apply custom folder icons.

Other file types can be pushed through this tool BUT it has limited capability dealing with .dlls and .exes files.
The ICO Format works best here!

-------------------------

The Folder where the this Apps lives, and its icon, has been loaded into the GUI as an example. The icon has not been set yet. Click "Set New Icon" button or "Ctrl+S" to apply the icon to this folder!
Its Just about that Simple!

-------------------------

The F1 Hotkey will Show a Live Hotkeys \ Quick Actions Menu that Run most of the buttons and menu items from this GUI. You can customize them in the %a_scriptname%-SETTINGS.ini file.

If you have any questions not answered by the few info message boxes, (or find a bug), Visit the Github Webpage from the Settings Menu for more info.

Have Fun With Your New Folder Icons!!!

)

MsgBox, 4160, - Change Folder .Ico - Hello && Welcome !, %hellobox%

return

