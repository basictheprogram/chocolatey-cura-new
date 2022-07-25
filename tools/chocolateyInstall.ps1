$ErrorActionPreference = 'Stop';

$data = & (Join-Path -Path (Split-Path -Path $MyInvocation.MyCommand.Path) -ChildPath data.ps1)
$WorkSpace = Join-Path $env:TEMP $env:ChocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

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
    silentArgs     = '/S'
    softwareName   = 'Ultimaker'
    validExitCodes = @(0, 3010, 1641)

    url            = $data.url
    checksum       = $data.checksum
    checksumType   = $data.checksumType
}

Install-ChocolateyPackage @packageArgs

# Work around for https://github.com/Ultimaker/Cura/issues/12449
#
# Install-ChocolateyShortcut `
#     -ShortcutFilePath "C:\Users\Public\Desktop\Ultimaker Cura 5.0.0.lnk" `
#     -TargetPath "C:\Program Files\Ultimaker Cura 5.0.0\Ultimaker-Cura.exe" `
#    -WorkingDirectory "C:\Program Files\Ultimaker Cura 5.0.0"

#Install-ChocolateyShortcut `
#    -ShortcutFilePath "C:\ProgramData\Microsoft\Windows\Start Menu\\Ultimaker Cura 5.0.0.lnk" `
#    -TargetPath "C:\Program Files\Ultimaker Cura 5.0.0\Ultimaker-Cura.exe" `
#    -WorkingDirectory "C:\Program Files\Ultimaker Cura 5.0.0"

