
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = ''
$url64      = 'https://github.com/Ultimaker/Cura/releases/download/3.6.0/Ultimaker.Cura-3.6.0-win64.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  url64bit      = $url64

  softwareName  = 'cura*'

  checksum      = ''
  checksumType  = 'sha256'
  checksum64    = '790eeeaea278e60e2cd23703df8c300b2d45e52227887036e6b6be0516d2b8af'
  checksumType64= 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs