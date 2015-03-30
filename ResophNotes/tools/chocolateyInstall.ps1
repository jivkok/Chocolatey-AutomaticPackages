$package = '{{PackageName}}';

try {
    $drop = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
    $msi = "$drop\ResophNotes.msi"
    Install-ChocolateyZipPackage $package '{{DownloadUrl}}' $drop
    Install-ChocolateyInstallPackage $package 'msi' "/passive" $msi
} catch {
    Write-ChocolateyFailure $package $($_.Exception.Message)
    throw
}
