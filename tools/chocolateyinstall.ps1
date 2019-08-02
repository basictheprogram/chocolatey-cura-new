$ErrorActionPreference = 'Stop';

# https://download.ultimaker.com/cura/Ultimaker_Cura-4.2.1-win64.exe

$FullPackage = "Ultimaker_Cura-4.2.1-win64.exe"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://download.ultimaker.com/cura/' + $FullPackage
$WorkSpace = Join-Path $env:TEMP $env:ChocolateyPackageName 

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    fileType       = 'exe'
    url64bit       = $url64

    softwareName   = 'Ultimakercura*'

    checksum64     = 'b463873df49434f2dbc960746a92a0767fe0477a80bf86903624f4b51cf4e711'
    checksumType64 = 'sha256'

    validExitCodes = @(0, 3010, 1641)
    silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs

