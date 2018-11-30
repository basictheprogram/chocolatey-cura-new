$ErrorActionPreference = 'Stop';

$FullPackage = "Ultimaker.Cura-3.6.0-win64.exe"
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = ''
$url64       = 'https://github.com/Ultimaker/Cura/releases/download/3.6.0/' + $FullPackage
$WorkSpace   = Join-Path $env:TEMP $env:ChocolateyPackageName 


$WebFileArgs = @{
  packageName   = $env:ChocolateyPackageName
  FileFullPath  = Join-Path $WorkSpace $FullPackage
  url           = $url
  url64bit      = $url64

  softwareName  = 'Ultimakercura*'

  checksum      = ''
  checksumType  = 'sha256'
  checksum64    = '790eeeaea278e60e2cd23703df8c300b2d45e52227887036e6b6be0516d2b8af'
  checksumType64= 'sha256'
}

$PackedInstaller = Get-ChocolateyWebFile @WebFileArgs

# silent install requires AutoIT
# see https://github.com/basictheprogram/chocolatey-cura-new/issues/1
# see https://github.com/Ultimaker/Cura/issues/1245
#
$autoitExe    = 'AutoIt3.exe'
#$toolsDir     = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$autoitFile   = Join-Path $toolsDir 'cura-new.au3'
$fileFullPath = Join-Path $WorkSpace $FullPackage
Write-Debug "AutoItFile: `t$autoitFile"
Write-Debug "FileFullPath `t$fileFullPath"

$autoitProc   = Start-Process -FilePath $autoitExe -ArgumentList "$autoitFile $fileFullPath /S" -PassThru
$autoitId     = $autoitProc.Id
Write-Debug "autoitProc `t$autoitProc"
Write-Debug "$autoitExe start time:`t$($autoitProc.StartTime.ToShortTimeString())"
Write-Debug "Process ID: `t$autoitId"

