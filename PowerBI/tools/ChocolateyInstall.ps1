$packageName = '{{PackageName}}'
$installerType = 'msi'
$url  = '{{DownloadUrl}}'
$url64  = '{{DownloadUrlx64}}'
$silentArgs = '/qb ACCEPT_EULA=1'
$validExitCodes = @(0)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64" -validExitCodes $validExitCodes
