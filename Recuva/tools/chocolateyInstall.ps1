# Set the standard 4 parameters
$packageName = '{{PackageName}}'
$fileType = 'exe'
$LCID = (Get-Culture).LCID
$silentArgs = "/S /L=$LCID"
$url = '{{DownloadUrl}}'
$regAdd = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)\regAdd.ps1"

# This adds a registry key which prevents Google Chrome from getting installed together with Piriform software products.
Start-ChocolateyProcessAsAdmin "& `'$regAdd`'"

Install-ChocolateyPackage $packageName $fileType $silentArgs $url
