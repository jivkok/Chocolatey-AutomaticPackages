$packageName = '{{PackageName}}'
#$url = 'http://www.cloudberrylab.com:80/download/CloudBerryExplorerSetup_v1.4.0.10OpenStack_netv4.0.exe'
$url = '{{DownloadUrl}}'

$scriptDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition);
$installerAuto = Join-Path $scriptDir 'CloudBerryExplorer.OpenStackStorage.au3';

$installerPackage = Join-Path $scriptDir "CloudBerryExplorer.OpenStackStorage.exe";
Get-ChocolateyWebFile $packageName $installerPackage $url;

Write-Host "Installing `'$installerPackage`' with AutoIt3 using `'$installerAuto`'"
$installArgs = "/c autoit3 `"$installerAuto`" `"$installerPackage`""
Start-ChocolateyProcessAsAdmin "$installArgs" "cmd.exe"
