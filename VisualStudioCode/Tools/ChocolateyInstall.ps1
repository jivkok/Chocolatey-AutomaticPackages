$packageName = '{{PackageName}}'
$installerType = 'exe'
$silentArgs = "/silent /log=""$env:temp\vscode.log"""
$32BitUrl  = '{{DownloadUrl}}'
$validExitCodes = @(
    0 # success
)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$32BitUrl" -validExitCodes $validExitCodes
