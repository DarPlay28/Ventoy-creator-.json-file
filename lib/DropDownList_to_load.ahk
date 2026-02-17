DropDLToLoad(Target, TargetA) {
    TargetCount := Target.Length() ; Общее количество званий
	DoneList = ""
	for index, element in Target {
		if (Target[index] != TargetA)
		{
			DoneList .= element . "|"
		}
		else {
			if (Target[index] = TargetA)
			{
				DoneList .= element . "||"
				if (index >= TargetCount)
				{
					return %DoneList%
				}
			}
		}
	}
	StringTrimRight, DoneList, DoneList, 1 ; Удаляем последний лишний разделитель "|"

	return %DoneList%
}