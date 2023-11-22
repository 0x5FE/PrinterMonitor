Import-Module ActiveDirectory

function Monitor-PrinterPortChange {
    $currentPorts = Get-PrinterPort

    while ($true) {
        try {
            $newPorts = Get-PrinterPort
            $changedPorts = Compare-Object $currentPorts $newPorts -Property Name, HostAddress

            if ($changedPorts) {
                $changedPorts | ForEach-Object {
                    $message = "Printer network port change detected:`n"
                    $message += "Printer: $($_.Name)`n"
                    $message += "New Host Address: $($_.HostAddress)"
                    [System.Windows.Forms.MessageBox]::Show($message, "Printer Port Change", "OK", "Information")
                }

                $currentPorts = $newPorts
            }
        }
        catch {
            Write-Host "Error occurred while monitoring printer ports: $_" -ForegroundColor Red
        }

        Start-Sleep -Seconds 10  # Adjust the interval as per your preference
    }
}

Monitor-PrinterPortChange
