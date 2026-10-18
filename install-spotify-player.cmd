@echo off
setlocal DisableDelayedExpansion
set "EMIL768_SPOTIFY_SETUP_FILE=%~f0"
"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoLogo -NoProfile -NonInteractive -Command "$ErrorActionPreference='Stop';try{$text=[IO.File]::ReadAllText($env:EMIL768_SPOTIFY_SETUP_FILE);$tag='#==EMIL768_SPOTIFY_SETUP_PS==';$at=$text.LastIndexOf($tag,[StringComparison]::Ordinal);if($at -lt 0){throw 'Installer payload is missing.'};$payload=$text.Substring($at+$tag.Length);& ([ScriptBlock]::Create($payload)) -NoDialogs;exit 0}catch{[Console]::Error.WriteLine('Setup failed: '+$_.Exception.Message);exit 1}"
set "SPOTIFY_SETUP_EXIT=%ERRORLEVEL%"
echo.
if not "%SPOTIFY_SETUP_EXIT%"=="0" echo Installation was not completed. Check the error above.
echo Press any key to close this window...
pause >nul
exit /b %SPOTIFY_SETUP_EXIT%
#==EMIL768_SPOTIFY_SETUP_PS==
param(
    [string]$ArchivePath = '',
    [string]$InstallRoot = '',
    [string]$StartupFolder = '',
    [switch]$SkipLaunch,
    [switch]$NoDialogs
)
$ErrorActionPreference = 'Stop'
$downloadUrl = 'https://github.com/emil768YT/emil768test_script/raw/refs/heads/main/spotify-pc-bridge.zip'
if (-not $InstallRoot) { $InstallRoot = Join-Path $env:LOCALAPPDATA 'Emil768\SpotifyBridge' }
$InstallRoot = [IO.Path]::GetFullPath($InstallRoot)
$stage = $null
$lockStream = $null
$logPath = Join-Path $InstallRoot 'setup.log'
$installationSucceeded = $false
function Show-SetupProgress([int]$Percent, [string]$Message) {
    Write-Host ('[{0,3}%] {1}' -f $Percent, $Message) -ForegroundColor Cyan
}
function Show-DownloadProgress([long]$Received, [long]$Total, [switch]$Complete) {
    if ($Total -gt 0) {
        $percent = [Math]::Min(100, [Math]::Floor(100 * $Received / $Total))
        $filled = [int][Math]::Floor($percent / 5)
        $text = 'Download: [' + ('#' * $filled) + ('-' * (20 - $filled)) + ('] {0,3}%  ({1:N1} / {2:N1} KB)' -f $percent, ($Received / 1024), ($Total / 1024))
    } elseif ($Complete) {
        $text = 'Download: [####################] 100%  (' + ('{0:N1} KB' -f ($Received / 1024)) + ')'
    } else {
        $text = 'Download: ' + ('{0:N1} KB received (total size not provided by server)' -f ($Received / 1024))
    }
    [Console]::Write("`r" + $text.PadRight(100))
    if ($Complete) { [Console]::WriteLine() }
}
function Receive-BridgeArchive([string]$Url, [string]$Destination) {
    $request = [Net.HttpWebRequest]::Create($Url)
    $request.Timeout, $request.ReadWriteTimeout = 60000, 60000
    $request.UserAgent = 'Emil768-Spotify-Bridge-Installer'
    $response, $inputStream, $outputStream = $null, $null, $null
    try {
        $response = $request.GetResponse()
        $total = $response.ContentLength
        if ($total -gt 10485760) { throw 'The downloaded archive is too large.' }
        $inputStream = $response.GetResponseStream()
        $outputStream = [IO.File]::Create($Destination)
        $buffer = New-Object byte[] 8192
        [long]$received = 0
        $lastPercent = -1
        Show-DownloadProgress 0 $total
        while (($count = $inputStream.Read($buffer, 0, $buffer.Length)) -gt 0) {
            $received += $count
            if ($received -gt 10485760) { throw 'The downloaded archive is too large.' }
            $outputStream.Write($buffer, 0, $count)
            $percent = if ($total -gt 0) { [Math]::Floor(100 * $received / $total) } else { -1 }
            if ($percent -ne $lastPercent -or $total -le 0) {
                Show-DownloadProgress $received $total
                $lastPercent = $percent
            }
        }
        if ($total -ge 0 -and $received -ne $total) { throw 'The archive download was incomplete. Please try again.' }
        Show-DownloadProgress $received $total -Complete
    } finally {
        if ($outputStream) { $outputStream.Dispose() }
        if ($inputStream) { $inputStream.Dispose() }
        if ($response) { $response.Dispose() }
    }
}
function Write-SetupLog([string]$Message) {
    Add-Content -LiteralPath $logPath -Value ((Get-Date -Format 'yyyy-MM-dd HH:mm:ss') + ' ' + $Message) -Encoding UTF8
}
function Assert-InstallChild([string]$Path) {
    $fullPath = [IO.Path]::GetFullPath($Path)
    $prefix = $InstallRoot.TrimEnd([char[]]'\/') + [IO.Path]::DirectorySeparatorChar
    if (-not $fullPath.StartsWith($prefix, [StringComparison]::OrdinalIgnoreCase)) { throw 'Invalid installation path.' }
    return $fullPath
}
function Test-BridgeReady {
    try {
        $health = Invoke-RestMethod -Uri 'http://127.0.0.1:43821/health' -TimeoutSec 2
        return $health.service -eq 'emil768.spotify.bridge'
    } catch { return $false }
}
try {
    Write-Host ''
    Write-Host 'Spotify mini player - Windows setup' -ForegroundColor Green
    Write-Host 'Installation progress is shown below. The helper will run in the background.'
    Write-Host ''
    Show-SetupProgress 0 'Preparing installation...'
    New-Item -ItemType Directory -Path $InstallRoot -Force | Out-Null
    try { $lockStream = [IO.File]::Open((Join-Path $InstallRoot 'setup.lock'), [IO.FileMode]::OpenOrCreate, [IO.FileAccess]::ReadWrite, [IO.FileShare]::None) }
    catch { throw 'Another Spotify Bridge installation is already running.' }
    Write-SetupLog 'Installation started.'
    $stage = Assert-InstallChild (Join-Path $InstallRoot ('.setup-' + [guid]::NewGuid().ToString('N')))
    New-Item -ItemType Directory -Path $stage | Out-Null
    $zipPath = Join-Path $stage 'spotify-pc-bridge.zip'
    Show-SetupProgress 5 'Downloading Spotify Bridge...'
    if ($ArchivePath) {
        Copy-Item -LiteralPath $ArchivePath -Destination $zipPath
        $localSize = (Get-Item -LiteralPath $zipPath).Length
        Show-DownloadProgress $localSize $localSize -Complete
    } else {
        [Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12
        $ProgressPreference = 'SilentlyContinue'
        Write-SetupLog 'Downloading Spotify Bridge from GitHub.'
        Receive-BridgeArchive $downloadUrl $zipPath
    }
    Show-SetupProgress 45 'Download completed. Checking archive...'
    if ((Get-Item -LiteralPath $zipPath).Length -gt 10485760) { throw 'The downloaded archive is too large.' }
    $releaseId = (Get-FileHash -LiteralPath $zipPath -Algorithm SHA256).Hash.ToLowerInvariant()
    $payload = Assert-InstallChild (Join-Path $stage 'payload')
    New-Item -ItemType Directory -Path $payload | Out-Null
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $archive = [IO.Compression.ZipFile]::OpenRead($zipPath)
    try {
        Show-SetupProgress 50 'Extracting files...'
        if ($archive.Entries.Count -gt 32) { throw 'The archive contains too many files.' }
        $required = @('spotify-bridge.ps1', 'start-spotify.ps1', 'start-spotify.cmd', 'stop-spotify.cmd')
        $seen = @{}
        [long]$expandedSize = 0
        $extractedFiles = 0
        foreach ($entry in $archive.Entries) {
            $name = $entry.FullName
            if (-not $name -or $name -match '[/\\:]' -or $name -in @('.', '..')) { throw 'The archive contains an invalid path.' }
            if ((($entry.ExternalAttributes -shr 16) -band 61440) -eq 40960) { throw 'Archive links are not supported.' }
            if ($name -notin $required -and $name -notmatch '^README(?:-(?:RU|EN|UA))?\.md$') { throw ('Unexpected archive file: ' + $name) }
            if ($seen.ContainsKey($name)) { throw 'The archive contains duplicate files.' }
            $seen[$name] = $true
            $expandedSize += $entry.Length
            if ($expandedSize -gt 16777216) { throw 'The extracted archive is too large.' }
            $target = Assert-InstallChild (Join-Path $payload $name)
            [IO.Compression.ZipFileExtensions]::ExtractToFile($entry, $target, $false)
            $extractedFiles++
            $extractPercent = [int][Math]::Floor(100 * $extractedFiles / [Math]::Max(1, $archive.Entries.Count))
            Show-SetupProgress (50 + [int][Math]::Floor($extractPercent / 5)) ('Extracting: {0}% ({1}/{2} files) - {3}' -f $extractPercent, $extractedFiles, $archive.Entries.Count, $name)
        }
        foreach ($name in $required) { if (-not $seen.ContainsKey($name)) { throw ('Missing archive file: ' + $name) } }
    } finally { $archive.Dispose() }
    foreach ($name in @('spotify-bridge.ps1', 'start-spotify.ps1')) {
        $tokens = $null
        $parseErrors = $null
        [Management.Automation.Language.Parser]::ParseFile((Join-Path $payload $name), [ref]$tokens, [ref]$parseErrors) | Out-Null
        if ($parseErrors.Count -gt 0) { throw ('Invalid PowerShell file: ' + $name) }
    }
    $versions = Assert-InstallChild (Join-Path $InstallRoot 'versions')
    Show-SetupProgress 75 'Installing files and background launchers...'
    New-Item -ItemType Directory -Path $versions -Force | Out-Null
    $release = Assert-InstallChild (Join-Path $versions $releaseId)
    if (Test-Path -LiteralPath $release) {
        foreach ($name in $required) {
            $installedFile = Assert-InstallChild (Join-Path $release $name)
            if (-not (Test-Path -LiteralPath $installedFile -PathType Leaf)) { throw 'An existing installation is incomplete.' }
            if ((Get-FileHash -LiteralPath $installedFile).Hash -ne (Get-FileHash -LiteralPath (Join-Path $payload $name)).Hash) { throw 'An existing installation has modified files.' }
        }
    } else {
        $payload = Assert-InstallChild $payload
        $release = Assert-InstallChild $release
        Move-Item -LiteralPath $payload -Destination $release
    }
    $utf8 = [Text.UTF8Encoding]::new($true)
    $startScript = @'
$ErrorActionPreference = 'Stop'
try {
    try {
        $health = Invoke-RestMethod -Uri 'http://127.0.0.1:43821/health' -TimeoutSec 2
        if ($health.service -eq 'emil768.spotify.bridge') { exit }
    } catch {}
    $releaseId = [IO.File]::ReadAllText((Join-Path $PSScriptRoot 'current-release.txt')).Trim()
    if ($releaseId -notmatch '^[0-9a-f]{64}$') { throw 'Invalid installed release.' }
    $bridgeFile = Join-Path $PSScriptRoot ('versions\' + $releaseId + '\spotify-bridge.ps1')
    if (-not (Test-Path -LiteralPath $bridgeFile -PathType Leaf)) { throw 'Spotify Bridge is missing. Run the installer again.' }
    $powershell = Join-Path $env:SystemRoot 'System32\WindowsPowerShell\v1.0\powershell.exe'
    Start-Process -FilePath $powershell -WindowStyle Hidden -ArgumentList @('-NoLogo', '-NoProfile', '-NonInteractive', '-File', ('"' + $bridgeFile + '"')) -RedirectStandardOutput (Join-Path $PSScriptRoot 'bridge-output.log') -RedirectStandardError (Join-Path $PSScriptRoot 'bridge-error.log') | Out-Null
} catch {
    [IO.File]::WriteAllText((Join-Path $PSScriptRoot 'start-error.log'), $_.Exception.Message)
    exit 1
}
'@
    [IO.File]::WriteAllText((Join-Path $InstallRoot 'start-spotify.ps1'), $startScript, $utf8)
    [IO.File]::WriteAllText((Join-Path $InstallRoot 'current-release.txt'), $releaseId, [Text.Encoding]::ASCII)
    $startCmd = "@echo off`r`nsetlocal DisableDelayedExpansion`r`n`"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe`" -NoLogo -NoProfile -NonInteractive -WindowStyle Hidden -File `"%~dp0start-spotify.ps1`"`r`n"
    $stopCmd = "@echo off`r`nsetlocal DisableDelayedExpansion`r`n`"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe`" -NoProfile -File `"%~dp0versions\$releaseId\spotify-bridge.ps1`" -Mode Stop`r`n"
    [IO.File]::WriteAllText((Join-Path $InstallRoot 'start-spotify.cmd'), $startCmd, [Text.Encoding]::ASCII)
    [IO.File]::WriteAllText((Join-Path $InstallRoot 'stop-spotify.cmd'), $stopCmd, [Text.Encoding]::ASCII)
    $powershell = Join-Path $env:SystemRoot 'System32\WindowsPowerShell\v1.0\powershell.exe'
    $command = '"' + $powershell + '" -NoLogo -NoProfile -NonInteractive -WindowStyle Hidden -File "' + (Join-Path $InstallRoot 'start-spotify.ps1') + '"'
    $vbs = "Set shell = CreateObject(`"WScript.Shell`")`r`nshell.Run `"" + $command.Replace('"', '""') + "`", 0, False`r`n"
    $vbsPath = Join-Path $InstallRoot 'start-spotify-hidden.vbs'
    [IO.File]::WriteAllText($vbsPath, $vbs, [Text.Encoding]::Unicode)
    if (-not $StartupFolder) { $StartupFolder = [Environment]::GetFolderPath('Startup') }
    Show-SetupProgress 80 'Adding to Windows startup: 0%...'
    if (-not $StartupFolder) { throw 'The Windows Startup folder is unavailable.' }
    New-Item -ItemType Directory -Path $StartupFolder -Force | Out-Null
    $shortcutPath = Join-Path $StartupFolder 'Emil768 Spotify Bridge.lnk'
    $shell = New-Object -ComObject WScript.Shell
    try {
        $shortcut = $shell.CreateShortcut($shortcutPath)
        $shortcut.TargetPath = Join-Path $env:SystemRoot 'System32\wscript.exe'
        $shortcut.Arguments = '"' + $vbsPath + '"'
        $shortcut.WorkingDirectory = $InstallRoot
        $shortcut.WindowStyle = 7
        $shortcut.Description = 'Start the Spotify mini player helper in the background.'
        $shortcut.Save()
    } finally { [Runtime.InteropServices.Marshal]::ReleaseComObject($shell) | Out-Null }
    Show-SetupProgress 85 'Windows startup: 100% - enabled successfully.'
    $disableCmd = @'
@echo off
setlocal DisableDelayedExpansion
"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -Command "$ErrorActionPreference='Stop';$file=Join-Path ([Environment]::GetFolderPath('Startup')) 'Emil768 Spotify Bridge.lnk';if(Test-Path -LiteralPath $file){Remove-Item -LiteralPath $file -Force};Write-Host 'Spotify Bridge automatic startup disabled.'"
if errorlevel 1 pause
'@
    [IO.File]::WriteAllText((Join-Path $InstallRoot 'disable-autostart.cmd'), $disableCmd.Replace("`n", "`r`n"), [Text.Encoding]::ASCII)
    Write-SetupLog ('Installed release ' + $releaseId + '. Automatic startup enabled.')
    if (-not $SkipLaunch) {
        Show-SetupProgress 90 'Starting Spotify Bridge in the background...'
        if (-not (Test-BridgeReady)) {
            Start-Process -FilePath $powershell -WindowStyle Hidden -ArgumentList @('-NoLogo', '-NoProfile', '-NonInteractive', '-File', ('"' + (Join-Path $InstallRoot 'start-spotify.ps1') + '"')) | Out-Null
            $ready = $false
            $deadline = [DateTime]::UtcNow.AddSeconds(20)
            do {
                if (Test-BridgeReady) { $ready = $true; break }
                Start-Sleep -Milliseconds 500
            } while ([DateTime]::UtcNow -lt $deadline)
            if (-not $ready) { throw 'Files were installed, but Spotify Bridge did not start. Check start-error.log and bridge-error.log. PowerShell may have blocked the script, or Windows media sessions may be unavailable.' }
        }
        Write-SetupLog 'Spotify Bridge is running. Open Spotify and enable Spotify mini player in the script.'
        Show-SetupProgress 95 'Spotify Bridge is running.'
    }
    Write-SetupLog 'Installation completed successfully.'
    $installationSucceeded = $true
} catch {
    $message = $_.Exception.Message
    Write-Host ''
    Write-Host ('Installation failed: ' + $message) -ForegroundColor Red
    Write-Host ('Log: ' + $logPath)
    if (Test-Path -LiteralPath $InstallRoot) { try { Write-SetupLog ('ERROR: ' + $message) } catch {} }
    if (-not $NoDialogs) {
        try {
            Add-Type -AssemblyName System.Windows.Forms
            [Windows.Forms.MessageBox]::Show(($message + "`r`n`r`nLog: " + $logPath), 'Spotify Bridge setup', 'OK', 'Error') | Out-Null
        } catch {}
    }
    throw
} finally {
    if ($lockStream) { $lockStream.Dispose() }
    if ($stage -and (Test-Path -LiteralPath $stage)) {
        $stage = Assert-InstallChild $stage
        if ([IO.Path]::GetFileName($stage) -notmatch '^\.setup-[0-9a-f]{32}$') { throw 'Invalid setup cleanup path.' }
        Remove-Item -LiteralPath $stage -Recurse -Force
    }
}
if ($installationSucceeded) {
    Write-Host ''
    Show-SetupProgress 100 'Installation completed successfully!'
    Write-Host 'Automatic startup: enabled for your Windows account.' -ForegroundColor Green
    Write-Host ('Installed to: ' + $InstallRoot)
    Write-Host 'Open Spotify, play a song, and enable Spotify mini player in the Roblox script.'
    Write-Host ''
}

