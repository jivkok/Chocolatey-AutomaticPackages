$ErrorActionPreference = 'Stop';

$packageName = '{{PackageName}}'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = '{{DownloadUrl}}'
$url64      = '{{DownloadUrlx64}}'

$installerPackage = Join-Path $toolsDir "sfk.exe";

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
