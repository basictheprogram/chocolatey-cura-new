$ErrorActionPreference = 'Stop';

# https://github.com/Ultimaker/Cura/releases/download/v4.4.0/Ultimaker.Cura-4.4.0-win64.exe

$FullPackage = "Ultimaker.Cura-4.4.0-win64.exe"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://github.com/Ultimaker/Cura/releases/download/v4.4.0/' + $FullPackage
$WorkSpace = Join-Path $env:TEMP $env:ChocolateyPackageName 

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    fileType       = 'exe'
    url64bit       = $url64

    softwareName   = 'Ultimakercura*'

    checksum64     = '0a7109a64e0938a77d9a987ef0ae6867d4e98112420642633461598fbd6fa00a'
    checksumType64 = 'sha256'

    validExitCodes = @(0, 3010, 1641)
    silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs

