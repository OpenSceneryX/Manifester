#tag Window
Begin Window wndMain
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   482
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   341440760
   MenuBarVisible  =   True
   MinHeight       =   482
   MinimizeButton  =   True
   MinWidth        =   453
   Placement       =   0
   Resizeable      =   True
   Title           =   "OpenSceneryX Manifester"
   Visible         =   True
   Width           =   453
   Begin Label txtXplaneFolder
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   121
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Untitled"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   78
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   265
   End
   Begin Canvas Canvas1
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   200112520
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   52
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   14
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   236
   End
   Begin PushButton btnSaveManifest
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Save Manifest"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   325
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   46
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   108
   End
   Begin TextArea fldMessage
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   True
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   320
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LimitText       =   0
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   True
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   110
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   413
      Begin Canvas Canvas2
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   100
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "fldMessage"
         Left            =   200
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Top             =   200
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   100
      End
   End
   Begin ProgressBar prgBar
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   108
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Maximum         =   100
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      Top             =   442
      Transparent     =   True
      Value           =   0
      Visible         =   False
      Width           =   325
   End
   Begin Label StaticText1
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Packaged Folder:"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   78
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   89
   End
   Begin PushButton btnSetXPlaneFolder
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Set…"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   386
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   77
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   47
   End
   Begin Label txtProgress
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Untitled"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   442
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   74
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  setupOSXFolder()
		  displayXPlaneFolder()
		  checkOSXFolder()
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub checkOSXFolder()
		  pLocalManifest = new FolderManifest()
		  pServerManifest = new FolderManifest()
		  
		  prgBar.visible = true
		  prgBar.maximum = 0
		  txtProgress.visible = false
		  
		  showMessage("Collecting local file information...")
		  pLocalManifest.gatherManifestFromLocalFolderItem(pOsxFolderItem)
		  showMessage("Complete.")
		  showMessage("----")
		  
		  prgBar.visible = false
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub displayXPlaneFolder()
		  txtXplaneFolder.text = App.pXPlaneFolder.absolutePath
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setupOSXFolder()
		  pOsxFolderItem = App.pXPlaneFolder
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub showMessage(message as String)
		  fldMessage.appendText(message + endOfLine)
		  fldMessage.scrollPosition = 10000000
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		pDeletedFiles As Collection
	#tag EndProperty

	#tag Property, Flags = &h0
		pLocalManifest As FolderManifest
	#tag EndProperty

	#tag Property, Flags = &h0
		pOsxFolderItem As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		pPendingFiles As Collection
	#tag EndProperty

	#tag Property, Flags = &h0
		pServerManifest As FolderManifest
	#tag EndProperty


#tag EndWindowCode

#tag Events btnSaveManifest
	#tag Event
		Sub Action()
		  dim manifestFolderItem as FolderItem = new FolderItem()
		  manifestFolderItem = manifestFolderItem.child("manifest.xml")
		  
		  pLocalManifest.save(manifestFolderItem)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnSetXPlaneFolder
	#tag Event
		Sub Action()
		  if (App.getXPlaneFolder(false)) then
		    btnSetXPlaneFolder.enabled = false
		    
		    setupOSXFolder()
		    displayXPlaneFolder()
		    checkOSXFolder()
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
