$packageName = '{{PackageName}}'
$fileType = 'exe'
$silentArgs = '/S'
$path = 'TeamViewer'
$file = "${path}\uninstall.exe"
if (Test-Path (Join-Path ${env:ProgramFiles} $path)) {
    Uninstall-ChocolateyPackage $packageName $fileType $silentArgs (Join-Path ${env:ProgramFiles} $file)
}
if (Test-Path (Join-Path ${env:ProgramFiles(x86)} $path)) {
    Uninstall-ChocolateyPackage $packageName $fileType $silentArgs (Join-Path ${env:ProgramFiles(x86)} $file)
}
