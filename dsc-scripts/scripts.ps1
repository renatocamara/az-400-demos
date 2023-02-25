#Check for Installed Features:
Get-WindowsOptionalFeature -Online | where {$_.state -eq "Enabled"} | ft -Property featurename

#Check for Features available but Not Installed
Get-WindowsOptionalFeature -Online | where {$_.state -eq "Disabled"} | ft -Property featurename

#Disable a Windows Feature
Disable-WindowsOptionalFeature -Online -FeatureName IIS-DirectoryBrowsing

#Enable a Windows Feature
Enable-WindowsOptionalFeature -Online -FeatureName IIS-FTPExtensibility

#Check if IIS-FTPExtensibility is installed
$installed = (Get-WindowsOptionalFeature -Online | `
    where { $_.state -eq "Enabled" -and $_.FeatureName -eq "IIS-FTPExtensibility" } | Measure-Object).Count;

if ($installed -gt 0) { return "Installed" } else {return "Not Installed"}

