function rdp
{
param  
        (  
            [Parameter(
                Position = 0,
                ValueFromPipeline=$true,
                Mandatory=$true,
                HelpMessage="Server Friendly name"
            )]
            [ValidateNotNullOrEmpty()]
            [string]
            $server
        )
    cmdkey /generic:TERMSRV/$server /user:$UserName /pass:($Password.GetNetworkCredential().Password)
    mstsc /v:$Server /f /admin
    Wait-Event -Timeout 5
    cmdkey /Delete:TERMSRV/$server

}