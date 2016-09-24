$ErrorActionPreference = 'Stop';

if ((Get-WmiObject -class Win32_OperatingSystem).ProductType -ne 1) {
  throw "SyncBackFree cannot be used on server versions of Windows. Upgrade to SyncBackSE or SyncBackPro if you are using a server version of Windows."
}

$packageName = '{{PackageName}}'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = '{{DownloadUrl}}'
$url64      = '{{DownloadUrlx64}}'

$installerPackage = Join-Path $toolsDir "SyncBack_Setup.exe";

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

$installerAuto = Join-Path $toolsDir 'SyncBack.au3';
$installArgs = "/c autoit3 `"$installerAuto`" `"$installerPackage`""
Write-Host "Installing `'$installerPackage`' with AutoIt3 using `'$installerAuto`'"
Start-ChocolateyProcessAsAdmin "$installArgs" "cmd.exe"
