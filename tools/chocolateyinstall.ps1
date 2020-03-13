$ErrorActionPreference = 'Stop';
$FullPackage = "Ultimaker.Cura-4.5.0-win64.exe"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://github.com/Ultimaker/Cura/releases/download/4.5.0/' + $FullPackage
$WorkSpace = Join-Path $env:TEMP $env:ChocolateyPackageName 

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    fileType       = 'exe'
    url64bit       = $url64

    softwareName   = 'Ultimakercura*'

    checksum64     = 'ff9afb3b969524f9da472be91eda137ec0c0bc5f59d30183fd8f260bf6fbf0d8'
    checksumType64 = 'sha256'

    validExitCodes = @(0, 3010, 1641)
    silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs

# https://github.com/Ultimaker/Cura/releases/download/4.5.0/Ultimaker.Cura-4.5.0-win64.exe