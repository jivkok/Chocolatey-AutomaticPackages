$ErrorActionPreference = 'Stop';

# Default values
$createDesktopIcon = $true
$createQuickLaunchIcon = $true
$addContextMenuFiles = $true
$addContextMenuFolders = $true
$addToPath = $true

$arguments = @{}
$packageParameters = $env:chocolateyPackageParameters
if ($packageParameters)
{
      $match_pattern = "\/(?<option>([a-zA-Z]+)):(?<value>([`"'])?([a-zA-Z0-9- _\\:\.]+)([`"'])?)|\/(?<option>([a-zA-Z]+))"
      $option_name = 'option'
      $value_name = 'value'
      if ($packageParameters -match $match_pattern )
      {
          $results = $packageParameters | Select-String $match_pattern -AllMatches
          $results.matches | % {
            $arguments.Add(
                $_.Groups[$option_name].Value.Trim(),
                $_.Groups[$value_name].Value.Trim())
          }
      }
      else
      {
          Throw "Package Parameters were found but were invalid (REGEX Failure)"
      }

      if ($arguments.ContainsKey("nodesktopicon"))
      {
          Write-Host "nodesktopicon"
          $createDesktopIcon = $false
      }

      if ($arguments.ContainsKey("noquicklaunchicon"))
      {
          Write-Host "noquicklaunchicon"
          $createQuickLaunchIcon = $false
      }

      if ($arguments.ContainsKey("nocontextmenufiles"))
      {
          Write-Host "nocontextmenufiles"
          $addContextMenuFiles = $false
      }

      if ($arguments.ContainsKey("nocontextmenufolders"))
      {
          Write-Host "nocontextmenufolders"
          $addContextMenuFolders = $false
      }

      if ($arguments.ContainsKey("dontaddtopath"))
      {
          Write-Host "dontaddtopath"
          $addToPath = $false
      }
}
else
{
    Write-Debug "No Package Parameters Passed in"
}

$mergeTasks = "!runCode"
if ($createDesktopIcon)
{
    $mergeTasks = $mergeTasks + ",desktopicon"
}

if ($createQuickLaunchIcon)
{
    $mergeTasks = $mergeTasks + ",quicklaunchicon"
}

if ($addContextMenuFiles)
{
    $mergeTasks = $mergeTasks + ",addcontextmenufiles"
}

if ($addContextMenuFolders)
{
    $mergeTasks = $mergeTasks + ",addcontextmenufolders"
}

if ($addToPath)
{
    $mergeTasks = $mergeTasks + ",addtopath"
}

Write-Host "Merge Tasks: "
Write-Host "$mergeTasks"

$packageName = '{{PackageName}}'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = '{{DownloadUrl}}'
$url64      = '{{DownloadUrlx64}}'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64

  softwareName  = '{{PackageName}}*'

  checksum      = '{{Checksum}}'
  checksumType  = 'sha256'
  checksum64    = '{{Checksumx64}}'
  checksumType64= 'sha256'

  silentArgs    = "/silent /mergetasks=$mergeTasks /log=""$env:temp\vscode.log"""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
