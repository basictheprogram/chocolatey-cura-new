$ErrorActionPreference = 'Stop';

# https://download.ultimaker.com/cura/Ultimaker_Cura-4.0.0-win64.exe

$FullPackage = "Ultimaker_Cura-4.0.0-win64.exe"
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64       = 'https://download.ultimaker.com/cura/' + $FullPackage
$WorkSpace   = Join-Path $env:TEMP $env:ChocolateyPackageName 

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url64bit      = $url64

  softwareName  = 'Ultimakercura*'

  checksum64    = 'f45a1c7b10b88d60e3cdea0530a4ddd499effd51eaf339b379ca8a37a7278c88'
  checksumType64= 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs

