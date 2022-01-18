$ErrorActionPreference = 'Stop';

$FullPackage = "Ultimaker_Cura-4.13.0-amd64.exe"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://github.com/Ultimaker/Cura/releases/download/4.13.0/' + $FullPackage
$WorkSpace = Join-Path $env:TEMP $env:ChocolateyPackageName

$ardunio = Join-Path $toolsDir 'Arduino.cer'
$adafruit = Join-Path $toolsDir 'Adafruit.cer'

Import-Certificate -FilePath $ardunio -CertStoreLocation Cert:\LocalMachine\TrustedPublisher
Import-Certificate -FilePath $adafruit -CertStoreLocation Cert:\LocalMachine\TrustedPublisher

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    fileType       = 'exe'
    url64bit       = $url64

    softwareName   = 'Ultimakercura'

    checksum64     = '8b43b17b000eae6a5d399e51306d033be896a071be68c4f48e83edbff5679d9e'
    checksumType64 = 'sha256'

    validExitCodes = @(0, 3010, 1641)
    silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs

# https://github.com/Ultimaker/Cura/releases/download/4.13.0/Ultimaker_Cura-4.13.0-amd64.exe