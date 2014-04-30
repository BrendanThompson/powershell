function psh {
    param (
    [Parameter(Mandatory=$true)]
    $ComputerName
    )
    
    Enter-PSSession -ComputerName $ComputerName
}