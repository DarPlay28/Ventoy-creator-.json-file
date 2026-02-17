#SingleInstance Force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
OnMessage(0x201,"Check_Control") ; Убедитесь, что функция Check_Control определена, если она используется.

SetBatchLines -1

way := "data/info.egl"

; Чтение пользовательских данных
IniRead dname, %way%, USER, dname
IniRead dnf, %way%, USER, dnf

global prefixParametr := ["", "_legacy", "_uefi", "_ia32", "_aa64", "_mips"]
global gfxmodeL := ["max"]
global classOS := ["windows7", "windows10", "windows11"]
global diskLettelUSB := ""
#Include %A_ScriptDir%\CreatorListStringWay.ahk
;#Include %A_ScriptDir%\Data\ListStringWay.ahk
global prefixTV := waylistOS[2] ; prefixThemeVentoy
#Include %A_ScriptDir%\CreatorListStringOS.ahk
#Include %A_ScriptDir%\Data\ListStringOS.ahk
#Include %A_ScriptDir%\CreatorListStringTheme.ahk
;#Include %A_ScriptDir%\Data\ListStringTheme.ahk

File := dlf . ":\ventoy\ventoy.json"
FileAppend,, % File

StartInc = true
strOS :=

#Include %A_ScriptDir%\lib\DropDownList_to_load.ahk

ListThem := DropDLToLoad(listTheme[1], listTheme[2][1])

Gui +hwndhGui

;Text - Edit; Сначала описание поля ввода, а потом само поле ввода
Gui, font, s8,, Verdana
Gui, Margin, 10, 5
Gui Add, Text, x5 h23, Номер файла по умолчанию: ;Text
Gui, Margin,, -25
Gui Add, Edit, x160 w170 h23 vdfile, %dnf% ;Edit  % waylistOS[2][1]
Gui, Margin, 10, 5
Gui Add, Text, x5 h23, Буква диска флешки: ;Text
Gui, Margin,, -25
Gui Add, Edit, x160 w170 h23 vdlf, %dname% ;Edit ; Disk (Dir) Lettel (Буква) USB Flash
Gui, Margin,, 5
Gui Add, Text, x5 h23, Тема по умолчанию: ;Text
Gui, Margin,, -25
Gui, Add, DropDownList, x160 w170 vdtheme, %ListThem% ;Edit
/*
Gui, Margin,, 5
Gui Add, Text, x5 h23, Город: ;Text
Gui, Margin,, -25
Gui, Add, DropDownList, x160 w170 vsity1, %ListSity% ;Edit
Gui, Margin,, 5
Gui Add, Text, x5 h23, Состав: ;Text
Gui, Margin,, -25
Gui, Add, Edit, x160 w170 vstructure1 Number, %structure% ;Edit
*/
Gui, Margin, 10, 5

Gui, Add, Button, x3 y185 w100 h23 gRun, &Готово
; Gui, Add, Button, x103 y185 w70 h23 gInfo, &Подробнее
Gui, Add, Button, x3 y210 w100 h23 gSaveInfo, &Сохранить
; Gui, Add, Button, x103 y210 w70 h23 gRel, &Перезапуск

Gui Show, xCenter yCenter, Бинд на медики
WinActivate Бинд на медики
Return ; Конец авто-выполняемой секции



SaveInfo:
    Gui, 1:Submit, NoHide
    IniWrite %dlf%, %way%, USER, dname
    IniWrite %dfile%, %way%, USER, dnf
    listTheme[2][1] := dnf
Return

Run:
    strOS =
    Gui, 1:Submit, NoHide
    File := dlf . ":\ventoy\ventoy.json"
    FileDelete, % File

    #Include %A_ScriptDir%\Lib\control.ahk
    #Include %A_ScriptDir%\Lib\theme.ahk
    #Include %A_ScriptDir%\Lib\menu_alias.ahk
    #Include %A_ScriptDir%\Lib\menu_tip.ahk
    #Include %A_ScriptDir%\Lib\menu_class.ahk
    #Include %A_ScriptDir%\Lib\image_list.ahk
    strOS := StrReplace(strOS, "`n", "`n    ")
    strOS := "{" . strOS . "`n}"
    strOS := StrReplace(strOS, "[,", "[")
    strOS := StrReplace(strOS, "{,", "{")
    FileAppend, % strOS, % File, UTF-8
    if ErrorLevel {
        MsgBox, Не удалось прочитать файл %File%.
        FileAppend,, % File
        return
    }
    MsgBox, Готово! Сохранено в %File%
Return

GuiClose: ; Вызывается при закрытии главного GUI (Gui 1)
    ExitApp
    ; IfMsgBox Cancel - ничего не делаем, окно остается
Return

    ; 1. Получаем текст из буфера обмена
    ; Убедимся, что буфер обмена очищен перед ожиданием нового текста
    /*Clipboard := ""
    ClipWait, 15 ; Ждем до 15 секунд, пока буфер обмена не заполнится текстом
    if ErrorLevel {
        MsgBox, Время ожидания буфера обмена истекло или буфер пуст.
        return
    }
	*/