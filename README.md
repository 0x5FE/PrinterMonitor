# PrinterMonitor

- The script compares the current printer ports with the new printer ports at regular intervals and alerts the user if any changes are found.

# Dependencies

- ***PowerShell:*** Ensure that PowerShell is installed on the system.
  
- ***Active Directory module:*** The Active Directory module is used to fetch printer port information, make sure it is installed and imported using:

  `Import-Module ActiveDirectory command`

- Open PowerShell as an administrator.
  
- Run the following command to install the module:

  `
Install-WindowsFeature RSAT-AD-PowerShell
`

# Adjustments for Correct Functionality


Before executing the script, make the following adjustments to ensure correct functionality:


- ***Permissions:*** Run the script with administrative privileges to ensure proper access to printer port information.

- ***Monitoring Interval:*** Adjust the monitoring interval according to your preference by modifying the Start-Sleep -Seconds 10 line. The default interval is set to 10 seconds.

- ***Pop-up Message:*** If you prefer a different method of notification instead of a pop-up message, you can modify the script to suit your needs.

  
# Possible Errors and Troubleshooting


While running the Printer Port Monitor script, you may encounter certain errors. Here are some possible errors and their suggested troubleshooting steps:


- ***Insufficient permissions:*** If you encounter errors related to insufficient permissions, make sure you are running the script with administrative privileges.

- Additionally, ensure that the account executing the script has the necessary permissions to access printer port information.




- ***Network-related errors:*** If there are network-related issues such as connectivity problems or printer port information not being retrieved, check your network settings and ensure that the printers are properly connected.




- ***Script execution errors:*** If any other errors occur during script execution, carefully review the error message shown in the console. 

- The error message might provide clues about the specific issue encountered, you can search for the error message online or consult the PowerShell documentation for guidance on resolving the specific error.

