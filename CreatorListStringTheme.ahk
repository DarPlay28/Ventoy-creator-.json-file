File := "Data\edit_theme.txt"
File2 := "Data\ListStringTheme.ahk"

FileRead, MyTheme, % File
if ErrorLevel {
    MsgBox, Не удалось прочитать файл %File%. Пробуем создать пустышку

    ; --- Конфигурация ---
    NewFolderName := "Data"
    FileNameToCreate := "edit_theme.txt"


; --- 1. Определяем путь к новой папке и новому файлу ---
    TargetFolderPath := A_ScriptDir "\" NewFolderName
    TargetFilePath   := TargetFolderPath "\" FileNameToCreate


; --- 2. Определяем содержимое файла (Heredoc синтаксис) ---
    ; Символ "`n" обозначает новую строку
    FileContent :=


    ; --- 3. Создаем целевую папку ---
    FileCreateDir, %TargetFolderPath%

    if ErrorLevel {
        MsgBox, Ошибка при создании папки: %TargetFolderPath%
        return
    }


; --- 4. Создаем файл и записываем в него содержимое ---
    ; FileAppend создает файл, если его не существует, или добавляет текст в конец существующего.
    FileAppend, %FileContent%, %TargetFilePath%


; --- 5. Проверка результата ---
    if ErrorLevel {
        MsgBox, Ошибка при создании файла "%FileNameToCreate%" в папке: %TargetFolderPath%
    } else {
        MsgBox, Готово! Папка "%NewFolderName%" создана, и файл "%FileNameToCreate%" создан внутри нее с нужным содержимым.
        ; Можете открыть файл для проверки
        Run, %TargetFilePath%
    }
    FileRead, MyTheme, % File
    if ErrorLevel {
        MsgBox, Не удалось прочитать файл %File%.
    }
    else {
        MsgBox, Файл-пустышка %File% был создан.
    }
    return
}

; --- Основная логика обработки ---

; Разделяем текст на отдельные строки
LineArray := StrSplit(MyTheme, "`n", "`r")
global listTheme := []
; Создаем основной массив AHK для хранения групп (используем объекты)
Group = []; Инициализация объекта (массива)

for index, line in LineArray
{
    ; Проверяем, является ли текущая строка разделителем "*"
    if (line == "*")
    {
        ; Добавляем завершенную группу в основной массив
        ; Проверяем длину через Group.Length()
        if (Group.Length() > 0) {
            listTheme.Push(Group)
            ; Начинаем новую пустую группу для следующих элементов
            Group := []
        }
    }
    else
    {
        ; Если это не разделитель, добавляем строку в текущую группу
        Group.Push(line)
    }
}

; Добавляем последнюю собранную группу в основной массив после завершения цикла
if (Group.Length() > 0) {
    listTheme.Push(Group)
}

; Сообщение для пользователя
MsgBox, Текст из "%File%" успешно отформатирован в массив!