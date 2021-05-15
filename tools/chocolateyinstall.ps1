$ErrorActionPreference = 'Stop';
$FullPackage = "Ultimaker_Cura-4.9.1-amd64.exe"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://github.com/Ultimaker/Cura/releases/download/4.9.1/' + $FullPackage
$WorkSpace = Join-Path $env:TEMP $env:ChocolateyPackageName

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    fileType       = 'exe'
    url64bit       = $url64

    softwareName   = 'Ultimakercura'

    checksum64     = 'f5a04999e5d09d57f4eaa93932b345932ed827b80cdc41d624dd0fc5e412d41a'
    checksumType64 = 'sha256'

    validExitCodes = @(0, 3010, 1641)
    silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs

# https://github.com/Ultimaker/Cura/releases/download/4.9.0/Ultimaker_Cura-4.9.0-amd64.exe
# https://software.ultimaker.com/cura/Ultimaker_Cura-4.9.1-amd64.exe