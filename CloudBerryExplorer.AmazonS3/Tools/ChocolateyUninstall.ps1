$packageName = '{{PackageName}}'

try {
    $fileType = 'exe'
    $silentArgs = '/S'
    $uninstallerPath = Join-Path $env:ProgramW6432 'CloudBerryLab\CloudBerry Explorer for Amazon S3\uninst.exe'

    if (Test-Path $uninstallerPath) {
        Uninstall-ChocolateyPackage $packageName $fileType $silentArgs $uninstallerPath
    }
} catch {
    Write-ChocolateyFailure $packageName $($_.Exception.Message)
    throw
}
