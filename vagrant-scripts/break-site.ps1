Import-Module WebAdministration
Stop-Website * -verbose
icacls c:\website\default.aspx /inheritance:r
icacls c:\website\default.aspx /remove:g Everyone