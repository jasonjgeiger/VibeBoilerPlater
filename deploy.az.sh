#!/bin/bash

# Login to Azure
az login

# Create resource group if it doesn't exist
az group create --name vibe-mcp-rg --location eastus

# Create App Service plan
az appservice plan create \
  --name vibe-mcp-plan \
  --resource-group vibe-mcp-rg \
  --sku B1 \
  --is-linux

# Create Web App
az webapp create \
  --name vibe-boilerplate-mcp \
  --resource-group vibe-mcp-rg \
  --plan vibe-mcp-plan \
  --runtime "NODE:18-lts"

# Configure environment variables
az webapp config appsettings set \
  --name vibe-boilerplate-mcp \
  --resource-group vibe-mcp-rg \
  --settings \
    NODE_ENV=production \
    PORT=8080 \
    WEBSITE_NODE_DEFAULT_VERSION=~18 \
    SCM_DO_BUILD_DURING_DEPLOYMENT=true

# Deploy the application
az webapp deployment source config-local-git \
  --name vibe-boilerplate-mcp \
  --resource-group vibe-mcp-rg

echo "Deployment completed. Your app is available at: https://vibe-boilerplate-mcp.azurewebsites.net" 