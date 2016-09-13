$ErrorActionPreference = 'Stop';

$packageName = '{{PackageName}}'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = '{{DownloadUrl}}'
$url64      = '{{DownloadUrlx64}}'

$installerPackage = Join-Path $toolsDir "CloudBerryExplorer.OpenStackStorage.exe";

$packageArgs = @{
  packageName   = $packageName
  fileFullPath  = $installerPackage
  url           = $url
  url64bit      = $url64

  checksum      = '{{Checksum}}'
  checksumType  = 'sha256'
  checksum64    = '{{Checksumx64}}'
  checksumType64= 'sha256'
}

Get-ChocolateyWebFile @packageArgs

$installerAuto = Join-Path $toolsDir 'CloudBerryExplorer.OpenStackStorage.au3';
$installArgs = "/c autoit3 `"$installerAuto`" `"$installerPackage`""
Write-Host "Installing `'$installerPackage`' with AutoIt3 using `'$installerAuto`'"
Start-ChocolateyProcessAsAdmin "$installArgs" "cmd.exe"
