$ErrorActionPreference = 'Stop';
$FullPackage = "Ultimaker_Cura-4.9.0-amd64.exe"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://github.com/Ultimaker/Cura/releases/download/4.9.0/' + $FullPackage
$WorkSpace = Join-Path $env:TEMP $env:ChocolateyPackageName

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    fileType       = 'exe'
    url64bit       = $url64

    softwareName   = 'Ultimakercura*'

    checksum64     = '8b905dbe4264b45b31ff35d5196bd1d0faa9a24c251f5f22d5628adbf1ea4736'
    checksumType64 = 'sha256'

    validExitCodes = @(0, 3010, 1641)
    silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs

# https://github.com/Ultimaker/Cura/releases/download/4.9.0/Ultimaker_Cura-4.9.0-amd64.exe