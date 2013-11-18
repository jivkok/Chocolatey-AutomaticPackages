$packageName = '{{PackageName}}'
#$url = 'http://www.lizard-labs.net/Download.aspx?fname=LogParserLizardSetup.msi'
$url = '{{DownloadUrl}}'

Install-ChocolateyPackage $packageName 'msi' '/quiet' $url
