$ErrorActionPreference = 'Stop';

# This adds a registry key which prevents Google Chrome from getting installed together with Piriform software products.
$regAdd = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)\regAdd.ps1"
Start-ChocolateyProcessAsAdmin "& `'$regAdd`'"

$packageName = '{{PackageName}}'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = '{{DownloadUrl}}'
$url64      = '{{DownloadUrlx64}}'

$LCID = (Get-Culture).LCID

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64

  softwareName  = '{{PackageName}}*'

  checksum      = '{{Checksum}}'
  checksumType  = 'sha256'
  checksum64    = '{{Checksumx64}}'
  checksumType64= 'sha256'

  silentArgs    = "/S /L=$LCID"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
