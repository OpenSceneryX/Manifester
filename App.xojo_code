#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // The file menu is empty on the Mac, so hide it
		  #if targetMacOS
		    FileMenu.visible = false
		  #endif
		  
		  pPreferences = new Dictionary()
		  
		  dim xPlanePath as String
		  if (pPreferences.hasKey("XPlanePath")) then xPlanePath = pPreferences.value("XPlanePath")
		  if (xPlanePath <> "") then pXPlaneFolder = getFolderItem(xPlanePath, FolderItem.PathTypeAbsolute)
		  
		  if (pXPlaneFolder = nil or not pXPlaneFolder.exists() or not pXPlaneFolder.directory) then
		    dim result as Boolean = getXPlaneFolder(true)
		  end if
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function getXPlaneFolder(require as Boolean) As boolean
		  // Returns true if the user chose a new folder (and require is false)
		  
		  dim dialog as SelectFolderDialog = new SelectFolderDialog()
		  dim xPlanePath as String
		  dim xPlaneFolder as FolderItem
		  
		  dialog.title = "Please locate the OpenSceneryX folder BEFORE PACKAGING"
		  dialog.promptText = "Please locate the OpenSceneryX folder BEFORE PACKAGING"
		  
		  xPlaneFolder = dialog.showModal()
		  if (xPlaneFolder = nil) then
		    if (require) then
		      msgBox("This installer cannot work without an OpenSceneryX folder and will now quit.")
		      quit
		    else
		      return false
		    end if
		  end if
		  
		  pXPlaneFolder = xPlaneFolder
		  pPreferences.value("XPlanePath") = pXPlaneFolder.nativePath
		  
		  return true
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private pPreferences As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		pXPlaneFolder As FolderItem
	#tag EndProperty


	#tag Constant, Name = kApplicationName, Type = String, Dynamic = False, Default = \"OpenSceneryX Installer", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant

	#tag Constant, Name = kPathSeparator, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"/"
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"\\"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"/"
	#tag EndConstant

	#tag Constant, Name = kServerURL, Type = String, Dynamic = False, Default = \"127.0.0.1/opensceneryx", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kServerURLLive, Type = String, Dynamic = False, Default = \"www.opensceneryx.com", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
