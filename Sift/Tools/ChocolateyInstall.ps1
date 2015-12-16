$packageName = '{{PackageName}}'
$url = '{{DownloadUrl}}'
$url64 = '{{url64}}'
$drop = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage $packageName $url $drop $url64
