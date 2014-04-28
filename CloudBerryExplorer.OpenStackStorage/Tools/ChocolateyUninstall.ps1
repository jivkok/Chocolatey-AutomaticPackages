try {
    $packageName = '{{PackageName}}'
    $fileType = 'exe'
    $silentArgs = '/S'
    $uninstallerPath = Join-Path $env:ProgramW6432 'CloudBerry Explorer for OpenStack Storage\uninst.exe'

    if (Test-Path $uninstallerPath) {
        Uninstall-ChocolateyPackage $packageName $fileType $silentArgs $uninstallerPath
    }

    Write-ChocolateySuccess $packageName

} catch {
    Write-ChocolateyFailure $packageName $($_.Exception.Message)
    throw
}
