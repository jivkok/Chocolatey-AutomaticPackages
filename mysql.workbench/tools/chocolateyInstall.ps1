$packageName = '{{PackageName}}'
$installerType = 'msi'
$32BitUrl = '{{DownloadUrl}}'
$64BitUrl = $32BitUrl -replace '-win32', '-winx64'
$silentArgs = '/passive'
$validExitCodes = @(0)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$32BitUrl" "$64BitUrl" -validExitCodes $validExitCodes
