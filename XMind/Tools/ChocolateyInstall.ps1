$packageName = '{{PackageName}}'
$fileType = 'exe'
$silentArgs = '/verysilent'
$url = '{{DownloadUrl}}'

Install-ChocolateyPackage $packageName $fileType $silentArgs $url $url -validExitCodes @(0)
