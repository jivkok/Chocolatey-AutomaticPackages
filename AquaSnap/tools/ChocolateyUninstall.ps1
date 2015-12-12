$package = '{{PackageName}}'

# HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Uninstall
# HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\
# http://stackoverflow.com/questions/450027/uninstalling-an-msi-file-from-the-command-line-without-using-msiexec
$msiArgs = "/X{E0527016-B2F4-4EEB-97F6-A2B8C46196CA} /qb-! REBOOT=ReallySuppress"
Start-ChocolateyProcessAsAdmin "$msiArgs" 'msiexec'
