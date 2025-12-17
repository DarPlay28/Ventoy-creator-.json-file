strDOS =

strDOS .= "`n    ""file"":["
pcheck := true
for index, element in listTheme[1] {
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
	strDOS .= "`n        """ element """"
}
strDOS .= "`n    ],"
pcheck := true
if listTheme[2][1]
{
	strDOS .= "`n    ""default_file"": " listTheme[2][1] ","
	pcheck := false
}
if listTheme[2][2]
{
	strDOS .= "`n    ""gfxmode"": """ gfxmodeL[listTheme[2][2]] ""","
	pcheck := false
}

if listTheme[3] {
strDOS .= "`n    ""fonts"":["
for index, element in listTheme[3] {
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
	strDOS .= "`n        """ element """"
}
strDOS .= "`n    ]"
}
strDOS .= "`n}"


checkSelList := false

for index, element in listTheme {
	if element[1]
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
	strOS .= "`n""theme" element """:{" strDOS
	StartInc := false
}
}