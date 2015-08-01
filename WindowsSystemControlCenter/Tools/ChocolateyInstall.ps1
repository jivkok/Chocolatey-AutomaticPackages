$packageName = '{{PackageName}}'
# $url = 'http://www.kls-soft.com/downloads/wscc.zip'
$url = '{{DownloadUrl}}'
$drop = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage $packageName $url $drop
