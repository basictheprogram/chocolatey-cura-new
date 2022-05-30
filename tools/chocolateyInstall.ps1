$ErrorActionPreference = 'Stop';

# https://github.com/Ultimaker/Cura/releases/download/5.0.0/Ultimaker-Cura-5.0.0-win64.exe

$FullPackage = "Ultimaker-Cura-5.0.0-win64.exe"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://github.com/Ultimaker/Cura/releases/download/5.0.0/' + $FullPackage
$WorkSpace = Join-Path $env:TEMP $env:ChocolateyPackageName

$ardunio = Join-Path $toolsDir 'Arduino.cer'
$adafruit = Join-Path $toolsDir 'Adafruit.cer'

Import-Certificate -FilePath $ardunio -CertStoreLocation Cert:\LocalMachine\TrustedPublisher
Import-Certificate -FilePath $adafruit -CertStoreLocation Cert:\LocalMachine\TrustedPublisher

& "$toolsDir\chocolateyUninstall.ps1"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    fileType       = 'exe'
    url64bit       = $url64

    softwareName   = 'Ultimaker'

    checksum64     = '3adc5f24a0ae705a3e302587ed7950f05d6f2c60834fce13fa69c2aef3a8da62'
    checksumType64 = 'sha256'

    validExitCodes = @(0, 3010, 1641)
    silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
