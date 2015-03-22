$packageName = '{{PackageName}}'

try {
  $processor = Get-WmiObject Win32_Processor
  $is64bit = $processor.AddressWidth -eq 64
  if ($is64bit) {
    $unpath = "${Env:ProgramFiles(x86)}\XMind\uninstall.exe"
  } else {
    $unpath = "${Env:ProgramFiles}\XMind\uninstall.exe"
  }
  Uninstall-ChocolateyPackage "$packageName" 'EXE' '/S' "$unpath" -validExitCodes @(0)

  Write-ChocolateySuccess "$packageName"
} catch {
  Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
  throw
}
