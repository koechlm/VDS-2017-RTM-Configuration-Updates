
$vaultContext.ForceRefresh = $true
$folderId=$vaultContext.CurrentSelectionSet[0].Id
$dialog = $dsCommands.GetEditFolderDialog($folderId)
$xamlFile = New-Object CreateObject.WPF.XamlFile "testxaml", "%ProgramData%\Autodesk\Vault 2017\Extensions\DataStandard\Vault\Configuration\folder.xaml"
$dialog.XamlFile = $xamlFile
$dialog.Execute()

