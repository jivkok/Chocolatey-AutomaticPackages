$packageName = '{{PackageName}}'
#$url = 'http://www.cloudberrylab.com/download/CloudBerryExplorerSetup_v3.8.7.14_netv4.0.exe'
$url = '{{DownloadUrl}}'

$scriptDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition);
$installerAuto = Join-Path $scriptDir 'CloudBerryExplorer.AmazonS3.au3';

$installerPackage = Join-Path $scriptDir "CloudBerryExplorer.AmazonS3.exe";
Get-ChocolateyWebFile $packageName $installerPackage $url;

Write-Host "Installing `'$installerPackage`' with AutoIt3 using `'$installerAuto`'"
$installArgs = "/c autoit3 `"$installerAuto`" `"$installerPackage`""
Start-ChocolateyProcessAsAdmin "$installArgs" "cmd.exe"
