strDOS =
strDOS .= "`n    ""tips"":["
for index, element in listOS {
	if element[3]
	{
		if index > 1
		{
			if pcheck = true
			{
				pcheck := false
			}
			else
			{
				strDOS .= ","
			}
		}
		if SubStr(element[1], 0) != "/" {
			strDOS .= "`n        {"
			strDOS .= "`n            ""image"": """ waylistOS[1][element[4]] element[1] ""","
			strDOS .= "`n            ""tip"": """ element[3] """"
			strDOS .= "`n        }"
		}
		else {
			strDOS .= "`n        {"
			strDOS .= "`n            ""dir"": ""/" SubStr(element[1], 1, StrLen(element[1]) - 1) ""","
			strDOS .= "`n            ""tip"": """ element[3] """"
			strDOS .= "`n        }"
		}
	}
}
strDOS .= "`n    ]"
strDOS .= "`n}"

checkSelList := false

for index, element in listOS {
	if element[3]
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
	strOS .= "`n""menu_tip" element """:{" strDOS
	StartInc := false
}
}