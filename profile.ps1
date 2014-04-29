# Author:     Brendan Thompson
# Version:    v0.0.1

### ---------------------------------------------------------------------------
### Variables
### ---------------------------------------------------------------------------

$powershell="~\.powershell"

### ---------------------------------------------------------------------------
### General Settings
### ---------------------------------------------------------------------------

Set-Location C:\

### ---------------------------------------------------------------------------
### Load Function Files
### ---------------------------------------------------------------------------

. ~\.powershell\functions\files.ps1

### ---------------------------------------------------------------------------
### Load Aliases
### ---------------------------------------------------------------------------

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