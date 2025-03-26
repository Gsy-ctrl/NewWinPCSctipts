#This is currently a work in progress and untested!! 
#!!!!! USE WITH CAUTION !!!!!! 

#Requires -RunAsAdministrator

#region Helper Functions

# Function to check internet connectivity
function Test-InternetConnectivity {
    try {
        $response = Invoke-WebRequest -Uri "https://www.google.com" -UseBasicParsing -TimeoutSec 5
        return $true
    }
    catch {
        return $false
    }
}

# Function to install or update a package using Chocolatey
function Install-OrUpdate-Package {
    param ([string]$PackageName)
    Write-Host "Processing $PackageName..." -ForegroundColor Green

    if (choco list --localonly | Select-String -Pattern $PackageName) {
        Write-Host "$PackageName is already installed. Attempting to upgrade..." -ForegroundColor Yellow
        Start-Process -FilePath "choco" -ArgumentList "upgrade $PackageName -y --silent" -Wait -PassThru
    } else {
        Write-Host "Installing $PackageName..." -ForegroundColor Green
        Start-Process -FilePath "choco" -ArgumentList "install $PackageName -y --silent" -Wait -PassThru
    }
}

#endregion

#region Main Script
Set-ItemProperty -Path "HKCU:\Control Panel\Keyboard" -Name "PrintScreenKeyForSnippingEnabled" -Value 1
# Check internet connectivity
if (-not (Test-InternetConnectivity)) {
    Write-Host "No internet connection. Exiting." -ForegroundColor Red
    exit 1
}

# Check if Chocolatey is installed, if not, install it
if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "Chocolatey is not installed. Installing Chocolatey..." -ForegroundColor Yellow
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    Write-Host "Chocolatey installed successfully." -ForegroundColor Green
} else {
    Write-Host "Chocolatey is already installed." -ForegroundColor Green
}
# List of packages to install/update
$packages = @(
    "chocolateygui" "7zip", "advanced-ip-scanner", "adobereader",  "azure-cli", "bleachbit",
    "cpu-z", "curl", "ditto", "docker-desktop", "discord", "everything", "expresso", 
    "file-converter", "filezilla", "fiddler",
    "firefox", "gnupg", "gpg4win", "git", "googlechrome", "hwinfo", "irfanview", "jdownloader",
    "jetbrainstoolbox", "kate", "kodi", "mremoteng", "nmap", "notepadplusplus", "nugetpackageexplorer",
    "office365business", "obs-virtualcam", "obsidian", "openvpn-connect", "plasso", "postman",
    "powertoys", "protonmail", "protonvpn", "putty.install", "raidrive", "revo-uninstaller",
    "servicebusexplorer", "sidebar-diagnostics", "spotify", "start11", "streamio", "sumatrapdf", "Steam"
    "tailscale", "tapwindows", "trufflehog", "virtualbox", "vault", "vscode", "wireshark", "wingetui",
    "wiztree", "winscp", "apimonitor", "greenshot", "usbpcap", "sophiapp", "ferdium", "unchecky"
)
$sortedPackages = $packages | Sort-Object
foreach ($package in $sortedPackages) {
    Install-OrUpdate-Package $package
}

# Firefox Extensions
$firefoxExtensions = @(
    "https://addons.mozilla.org/firefox/downloads/file/3339802/privacy_badger-2025.4.8-an+fx.xpi",
    "https://addons.mozilla.org/firefox/downloads/file/3329993/reshacked-2024.0.0-an+fx.xpi",
    "https://addons.mozilla.org/firefox/downloads/file/3342679/the_camelizer-1.12.5-an+fx.xpi",
    "https://addons.mozilla.org/firefox/downloads/file/3335723/ublock_origin-1.48.8-an+fx.xpi",
    "https://addons.mozilla.org/firefox/downloads/file/3341325/protonvpn_firefox_extension-2.1.3-an+fx.xpi",
    "https://addons.mozilla.org/firefox/downloads/file/3346359/proton_pass-2024.3.0-an+fx.xpi"
)
$firefoxProfilePath = "$env:APPDATA\Mozilla\Firefox\Profiles"
$defaultProfile = Get-ChildItem -Path $firefoxProfilePath -Directory | Select-Object -First 1
foreach ($extensionUrl in $firefoxExtensions) {
    Write-Host "Downloading and copying Firefox extension: $extensionUrl" -ForegroundColor Green
    $fileName = [System.IO.Path]::GetFileName($extensionUrl)
    $destination = "$firefoxProfilePath\$defaultProfile\extensions\$fileName"
    Invoke-WebRequest -Uri $extensionUrl -OutFile $destination
}

# Chrome Extensions (Manual Installation Required)
$chromeExtensions = @(
    "https://chrome.google.com/webstore/detail/privacy-badger/oeplkpjbdncckplhhckkkikphjlfjfnf",
    "https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm",
    "https://chrome.google.com/webstore/detail/proton-vpn/ogmhlgfnjfdjlpdgplbkgoejlfhoklhd",
    "https://chrome.google.com/webstore/detail/proton-pass/aopkfmjhdbeagkmobpfgfnldpbalohjb"
)
foreach ($chromeExtensionUrl in $chromeExtensions) {
    Write-Host "Opening Chrome Web Store URL for manual installation: $chromeExtensionUrl" -ForegroundColor Yellow
    Start-Process "chrome.exe" -ArgumentList $chromeExtensionUrl
}

# Script to create a scheduled task for Chocolatey updates

$TaskName = "ChocolateyUpdate"
$TaskDescription = "Updates Chocolatey packages daily at 4 AM"
$Action = New-ScheduledTaskAction -Execute "choco.exe" -Argument "upgrade all -y"
$Trigger = New-ScheduledTaskTrigger -Daily -At 4am
$Principal = New-ScheduledTaskPrincipal -UserId ([System.Security.Principal.WindowsIdentity]::GetCurrent().User.Value) -RunLevel Highest

# Check if the task already exists
if (Get-ScheduledTask -TaskName $TaskName -ErrorAction SilentlyContinue) {
    Write-Warning "Task '$TaskName' already exists. Updating it."
    Set-ScheduledTask -TaskName $TaskName -Action $Action -Trigger $Trigger -Principal $Principal -Description $TaskDescription
} else {
    Register-ScheduledTask -TaskName $TaskName -Action $Action -Trigger $Trigger -Principal $Principal -Description $TaskDescription
    Write-Host "Task '$TaskName' created successfully."
}

# Optional: Set the task to run even if the user is not logged in.
Get-ScheduledTask -TaskName $TaskName | Set-ScheduledTask -User "SYSTEM" -RunLevel Highest -Settings (New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable -RunOnlyIfNetworkAvailable -Hidden)

Write-Host "All installations complete!" -ForegroundColor Green

#endregion
