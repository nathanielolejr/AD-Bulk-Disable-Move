# Disable and Move Inactive AD Users

## 📌 Overview
A PowerShell script that automates the process of disabling Active Directory user accounts and moving them into a designated **Inactive Users OU**.  
Useful for cleaning up AD environments and managing offboarded employees.

## ⚙️ Features
- Reads user accounts from a CSV file (`SamAccountName` required).
- Disables each specified account.
- Moves accounts to a target **OU** (Organizational Unit).
- Logs results directly to the console.

## 📂 CSV Format
The CSV file must contain a column named **SamAccountName**:

```csv
SamAccountName
jdoe
asmith
bjohnson
