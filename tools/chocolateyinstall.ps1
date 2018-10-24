
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = ''
$url64      = 'https://github.com/Ultimaker/Cura/releases/download/3.5.1/Ultimaker.Cura-3.5.1-win64.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  url64bit      = $url64

  softwareName  = 'cura*'

  checksum      = ''
  checksumType  = 'sha256'
  checksum64    = 'ddcab9ef28ad4162275b88e058011c9ea7d73deb46c922e391e379454f15e971'
  checksumType64= 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs










    








