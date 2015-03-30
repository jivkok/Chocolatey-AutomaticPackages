$package = '{{PackageName}}';

try {
    $scriptDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition);

    $installerPackage = Join-Path $scriptDir "sfk.exe";
    Get-ChocolateyWebFile $package $installerPackage 'http://sourceforge.net/projects/swissfileknife/files/1-swissfileknife/{{PackageVersion}}/sfk{{DownloadUrlx64}}.exe/download';
} catch {
    Write-ChocolateyFailure $package "$($_.Exception.Message)"
    throw
}