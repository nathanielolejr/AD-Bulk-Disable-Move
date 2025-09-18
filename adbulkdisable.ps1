# Import Active Directory module
Import-Module ActiveDirectory

# Define the path to the CSV file
$csvPath = "C:\Path\To\disables.csv"

# Import users from CSV
$users = Import-Csv -Path $csvPath

# Define the target OU (update with your environment)
$targetOU = "OU=Inactive Users,OU=User Accounts,DC=example,DC=local"

foreach ($user in $users) {
    $samAccountName = $user.SamAccountName  # Ensure CSV has a column named 'SamAccountName'
    
    # Get user from AD
    $adUser = Get-ADUser -Filter {SamAccountName -eq $samAccountName} -ErrorAction SilentlyContinue
    
    if ($adUser) {
        # Disable the user account
        Disable-ADAccount -Identity $adUser.DistinguishedName
        
        # Move user to the target OU
        Move-ADObject -Identity $adUser.DistinguishedName -TargetPath $targetOU
        
        Write-Host "User $samAccountName disabled and moved to Inactive Users OU." -ForegroundColor Green
    } else {
        Write-Host "User $samAccountName not found in Active Directory." -ForegroundColor Red
    }
}
