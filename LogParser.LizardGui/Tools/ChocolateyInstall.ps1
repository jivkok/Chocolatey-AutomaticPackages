# http://www.lizard-labs.net/Download.aspx?fname=LogParserLizardSetup.msi
$packageName = '{{PackageName}}'
$installerType = 'msi'
$32BitUrl  = '{{DownloadUrl}}'
$silentArgs = '/quiet'
$validExitCodes = @(0)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$32BitUrl" -validExitCodes $validExitCodes
