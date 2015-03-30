$packageName = '{{PackageName}}'
$fileType = 'exe'
$silentArgs = '/S'

try {
    $uninstallerPath = Join-Path $env:ProgramFiles 'CloudBerryLab\CloudBerry Explorer for Google Storage\uninst.exe'

    if (Test-Path $uninstallerPath) {
        Uninstall-ChocolateyPackage $packageName $fileType $silentArgs $uninstallerPath
    }
} catch {
    Write-ChocolateyFailure $packageName $($_.Exception.Message)
    throw
}
