$ErrorActionPreference = 'Stop';

$FullPackage = "Ultimaker_Cura-4.13.1-amd64.exe"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://github.com/Ultimaker/Cura/releases/download/4.13.1/' + $FullPackage
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

    checksum64     = '8de0c18a61a29cac9cbcd5b6d1db1de925f3ea36d67d50e0aabef81d66a91538'
    checksumType64 = 'sha256'

    validExitCodes = @(0, 3010, 1641)
    silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
