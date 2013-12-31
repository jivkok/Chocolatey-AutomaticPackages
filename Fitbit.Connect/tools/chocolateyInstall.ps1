$packageName = '{{PackageName}}'
$fileType = 'exe'
$silentArgs = ''
$url = '{{DownloadUrl}}'

Install-ChocolateyPackage $packageName $fileType $silentArgs $url