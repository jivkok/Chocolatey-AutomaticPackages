$packageName = '{{PackageName}}'
$url = '{{DownloadUrl}}'
$installerType = 'exe'
$silentArgs = '/passive'
$validExitCodes = @(0)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url" -validExitCodes $validExitCodes
