# AD Bulk Disable & Move

## Overview
A PowerShell script to bulk disable Active Directory user accounts and move them into a specified Organizational Unit (OU).  
This is useful for offboarding, cleanup, or archiving inactive accounts.

## Features
- Imports a list of users from a CSV file  
- Disables each listed account  
- Moves disabled accounts into a target OU  
- Skips users that cannot be found  

## Usage
1. Prepare a CSV file named `disables.csv` with the following column:
   ```csv
   SamAccountName
   jdoe
   asmith
   bjohnson
