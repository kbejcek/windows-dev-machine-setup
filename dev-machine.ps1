Disable-UAC
Disable-MicrosoftUpdate

# Setup Windows Feature
Enable-RemoteDesktop

# Setup Windows Explorer options

Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions

Set-TaskbarOptions -Size Small -Combine Never

#adds things back in your left pane like recycle bin
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name NavPaneShowAllFolders -Value 1
#opens PC to This PC, not quick access
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name LaunchTo -Value 1
#taskbar where window is open for multi-monitor
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name MMTaskbarMode -Value 2

# Turn on windows features
#choco install -y Microsoft-Hyper-V-All --source="'windowsFeatures'"
#choco install -y Microsoft-Windows-Subsystem-Linux --source="'windowsfeatures'"

# Browsers
choco install -y googlechrome
choco install -y firefox
choco install microsoft-edge-insider

# Dev tools
choco install -y vscode
choco install -y git --package-parameters="'/GitAndUnixToolsOnPath /WindowsTerminal'"
choco install -y github-desktop
choco install -y linqpad
choco install -y nodejs-lts
#choco install -y docker-desktop


# Common utilities
choco install -y 7zip.install
choco install -y adobereader
choco install -y filezilla
choco install -y paint.net
choco install -y treesizefree
choco install -y keepass.install


# Removed stuff that comes pre installed with Windows.  From: https://github.com/microsoft/windows-dev-box-setup-scripts/blob/master/scripts/RemoveDefaultApps.ps1

function removeApp {
	Param ([string]$appName)
	Write-Output "Trying to remove $appName"
	Get-AppxPackage $appName -AllUsers | Remove-AppxPackage
	Get-AppXProvisionedPackage -Online | Where DisplayName -like $appName | Remove-AppxProvisionedPackage -Online
}

$applicationList = @(
	"Microsoft.BingFinance"
	"Microsoft.3DBuilder"
	"Microsoft.BingFinance"
	"Microsoft.BingNews"
	"Microsoft.BingSports"
	"Microsoft.BingWeather"
	"Microsoft.CommsPhone"
	"Microsoft.Getstarted"
	"Microsoft.WindowsMaps"
	"*MarchofEmpires*"
	"Microsoft.GetHelp"
	"Microsoft.Messaging"
	"*Minecraft*"
	"Microsoft.MicrosoftOfficeHub"
	"Microsoft.OneConnect"
	"Microsoft.WindowsPhone"
	"Microsoft.WindowsSoundRecorder"
	"*Solitaire*"
	"Microsoft.MicrosoftStickyNotes"
	"Microsoft.Office.Sway"
	"Microsoft.XboxApp"
	"Microsoft.XboxIdentityProvider"
	"Microsoft.ZuneMusic"
	"Microsoft.ZuneVideo"
	"Microsoft.NetworkSpeedTest"
	"Microsoft.FreshPaint"
	"Microsoft.Print3D"
	"*Autodesk*"
	"*BubbleWitch*"
    "king.com*"
    "G5*"
	"*Dell*"
	"*Facebook*"
	"*Keeper*"
	"*Netflix*"
	"*Twitter*"
	"*Plex*"
	"*.Duolingo-LearnLanguagesforFree"
	"*.EclipseManager"
	"ActiproSoftwareLLC.562882FEEB491" # Code Writer
	"*.AdobePhotoshopExpress"
);

foreach ($app in $applicationList) {
    removeApp $app
}








Enable-UAC
Enable-MicrosoftUpdate
