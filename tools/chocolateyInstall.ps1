$ErrorActionPreference = 'Stop';

$FullPackage = "Ultimaker-Cura-5.0.0-win64.exe"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://github.com/Ultimaker/Cura/releases/download/5.0.0/' + $FullPackage
$WorkSpace = Join-Path $env:TEMP $env:ChocolateyPackageName

# v5.0.0 fixed the certificate issue.  Leave it here just in case?
#
# $ardunio = Join-Path $toolsDir 'Arduino.cer'
# $adafruit = Join-Path $toolsDir 'Adafruit.cer'
#
# Import-Certificate -FilePath $ardunio -CertStoreLocation Cert:\LocalMachine\TrustedPublisher
# Import-Certificate -FilePath $adafruit -CertStoreLocation Cert:\LocalMachine\TrustedPublisher

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

# Work around for https://github.com/Ultimaker/Cura/issues/12449
#
Install-ChocolateyShortcut `
    -ShortcutFilePath "C:\Users\Public\Desktop\Ultimaker Cura 5.0.0.lnk" `
    -TargetPath "C:\Program Files\Ultimaker Cura 5.0.0\Ultimaker-Cura.exe" `
    -WorkingDirectory "C:\Program Files\Ultimaker Cura 5.0.0"

Install-ChocolateyShortcut `
    -ShortcutFilePath "C:\ProgramData\Microsoft\Windows\Start Menu\\Ultimaker Cura 5.0.0.lnk" `
    -TargetPath "C:\Program Files\Ultimaker Cura 5.0.0\Ultimaker-Cura.exe" `
    -WorkingDirectory "C:\Program Files\Ultimaker Cura 5.0.0"
