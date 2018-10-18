
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = ''
$url64      = 'https://github.com/Ultimaker/Cura/releases/download/3.1.0/Ultimaker.Cura-3.1.0-win64.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  url64bit      = $url64

  softwareName  = 'cura*'

  checksum      = ''
  checksumType  = 'sha256'
  checksum64    = 'D151CA8F3A060C8C900A1D5126EDCAB655176EE36F9C684B75ED8A35A9488E2D'
  checksumType64= 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs










    








