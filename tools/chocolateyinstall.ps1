$ErrorActionPreference = 'Stop';

# https://github.com/Ultimaker/Cura/releases/download/4.4.1/Ultimaker.Cura-4.4.1-win64.exe

$FullPackage = "Ultimaker.Cura-4.4.1-win64.exe"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://github.com/Ultimaker/Cura/releases/download/4.4.1/' + $FullPackage
$WorkSpace = Join-Path $env:TEMP $env:ChocolateyPackageName 

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    fileType       = 'exe'
    url64bit       = $url64

    softwareName   = 'Ultimakercura*'

    checksum64     = '7f72556e5ce55faf0626757968ffa122cd91df255852c84c908383c9b6ffb0aa'
    checksumType64 = 'sha256'

    validExitCodes = @(0, 3010, 1641)
    silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
