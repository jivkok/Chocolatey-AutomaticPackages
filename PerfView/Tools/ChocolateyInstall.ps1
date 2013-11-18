$packageName = '{{PackageName}}'
#$url = 'http://download.microsoft.com/download/5/C/C/5CCCFF9B-08C4-4352-9DBF-DF44E3A2E9EA/PerfView.zip'
$url = '{{DownloadUrl}}'
$drop = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage $packageName $url $drop
