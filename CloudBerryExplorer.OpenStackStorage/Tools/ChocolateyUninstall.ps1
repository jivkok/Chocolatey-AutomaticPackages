$packageName = '{{PackageName}}'
$fileType = 'exe'
$silentArgs = '/S'

try {
    $uninstallerPath = Join-Path $env:ProgramW6432 'CloudBerry Explorer for OpenStack Storage\uninst.exe'

    if (Test-Path $uninstallerPath) {
        Uninstall-ChocolateyPackage $packageName $fileType $silentArgs $uninstallerPath
    }
} catch {
    Write-ChocolateyFailure $packageName $($_.Exception.Message)
    throw
}
