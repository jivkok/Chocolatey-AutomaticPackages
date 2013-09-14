$packageName = '{{PackageName}}'
$fileType = 'exe'
$silentArgs = '/SILENT'
$url = '{{DownloadUrl}}'

Install-ChocolateyPackage $packageName $fileType $silentArgs $url