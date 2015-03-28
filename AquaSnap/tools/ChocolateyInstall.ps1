$packageName = '{{PackageName}}'
$installerType = 'msi'
$url  = '{{DownloadUrl}}'
$silentArgs = '/qb'
$validExitCodes = @(0)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url" -validExitCodes $validExitCodes
