#tag Class
Protected Class FolderManifest
	#tag Method, Flags = &h0
		Sub Constructor()
		  pManifest = new Dictionary
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub doGatherManifestFromFolderItem(containingFolderItem as FolderItem)
		  Dim i As Integer
		  Dim count As Integer = containingFolderItem.Count
		  Dim md5 As MD5Digest = New MD5Digest
		  
		  For i = count DownTo 1
		    App.YieldToNextThread
		    
		    Dim folderItem As FolderItem = containingFolderItem.TrueItem(i)
		    
		    If folderItem <> Nil Then
		      // Ignore any files or folders starting '.'
		      If (folderItem.name.Left(1) = ".") Then Continue
		      
		      If folderItem.Directory Then
		        doGatherManifestFromFolderItem(folderItem)
		      Else
		        // Gather the information from the file
		        md5.clear
		        md5.process(folderItem.OpenAsTextFile.ReadAll)
		        Dim fileInformation As Dictionary = New Dictionary
		        fileInformation.value("size") = folderItem.Length
		        fileInformation.value("digest") = binToHex(md5.value, "")
		        
		        Dim rootPath As String = pRootFolderItem.nativePath
		        If (rootPath.Right(1) <> App.kPathSeparator) Then
		          rootPath = rootPath + App.kPathSeparator
		        End If
		        
		        Dim relativePath As String = folderItem.nativePath
		        
		        relativePath = relativePath.Mid(rootPath.Len)
		        pManifest.Value(normaliseFilePath(relativePath)) = fileInformation
		      End If
		    End If
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub gatherManifestFromLocalFolderItem(folderItem as FolderItem)
		  pManifest.clear
		  pRootFolderItem = folderItem
		  doGatherManifestFromFolderItem(folderItem)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub gatherManifestFromXMLFile(xmlFile as FolderItem)
		  pManifest.clear
		  dim result as Boolean = pManifest.loadXML(xmlFile)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function gatherManifestFromXMLString(xml as String) As boolean
		  pManifest.clear
		  return pManifest.loadXML(xml)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub getDifferences(newManifest as FolderManifest, ByRef changedFiles as Collection, ByRef deletedFiles as Collection)
		  dim i as Integer
		  
		  // First iterate our dictionary looking for items not in the new dictionary
		  dim keys() as Variant = pManifest.keys()
		  
		  for i = 0 to ubound(keys)
		    dim key as variant = keys(i)
		    
		    if newManifest.pManifest.hasKey(key) then
		      dim newValue as Dictionary = newManifest.pManifest.value(key)
		      dim oldValue as Dictionary = pManifest.value(key)
		      if (newValue.value("size") <> oldValue.value("size") or newValue.value("digest") <> oldValue.value("digest")) then
		        // The files are different in some way
		        changedFiles.add(key)
		      end if
		    else
		      // If the key is in our manifest but not in the new one, the file has been deleted
		      deletedFiles.add(key)
		    end if
		  next
		  
		  
		  // Next iterate the new dictionary, adding any items not in ours
		  keys = newManifest.pManifest.keys()
		  
		  for i = 0 to ubound(keys)
		    dim key as variant = keys(i)
		    
		    if not pManifest.hasKey(key) then
		      // The key is in the new manifest but not ours
		      changedFiles.add(key)
		    end if
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getLocalFolderItem(normalisedFilePath as String) As FolderItem
		  dim parts() as String = normalisedFilePath.split("/")
		  dim result as FolderItem = pRootFolderItem
		  dim i as Integer
		  
		  for i = 0 to uBound(parts)
		    dim fi as FolderItem = result.child(parts(i))
		    if (not fi.exists() and i < uBound(parts)) then fi.createAsFolder()
		    result = fi
		  next
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub save(folderItem as FolderItem)
		  dim result as Boolean = pManifest.saveXML(folderItem, false)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		pManifest As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		pRootFolderItem As FolderItem
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
