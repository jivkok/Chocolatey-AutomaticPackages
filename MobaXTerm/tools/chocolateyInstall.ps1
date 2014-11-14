$packageName = '{{PackageName}}'
$installerType = 'msi'
$32BitUrl  = '{{DownloadUrl}}'
$silentArgs = '/q'
$validExitCodes = @(0)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$32BitUrl" -validExitCodes $validExitCodes
