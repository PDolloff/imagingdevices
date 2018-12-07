strComputer = "."
Const HKLM = &H80000002 'HKEY_LOCAL_MACHINE
Set oRegistry = GetObject("winmgmts:{impersonationLevel=impersonate}!\\" & strComputer & "/root/default:StdRegProv")
strUSBBaseKey = "SYSTEM\CurrentControlSet\Enum\USB\"
iRC = oRegistry.EnumKey(HKLM, strUSBBaseKey, strarrUSBSubKeys)
For Each sKey In strarrUSBSubKeys
  irc2 = oRegistry.EnumKey(HKLM, strUSBBaseKey & sKey & "\", strarrUSBSubKeys2)
  For Each sKey2 In strarrUSBSubKeys2
      oRegistry.GetStringValue HKLM,strUSBBaseKey & sKey & "\" & sKey2,"Class",strClass
      if strClass = "Image" then
        irc3 = oRegistry.EnumKey(HKLM, strUSBBaseKey & sKey & "\" & sKey2 & "\", strarrUSBSubKeys3)
        For Each sKey3 In strarrUSBSubKeys3
          if sKey3 = "Control" then
            oRegistry.GetStringValue HKLM,strUSBBaseKey & sKey & "\" & sKey2,"DeviceDesc",strDevice
			oRegistry.GetStringValue HKLM,strUSBBaseKey & sKey & "\" & sKey2,"FriendlyName",strFriendlyName
			oRegistry.GetStringValue HKLM,strUSBBaseKey & sKey & "\" & sKey2,"Mfg",strMfg
			oRegistry.GetStringValue HKLM,strUSBBaseKey & sKey & "\" & sKey2,"LocationInformation",strLocInfo
            wscript.echo "<IMAGINGDEVICES>"
			wscript.echo "<MANUFACTURER>" & strMfg & "</MANUFACTURER>"
			wscript.echo "<NAME>" & strFriendlyName & "</NAME>"
			wscript.echo "<DESCRIPTION>" & strDevice & "</DESCRIPTION>"
			wscript.echo "<SERIAL>" & sKey2 & "</SERIAL>"
			wscript.echo "</IMAGINGDEVICES>"
          end if
        Next

      end if
  Next
Next
