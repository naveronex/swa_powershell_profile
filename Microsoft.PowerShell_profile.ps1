<#----------------------------------------------------------------------
                Brandon's (elevated) Powershell Profile
------------------------------------------------------------------------
CHECK IF PROFILE EXISTS, AND THEN CREATE IT
    Test-Path $profile
    New-Item -Path $profile -ItemType File -Force
#>

# INTERFACE COLORS
$Host.UI.RawUI.BackgroundColor = ($bckgrnd = 'DarkRed')
$Host.UI.RawUI.ForegroundColor = 'White'
#$Host.PrivateData.ErrorForegroundColor = 'Red'
#$Host.PrivateData.ErrorBackgroundColor = $bckgrnd
#$Host.PrivateData.WarningForegroundColor = 'Magenta'
#$Host.PrivateData.WarningBackgroundColor = $bckgrnd
#$Host.PrivateData.DebugForegroundColor = 'Yellow'
#$Host.PrivateData.DebugBackgroundColor = $bckgrnd
#$Host.PrivateData.VerboseForegroundColor = 'Green'
#$Host.PrivateData.VerboseBackgroundColor = $bckgrnd
#$Host.PrivateData.ProgressForegroundColor = 'Cyan'
#$Host.PrivateData.ProgressBackgroundColor = $bckgrnd


# STARTING LOCATION
Set-Location C:\

# VARIABLES
$searchBase = "OU=SAFB,OU=-USA,DC=swa,DC=ds,DC=army,DC=mil"
$searchBaseElevated = "OU=SAFB,OU=USA,OU=Elevated_Accounts,DC=swa,DC=ds,DC=army,DC=mil"
$searchBaseServers = "OU=SAFB,OU=USA,OU=Member_Servers,OU=Servers,DC=swa,DC=ds,DC=army,DC=mil"
$userdata = "C:\Users\brandon.trahan"

# ALIASES
New-Item alias:con -Value Enter-PSSession
New-Item alias:ic -Value Invoke-Command
New-Item alias:dhcp -Value dhcpmgmt

# FUNCTIONS
function Edit-Profile {ISE $profile}

function FuckHIPS($computer) {
    if ($computer -eq $null) {
        Start-Process "C:\Program Files\McAfee\Host Intrusion Prevention\ClientControl.exe" -ArgumentList '/stop (HB$$0wn$y0u!!)'
    }
    else {
        Invoke-Command $computer {Start-Process "C:\Program Files\McAfee\Host Intrusion Prevention\ClientControl.exe" -ArgumentList '/stop (HB$$0wn$y0u!!)'}
    }
}

function ForgiveHIPS($computer) {
    if ($computer -eq $null) {
        Start-Process "C:\Program Files\McAfee\Host Intrusion Prevention\ClientControl.exe" -ArgumentList '/start'
    }
    else {
        Invoke-Command $computer {Start-Process "C:\Program Files\McAfee\Host Intrusion Prevention\ClientControl.exe" -ArgumentList '/start'}
    }
}
function Home {Set-Location $home}

function FindComputer($user) {
    $user = "*"+$user+"*"
    Get-ADComputer -Filter {description -like $user} -Properties name,description | select name,description
}

function KillIE {Get-Process | Where-Object {$_.name -like "iexplore*"} | Stop-Process -Force}



# CLEAR THE SCREEN
Clear-Host