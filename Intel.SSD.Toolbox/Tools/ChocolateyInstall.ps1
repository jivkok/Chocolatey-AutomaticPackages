$ErrorActionPreference = 'Stop';

$packageName = '{{PackageName}}'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = '{{DownloadUrl}}'
$url64      = '{{DownloadUrlx64}}'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  url64bit      = $url64

  checksum      = '{{Checksum}}'
  checksumType  = 'sha256'
  checksum64    = '{{Checksumx64}}'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  file          = Join-Path $toolsDir 'Intel SSD Toolbox - v{{PackageVersion}}.exe'
  file64        = Join-Path $toolsDir 'Intel SSD Toolbox - v{{PackageVersion}}.exe'

  silentArgs    = "/s"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyInstallPackage @packageArgs
