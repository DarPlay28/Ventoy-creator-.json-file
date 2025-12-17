checkSelList := false

for index, element in listOS {
	if element[2]
	{
		checkSelList = true
	}
}

if checkSelList {
for index, element in prefixParametr {
	if index > 1
	{
		strOS .= ","
	}
	Else if !StartInc {
		strOS .= ","
	}
	strOS .= "`n""menu_alias" element """:["
	for index, element in listOS {
		if index > 1
		{
			if pcheck = true
			{
				pcheck := false
			}
			else
			{
				strOS .= ","
			}
		}
		if SubStr(element[1], 0) != "/" {
			strOS .= "`n    {"
			strOS .= "`n        ""image"": """ waylistOS[1][element[4]] element[1] ""","
			strOS .= "`n        ""alias"": """ element[2] """"
			strOS .= "`n    }"
		}
		else {
			strOS .= "`n    {"
			strOS .= "`n        ""dir"": ""/" SubStr(element[1], 1, StrLen(element[1]) - 1) ""","
			strOS .= "`n        ""alias"": """ element[2] """"
			strOS .= "`n    }"
		}
	}
	strOS .= "`n]"
	StartInc := false
}
}