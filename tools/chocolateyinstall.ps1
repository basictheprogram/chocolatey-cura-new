$ErrorActionPreference = 'Stop';

# https://download.ultimaker.com/cura/Ultimaker_Cura-4.1.0-win64.exe

$FullPackage = "Ultimaker_Cura-4.1.0-win64.exe"
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64       = 'https://download.ultimaker.com/cura/' + $FullPackage
$WorkSpace   = Join-Path $env:TEMP $env:ChocolateyPackageName 

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url64bit      = $url64

  softwareName  = 'Ultimakercura*'

  checksum64    = '1c2b2deaec0a3f56242ebbeeb56410ed0640fa5bbd91bbb7e78399592e206ef3'
  checksumType64= 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs

