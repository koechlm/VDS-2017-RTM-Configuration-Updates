$folderId=$vaultContext.CurrentSelectionSet[0].Id
$vaultContext.ForceRefresh = $true
$dialog = $dsCommands.GetCreateFolderDialog($folderId)
$xamlFile = New-Object CreateObject.WPF.XamlFile "Folder.xaml", "%ProgramData%\Autodesk\Vault 2017\Extensions\DataStandard\Vault\Configuration\Folder.xaml"
$dialog.XamlFile = $xamlFile


$result = $dialog.Execute()
$dsDiag.Trace($result)

if($result)
{
	#new folder can be found in $dialog.CurrentFolder
	$folder = $vault.DocumentService.GetFolderById($folderId)
	$path=$folder.FullName+"/"+$dialog.CurrentFolder.Name

	[System.Reflection.Assembly]::LoadFrom("C:\Program Files\Autodesk\Vault Professional 2017\Explorer\Autodesk.Connectivity.Explorer.Extensibility.dll")
	$selectionId = [Autodesk.Connectivity.Explorer.Extensibility.SelectionTypeId]::Folder
	$location = New-Object Autodesk.Connectivity.Explorer.Extensibility.LocationContext $selectionId, $path
	$vaultContext.GoToLocation = $location
}