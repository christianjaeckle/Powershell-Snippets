# Create new dialog object
$Dialog = New-Object -TypeName System.Windows.Forms.OpenFileDialog

# Define attributes of dialog
$Dialog.AddExtension = $true
$Dialog.CheckFileExists = $true
$Dialog.CheckPathExists = $true
$Dialog.Filter = "Text files (*.txt)|*.txt|All Files|*.*"
$Dialog.InitialDirectory = "$env:userprofile\Documents\"
$Dialog.Multiselect = $false
$Dialog.Title = "Select a text file."
$DialogResult = $Dialog.ShowDialog()

if ($DialogResult = "OK") {
    Write-Output $Dialog.FileName
}
