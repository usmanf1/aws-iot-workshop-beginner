function PrintStep($step)
{
    Write-Host ""
    Write-Host "Step: $step"
    Write-Host "---------------------------"
}


# Author Profile
$authorName = "Faisal Usman"
$authorRole = "AWS DevOps Engineer"

# Disclaimer
$disclaimer = @"
***************************************************************************************
This script is intended for use in the AWS IoT workshop at Superior University.
***************************************************************************************
"@

# Display Author Profile and Disclaimer
Write-Host ""
Write-Host "Author Profile:"
Write-Host "Name: $authorName"
Write-Host "Role: $authorRole"
Write-Host ""

Write-Host "Disclaimer:"
Write-Host $disclaimer

# Delay for 10 seconds
Start-Sleep -Seconds 10

# # Install AWS CLI
# PrintStep "Installing AWS CLI..."
# if (-not (Test-Path "$env:ProgramFiles\Amazon\AWSCLIV2\aws.exe")) {
#     Write-Host "Installing AWS CLI..."
#     Invoke-WebRequest "https://awscli.amazonaws.com/AWSCLIV2.msi" -OutFile "AWSCLIV2.msi" -UseBasicParsing
#     Start-Process msiexec -Wait -ArgumentList "/i AWSCLIV2.msi /quiet"
#     Remove-Item "AWSCLIV2.msi"
# } else {
#     Write-Host "AWS CLI is already installed."
# }

# # Configure AWS Profile
# PrintStep "Configuring AWS Profile..."
# $profileName = Read-Host "Enter the AWS profile name"


# aws configure --profile $profileName

# # Activate AWS Profile
# Write-Host "Activating AWS Profile: $profileName"
# $env:AWS_PROFILE = $profileName

# Install Python 3 if not available
PrintStep "Installing Python 3..."
if (-not (Get-Command python -ErrorAction SilentlyContinue)) {
    Write-Host "Installing Python 3..."
    Invoke-WebRequest "https://www.python.org/ftp/python/3.9.7/python-3.9.7-amd64.exe" -OutFile "python.exe" -UseBasicParsing
    Start-Process ".\python.exe" -Wait -ArgumentList "/quiet InstallAllUsers=1 PrependPath=1"
    Remove-Item "python.exe"
} else {
    Write-Host "Python 3 is already installed."
}

# Install Python virtualenv
PrintStep "Installing Python virtualenv..."
if (-not (Get-Command virtualenv -ErrorAction SilentlyContinue)) {
    Write-Host "Installing Python virtualenv..."
    python -m pip install virtualenv
} else {
    Write-Host "Python virtualenv is already installed."
}

# Get the current script directory
$currentScriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path

# Create and activate virtual environment
$venvName = "venv"
$venvPath = Join-Path $currentScriptPath $venvName

PrintStep "Creating and activating virtual environment..."
if (-not (Test-Path $venvPath)) {
    Write-Host "Creating virtual environment..."
    virtualenv --prompt `($venvName`)$ $venvPath
} else {
    Write-Host "Virtual environment already exists."
}

Write-Host "Activating virtual environment..."
$activateScript = Join-Path $venvPath "Scripts\Activate.ps1"
. $activateScript

# Install Boto3 within the virtual environment
PrintStep "Installing Boto3..."
pip install boto3

# Install paho-mqtt within the virtual environment
PrintStep "Installing paho-mqtt..."
pip install paho-mqtt

Write-Host ""
Write-Host "Setup completed!"
