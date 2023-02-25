configuration InstallIISFTPExtensibility
{
    Node Webservice
    {
        WindowsFeature IIS
        {
            Ensure               = 'Present'
            Name                 = 'FTPExtensibility'
            IncludeAllSubFeature = $true
        }
    }

    Node NotFTPExtensibility
    {
        WindowsFeature IIS
        {
            Ensure               = 'Absent'
            Name                 = 'FTPExtensibility'
        }
    }
}