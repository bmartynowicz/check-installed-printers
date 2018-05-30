$InstalledPrinters = Get-Printer
$Printers = Import-Csv -Path .\printers.csv -Header Name, DriverName
$MatchCounter = 0
$PrintersToCheck = 0

forEach ($IP in $InstalledPrinters)
{
    $PrintersToCheck = $PrintersToCheck + 1
    forEach ($Print in $Printers)
    {
        if ($IP.Name -eq $Print.Name)
        {
            $MatchCounter = $MatchCounter + 1
        }
    }
}

#Checking if all printers match, if matched output to console

if ($MatchCounter -eq $PrintersToCheck)
{
    $wshell = New-Object -ComObject Wscript.Shell
    $wshell.Popup("Printers all Found!",0,"Done")

    Return
} Else
    {
    Write-Host "Printers are missing!"
    Return
    }
             
