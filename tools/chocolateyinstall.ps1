$ErrorActionPreference = 'Stop';

# https://github.com/Ultimaker/Cura/releases/download/4.3.0/Ultimaker_Cura-4.3.0-win64.exe

$FullPackage = "Ultimaker_Cura-4.3.0-win64.exe"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://github.com/Ultimaker/Cura/releases/download/4.3.0/' + $FullPackage
$WorkSpace = Join-Path $env:TEMP $env:ChocolateyPackageName 

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    fileType       = 'exe'
    url64bit       = $url64

    softwareName   = 'Ultimakercura*'

    checksum64     = 'bf35a3939776ccf7559e520247b8b4e1e092e876e266ba465ea55b6f63752cd7'
    checksumType64 = 'sha256'

    validExitCodes = @(0, 3010, 1641)
    silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs

