$packageName = '{{PackageName}}'
$installerType = 'msi'
$32BitUrl  = '{{DownloadUrl}}'
$64BitUrl  = '{{url64}}'
$silentArgs = '/q'
$validExitCodes = @(0)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$32BitUrl" "$64BitUrl" -validExitCodes $validExitCodes
