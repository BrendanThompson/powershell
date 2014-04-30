# Author:     Brendan Thompson
# Version:    v0.0.1

### ---------------------------------------------------------------------------
### Variables
### ---------------------------------------------------------------------------

$powershell="~\.powershell"
$functions="$powershell\functions"

### ---------------------------------------------------------------------------
### General Settings
### ---------------------------------------------------------------------------

Set-Location C:\

### ---------------------------------------------------------------------------
### Load Function Files
### ---------------------------------------------------------------------------

. $functions\files.ps1
. $functions\remote-administration.ps1
. $functions\Get-ComputerDetails.ps1
. $functions\sudo.ps1
. $functions\psh.ps1


### ---------------------------------------------------------------------------
### Load Aliases
### ---------------------------------------------------------------------------

Set-Alias psudo $functions\psudo.ps1
Set-Alias touch $functions\touch.ps1

### ---------------------------------------------------------------------------
### Import Modules
### ---------------------------------------------------------------------------

Import-Module $powershell\Modules\posh-git\posh-git.psm1

### ---------------------------------------------------------------------------
### PoSH-Git Settings
### ---------------------------------------------------------------------------

function global:prompt {
    $realLASTEXITCODE = $LASTEXITCODE

    # Reset color, which can be messed up by Enable-GitColors
    $Host.UI.RawUI.ForegroundColor = $GitPromptSettings.DefaultForegroundColor

    Write-Host($pwd.ProviderPath) -nonewline

    Write-VcsStatus

    $global:LASTEXITCODE = $realLASTEXITCODE
    return "> "
}

Enable-GitColors

Pop-Location

Start-SshAgent -Quiet