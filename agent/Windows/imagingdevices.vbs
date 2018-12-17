Set objWMIService = GetObject("winmgmts:\\.\root\cimv2")
Set colItems = objWMIService.ExecQuery("select * from Win32_PnPEntity where Present = 'true' AND Service = 'usbscan'",,48)

For Each objItem in colItems
	sSerial = objItem.PNPDeviceID
	aSerial = Split(objItem.PNPDeviceID,"\")
	for each sTemp in aSerial
		sSerial = sTemp
	next
	wscript.echo "<IMAGINGDEVICES>"
	Wscript.Echo "        <NAME>" & objItem.Name & "</NAME>"
	Wscript.Echo "        <MANUFACTURER>" & objItem.Manufacturer & "</MANUFACTURER>"
	Wscript.Echo "        <DESCRIPTION>" & objItem.Description & "</DESCRIPTION>"
	Wscript.Echo "        <SERIAL>" & sSerial & "</SERIAL>"
	wscript.echo "</IMAGINGDEVICES>"
Next
