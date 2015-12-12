$packageName = '{{PackageName}}'

$fileType = 'exe'
$silentArgs = '/S'
$uninstallerPath = Join-Path $env:ProgramW6432 'CloudBerryLab\CloudBerry Explorer for Amazon S3\uninst.exe'

if (Test-Path $uninstallerPath) {
    Uninstall-ChocolateyPackage $packageName $fileType $silentArgs $uninstallerPath
}
