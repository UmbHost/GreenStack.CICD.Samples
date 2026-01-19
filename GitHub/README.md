# GITHUB Actions

Quick setup for GitHub Actions.

## Common Setup Steps

1. Place the [`Dockerfile`](../Dockerfile) from the root of this repository, in the root of your repository.
2. Place the [`.dockerignore`](../.dockerignore) from the root of this repository, in the root of your repository.
3. Edit `Dockerfile` and replace all instances of `WEB_PROJECT_FOLDER/WEB_PROJECT_NAME.csproj` with the path your web projects csproj file
4. Edit `Dockerfile` and replace `WEB_PROJECT_NAME.dll` with the name of your web projects dll (typically this is the same as your web project csproj file)
5. Copy the appropriate yaml-script from this folder into your `.github/workflows` folder.
6. Create a GitHub repository secret called `WEBHOOK_ENDPOINT` this should contain the Webhook URL found in UmbPanel

## GitHub Container Registry (GHCR)

**File**: `main.yml`

### Setup
1. Edit `main.yml` and replace `GITHUB_ACCOUNT_NAME/DOCKER_IMAGE_NAME` with the name of your docker image
2. No additional secrets required (uses `GITHUB_TOKEN` automatically)

## Docker Hub

**File**: `dockerhub.yml`

### Setup
1. Edit `dockerhub.yml` and replace `DOCKER_USERNAME/DOCKER_IMAGE_NAME` with your Docker Hub username and image name
2. Create a GitHub repository secret called `DOCKER_USERNAME` with your Docker Hub username
3. Create a GitHub repository secret called `DOCKER_ACCESS_TOKEN` with your Docker Hub access token

## Azure Container Registry (ACR)

**File**: `acr.yml`

### Setup
1. Edit `acr.yml` and replace:
   - `YOUR_ACR_NAME` with your Azure Container Registry name (without `.azurecr.io`)
   - `DOCKER_IMAGE_NAME` with your desired image name
2. Create GitHub repository secrets:
   - `ACR_USERNAME` - Your ACR username (found in Access keys section of your ACR in Azure Portal)
   - `ACR_PASSWORD` - Your ACR password (found in Access keys section of your ACR in Azure Portal)
   - Note: You must enable "Admin user" in your ACR Access keys settings to get these credentials
3. Alternative authentication options:
   - You can also use Azure Service Principal credentials instead of admin user
   - For Service Principal: Create an Azure AD app registration with AcrPush role on your ACR
   - Use the Service Principal's Application (client) ID as `ACR_USERNAME`
   - Use the Service Principal's client secret as `ACR_PASSWORD`

## AWS Elastic Container Registry (ECR)

**File**: `aws-ecr.yml`

### Setup
1. Edit `aws-ecr.yml` and replace:
   - `AWS_ACCOUNT_ID` with your AWS account ID
   - `AWS_REGION` with your desired AWS region (e.g., `us-east-1`)
   - `DOCKER_IMAGE_NAME` with your desired image name
2. Create an ECR repository in AWS (if not already exists)
3. Create GitHub repository secrets:
   - `AWS_ACCESS_KEY_ID` - Your AWS access key ID
   - `AWS_SECRET_ACCESS_KEY` - Your AWS secret access key
   - Note: The IAM user should have permissions to push to ECR (AmazonEC2ContainerRegistryPowerUser or similar)

## Quay.io

**File**: `quay.yml`

### Setup
1. Edit `quay.yml` and replace `QUAY_USERNAME/DOCKER_IMAGE_NAME` with your Quay.io username and image name
2. Create a repository on Quay.io (if not already exists)
3. Create GitHub repository secrets:
   - `QUAY_USERNAME` - Your Quay.io username or robot account name
   - `QUAY_PASSWORD` - Your Quay.io password or robot account token
   - Note: Robot accounts are recommended for CI/CD pipelines

## ProGet

**File**: `proget.yml`

### Setup
1. Edit `proget.yml` and replace:
   - `proget.example.com` with your ProGet server URL
   - `docker-feed` with your ProGet Docker feed name
   - `DOCKER_IMAGE_NAME` with your desired image name
2. Create GitHub repository secrets:
   - `PROGET_USERNAME` - Your ProGet username or API key name
   - `PROGET_PASSWORD` - Your ProGet password or API key
   - Note: API keys are recommended for CI/CD authentication

## GitLab Container Registry

**File**: `gitlab-cr.yml`

### Setup
1. Edit `gitlab-cr.yml` and replace `GITLAB_GROUP/GITLAB_PROJECT/DOCKER_IMAGE_NAME` with your GitLab group, project, and image name
2. Create GitHub repository secrets:
   - `GITLAB_USERNAME` - Your GitLab username
   - `GITLAB_TOKEN` - Your GitLab personal access token or deploy token with `write_registry` scope
   - Note: Deploy tokens are recommended for CI/CD pipelines
