$packageName = '{{PackageName}}'
$installerType = 'exe'
$url  = '{{DownloadUrl}}'
$silentArgs = '/passive'
$validExitCodes = @(0)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url" -validExitCodes $validExitCodes
