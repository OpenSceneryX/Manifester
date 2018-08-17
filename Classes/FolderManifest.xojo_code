#tag Class
Protected Class FolderManifest
	#tag Method, Flags = &h0
		Sub Constructor()
		  pManifest = new Dictionary
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub doGatherManifestFromFolderItem(containingFolderItem as FolderItem)
		  dim i as Integer
		  dim count as Integer = containingFolderItem.Count
		  dim md5 as MD5Digest = new MD5Digest()
		  
		  for i = count downto 1
		    dim folderItem as FolderItem = containingFolderItem.TrueItem(i)
		    
		    if folderItem <> nil then
		      // Ignore any files or folders starting '.'
		      if (folderItem.name.left(1) = ".") then continue
		      
		      if folderItem.Directory then
		        doGatherManifestFromFolderItem(folderItem)
		      else
		        // Gather the information from the file
		        md5.clear()
		        md5.process(folderItem.OpenAsTextFile.ReadAll)
		        dim fileInformation as Dictionary = new Dictionary()
		        fileInformation.value("size") = folderItem.Length
		        fileInformation.value("digest") = binToHex(md5.value, "")
		        dim relativePath as String = folderItem.absolutePath
		        relativePath = relativePath.mid(pRootFolderItem.absolutePath.len)
		        pManifest.Value(normaliseFilePath(relativePath)) = fileInformation
		      end if
		    end if
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
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
