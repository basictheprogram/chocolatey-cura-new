$ErrorActionPreference = 'Stop';

$FullPackage = "Ultimaker_Cura-4.11.0-amd64.exe"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://github.com/Ultimaker/Cura/releases/download/4.11.0/' + $FullPackage
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

    checksum64     = '0773d5225095e0b1b0c55c185eb29063abf42976bd49f3f74feea5f9ff7cd7f9'
    checksumType64 = 'sha256'

    validExitCodes = @(0, 3010, 1641)
    silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs

# https://github.com/Ultimaker/Cura/releases/download/4.10.0/Ultimaker_Cura-4.10.0-amd64.exe