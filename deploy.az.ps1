# Check if Azure CLI is installed
if (-not (Get-Command az -ErrorAction SilentlyContinue)) {
    Write-Host "Azure CLI is not installed. Please install it from: https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-windows"
    exit 1
}

# Function to sign out from Azure CLI
function SignOut-Azure {
    Write-Host "Signing out from Azure CLI..."
    az logout
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Successfully signed out from Azure CLI"
    } else {
        Write-Host "Error signing out from Azure CLI"
    }
}

# Function to sign in to Azure CLI
function SignIn-Azure {
    Write-Host "Signing in to Azure CLI..."
    # First try to get current account
    $currentAccount = az account show 2>$null
    if (-not $currentAccount) {
        # If no current account, try to list accounts
        $accounts = az account list --query "[].{name:name, tenantId:tenantId, isDefault:isDefault}" -o json | ConvertFrom-Json
        if ($accounts.Count -gt 0) {
            Write-Host "`nAvailable Azure accounts:"
            for ($i = 0; $i -lt $accounts.Count; $i++) {
                $default = if ($accounts[$i].isDefault) { " [Default]" } else { "" }
                Write-Host "$($i + 1). $($accounts[$i].name) (Tenant: $($accounts[$i].tenantId))$default"
            }
            
            $selection = Read-Host "`nSelect an account (1-$($accounts.Count))"
            $index = [int]$selection - 1
            if ($index -ge 0 -and $index -lt $accounts.Count) {
                az account set --subscription $accounts[$index].name
            } else {
                Write-Host "Invalid selection. Please run the script again."
                exit 1
            }
        } else {
            # If no accounts found, perform interactive login
            az login
        }
    }
}

# Check if sign-out was requested
if ($args[0] -eq "--signout") {
    SignOut-Azure
    exit 0
}

# Sign in to Azure CLI
SignIn-Azure

# Get deployment information from user
Write-Host "`nPlease provide your Azure Web App details:"
$resourceGroup = Read-Host "Resource Group Name"
$webAppName = Read-Host "Web App Name"

# Verify the Web App exists
Write-Host "`nVerifying Web App..."
$webAppExists = az webapp show --name $webAppName --resource-group $resourceGroup --query "name" -o tsv 2>$null
if (-not $webAppExists) {
    Write-Host "Error: Web App '$webAppName' not found in resource group '$resourceGroup'"
    Write-Host "Please create the Web App first using Azure Portal or Azure CLI"
    exit 1
}

# Configure environment variables
Write-Host "`nConfiguring environment variables..."
$settings = @{
    "NODE_ENV" = "production"
    "PORT" = "8080"
    "WEBSITE_NODE_DEFAULT_VERSION" = "~18"
    "SCM_DO_BUILD_DURING_DEPLOYMENT" = "true"
}
az webapp config appsettings set --name $webAppName --resource-group $resourceGroup --settings $settings
if ($LASTEXITCODE -ne 0) {
    Write-Host "Error configuring environment variables. Please check the error message above."
    exit 1
}

# Set up deployment
Write-Host "`nSetting up deployment..."
az webapp deployment source config-local-git --name $webAppName --resource-group $resourceGroup
if ($LASTEXITCODE -ne 0) {
    Write-Host "Error setting up deployment. Please check the error message above."
    exit 1
}

# Get the deployment URL
$deploymentUrl = az webapp deployment source config-local-git --name $webAppName --resource-group $resourceGroup --query url -o tsv
if ($LASTEXITCODE -ne 0) {
    Write-Host "Error getting deployment URL. Please check the error message above."
    exit 1
}

Write-Host "`nDeployment setup completed successfully!"
Write-Host "Your app will be available at: https://$webAppName.azurewebsites.net"
Write-Host "`nNext steps:"
Write-Host "1. Add the deployment URL as a remote:"
Write-Host "   git remote add azure $deploymentUrl"
Write-Host "2. Deploy your code:"
Write-Host "   git push azure main"
Write-Host "3. Update your .cursor/settings.json with the new URL"
Write-Host "4. Test the deployment by visiting the URL"
Write-Host "5. Monitor the app in Azure Portal: https://portal.azure.com" 