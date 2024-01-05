# Import-Module ActiveDirectory

# Use direct comparators
function Monitor-PrinterPortChange {
  param (
    [int]$CheckIntervalSeconds = 10,
    [string]$NotificationType = "MessageBox"
  )

  # Group messages
  $message = "The following printers have had network port changes:\n"

  
  # Write errors to a file
  $ErrorActionPreference = "Stop"
  $ErrorLogFile = "PrinterPortMonitorErrors.log"

  $currentPorts = Get-PrinterPort
  while ($true) {
    try {
      # Update current and new port lists
      $newPorts = Get-PrinterPort

      # Compare lists to detect changes
      if ($currentPorts.Name -ne $newPorts.Name -or $currentPorts.HostAddress -ne $newPorts.HostAddress) {
        # Agrupe as alterações em uma mensagem
        $changedPorts = $newPorts | Where-Object { $_.Name -ne $currentPorts.Name }
        $message += $changedPorts | ForEach-Object { "$($_.Name) ($($_.HostAddress))" }

        # Notifies user by push
        $pushNotification = New-PushNotification -Message $message
        $pushNotification | Send-PushNotification

        # Atualize as listas de portas atuais
        $currentPorts = $newPorts
      }
    } catch {
      $errorMessage = "Erro: $_`nEm: $($MyInvocation.InvocationName)`nNa linha: $($MyInvocation.ScriptLineNumber)"
      Add-Content -Path $ErrorLogFile -Value $errorMessage
    }

    Start-Sleep -Seconds $CheckIntervalSeconds
  }
}

# Example of use
Monitor-PrinterPortChange -CheckIntervalSeconds 30 -NotificationType "Push" -Title "Changes to Printer Ports"
