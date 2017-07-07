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
  fileType      = 'MSI'
  file          = Join-Path $toolsDir 'MobaXterm_installer.msi'
  file64        = Join-Path $toolsDir 'MobaXterm_installer.msi'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyInstallPackage @packageArgs
