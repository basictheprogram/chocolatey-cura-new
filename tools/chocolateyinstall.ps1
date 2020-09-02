$ErrorActionPreference = 'Stop';
$FullPackage = "Ultimaker_Cura-4.7.0-amd64.exe"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://github.com/Ultimaker/Cura/releases/download/4.7.0/' + $FullPackage
$WorkSpace = Join-Path $env:TEMP $env:ChocolateyPackageName

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url64bit       = $url64

  softwareName   = 'Ultimakercura*'

  checksum64     = '5d7ae8cd670ebef325a5353d15d1cbca3a88934aa98f35d4c21c0eea8d5487d2'
  checksumType64 = 'sha256'

  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs

# https://github.com/Ultimaker/Cura/releases/download/4.6.1/Ultimaker.Cura-4.6.1-win64.exe