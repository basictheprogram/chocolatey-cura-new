﻿$ErrorActionPreference = 'Stop'; # stop on all errors

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'exe'
    softwareName   = 'Ultimaker*'
    silentArgs     = "/S"
    validExitCodes = @(0, 3010, 1605, 1614, 1641)
}

$uninstalled = $false
# Get-UninstallRegistryKey is new to 0.9.10, if supporting 0.9.9.x and below,
# take a dependency on "chocolatey-core.extension" in your nuspec file.
# This is only a fuzzy search if $softwareName includes '*'. Otherwise it is
# exact. In the case of versions in key names, we recommend removing the version
# and using '*'.
[array]$key = Get-UninstallRegistryKey -SoftwareName $packageArgs['softwareName']

if ($key.Count -eq 1) {
    $key | % {
        $packageArgs['file'] = "$($_.UninstallString)"
        if ($packageArgs['fileType'] -eq 'MSI') {
            # The Product Code GUID is all that should be passed for MSI, and very
            # FIRST, because it comes directly after /x, which is already set in the
            # Uninstall-ChocolateyPackage msiargs (facepalm).
            $packageArgs['silentArgs'] = "$($_.PSChildName) $($packageArgs['silentArgs'])"

            # Don't pass anything for file, it is ignored for msi (facepalm number 2)
            # Alternatively if you need to pass a path to an msi, determine that and
            # use it instead of the above in silentArgs, still very first
            $packageArgs['file'] = ''
        }

        Uninstall-ChocolateyPackage @packageArgs
    }
}
elseif ($key.Count -eq 0) {
    Write-Warning "$packageName has already been uninstalled by other means."
}
elseif ($key.Count -gt 1) {
    Write-Warning "$($key.Count) matches found!"
    Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
    Write-Warning "Please alert package maintainer the following keys were matched:"
    $key | % { Write-Warning "- $($_.DisplayName)" }
}
