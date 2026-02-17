File := "Data\edit.txt"

global MyText .= ""

FileRead, MyText, % File
if ErrorLevel {
    MsgBox, Не удалось прочитать файл %File%. Пробуем создать пустышку

    ; --- Конфигурация ---
    NewFolderName := "Data"
    FileNameToCreate := "edit_way.txt"

    TargetFolderPath := A_ScriptDir "\" NewFolderName ; 1. Определяем путь к новой папке и новому файлу
    TargetFilePath   := TargetFolderPath "\" FileNameToCreate
    FileContent := ; 2. Определяем содержимое файла (Heredoc синтаксис). Символ `` `n `` обозначает новую строку
    FileCreateDir, %TargetFolderPath% ; 3. Создаем целевую папку
    if ErrorLevel {
        MsgBox, Ошибка при создании папки: %TargetFolderPath%
        return
    }
    FileAppend, %FileContent%, %TargetFilePath% ; 4. Создаем файл и записываем в него содержимое. FileAppend создает файл, если его не существует, или добавляет текст в конец существующего.
    if ErrorLevel { ; 5. Проверка результата
        MsgBox, Ошибка при создании файла "%FileNameToCreate%" в папке: %TargetFolderPath%
    } else {
        MsgBox, Готово! Папка "%NewFolderName%" создана, и файл "%FileNameToCreate%" создан внутри нее с нужным содержимым.
        Run, %TargetFilePath% ; Можете открыть файл для проверки
    }
    FileRead, MyWay, % File
    if ErrorLevel {
        MsgBox, Не удалось прочитать файл %File%.
    }
    else {
        MsgBox, Файл-пустышка %File% был создан.
    }
    return
}

; StrReplace(строка_источник, искомый_текст, текст_на_замену)
; --- Основная логика обработки ---

; Разделяем текст на отдельные строки
LineArray := StrSplit(MyWay, "`n", "`r")
global listOS := []
; Создаем основной массив AHK для хранения групп (используем объекты)
Groups := [] ; Инициализация объекта (массива)

for index, line in LineArray
{
    ; Проверяем, является ли текущая строка разделителем "*"
    if (line == "*")
    {
        ; Добавляем завершенную группу в основной массив
        ; Проверяем длину через Groups.Length()
        if (Groups.Length() > 0) {
            listOS.Push(Groups)
            ; Начинаем новую пустую группу для следующих элементов
            Groups := []
        }
    }
    else
    {
        ; Если это не разделитель, добавляем строку в текущую группу
        Groups.Push(line)
    }
}

; Добавляем последнюю собранную группу в основной массив после завершения цикла
if (Groups.Length() > 0) {
    listOS.Push(Groups)
}

MsgBox, Текст из "%File%" успешно отформатирован в массив!