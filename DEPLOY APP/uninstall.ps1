﻿$ProgramName = "Adobe.Acrobat.Reader.64-bit"
Start-Transcript -Path "$env:ProgramData\Microsoft\IntuneManagementExtension\Logs\$ProgramName-uninstall.log" -Force

# resolve winget_exe
$winget_exe = Resolve-Path "C:\Program Files\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe\winget.exe"
if ($winget_exe.count -gt 1){
        $winget_exe = $winget_exe[-1].Path
}

if (!$winget_exe){Write-Error "Winget not installed"}

& $winget_exe uninstall --exact --id $ProgramName --silent --accept-source-agreements

Stop-Transcript