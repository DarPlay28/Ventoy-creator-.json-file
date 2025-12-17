File := "Data\edit_theme.txt"
File2 := "Data\ListStringTheme.ahk"

MyTheme := "f"

FileRead, MyTheme, % File
if ErrorLevel {
    MsgBox, Не удалось прочитать файл %File%.
    return
}

LineArray := StrSplit(MyTheme, "`n", "`r")

Groups := [] ; Инициализация объекта (массива)
CurrentGroup := []

for index, line in LineArray
{
    if (line == "*")
    {
        if (CurrentGroup.Length() > 0) {
            Groups.Push(CurrentGroup)

            CurrentGroup := []
        }
    }
    else
    {
        CurrentGroup.Push(line)
    }
}

if (CurrentGroup.Length() > 0) {
    Groups.Push(CurrentGroup)
}

MyThemeFormatted := "global listTheme := ["

for i, group in Groups
{
    MyThemeFormatted .= "[" ; Открываем внутренний массив

    for j, item in group
    {
        MyThemeFormatted .= """" item """"
        if (j < group.Length()) {
            MyThemeFormatted .= ", "
        }
    }

    MyThemeFormatted .= "]" ; Закрываем внутренний массив

    if (i < Groups.Length()) {
        MyThemeFormatted .= ", "
    }
}

MyThemeFormatted .= "]" ; Закрываем внешний массив

FileDelete, % File2
FileAppend, % MyThemeFormatted, % File2, UTF-8