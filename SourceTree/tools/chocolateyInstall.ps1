$packageName = '{{PackageName}}'
$installerType = 'exe'
$32BitUrl  = '{{DownloadUrl}}'
$silentArgs = '/passive'
$validExitCodes = @(0)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$32BitUrl" -validExitCodes $validExitCodes
