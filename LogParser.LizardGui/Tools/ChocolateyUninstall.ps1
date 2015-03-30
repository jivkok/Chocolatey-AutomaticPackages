$package = '{{PackageName}}'

try {

  # HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Uninstall
  # HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\
  # http://stackoverflow.com/questions/450027/uninstalling-an-msi-file-from-the-command-line-without-using-msiexec
  $msiArgs = "/X{99FFF1B0-FE8A-43FE-9E1C-3293ADF7083D} /qb-! REBOOT=ReallySuppress"
  Start-ChocolateyProcessAsAdmin "$msiArgs" 'msiexec'

} catch {
  Write-ChocolateyFailure $package "$($_.Exception.Message)"
  throw
}
