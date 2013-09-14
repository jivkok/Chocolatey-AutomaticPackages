$package = '{{PackageName}}';

try {
    $scriptDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition);
    $installerAuto = Join-Path $scriptDir 'Fitbit.Uploader.au3';
	
	Rename-Item "$scriptDir\Fitbit-Uploader-For-Windows-version.exe.ignore" "$scriptDir\Fitbit-Uploader-For-Windows-{{PackageVersion}}.exe.ignore"
    $installerPackage = Join-Path $scriptDir "Fitbit-Uploader-For-Windows-{{PackageVersion}}.exe";
    Get-ChocolateyWebFile $package $installerPackage '{{DownloadUrl}}';
  
    Write-Host "Installing `'$installerPackage`' with AutoIt3 using `'$installerAuto`'"
    $installArgs = "/c autoit3 `"$installerAuto`" `"$installerPackage`""
    Start-ChocolateyProcessAsAdmin "$installArgs" "cmd.exe"

    Write-ChocolateySuccess $package
} catch {
  Write-ChocolateyFailure $package "$($_.Exception.Message)"
  throw 
}