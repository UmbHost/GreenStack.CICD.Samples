# Azure DevOps Pipelines

Quick setup for Azure DevOps Pipelines.

## Common Setup Steps

1. Place the [`Dockerfile`](../Dockerfile) from the root of this repository, in the root of your repository.
2. Place the [`.dockerignore`](../.dockerignore) from the root of this repository, in the root of your repository.
3. Edit `Dockerfile` and replace all instances of `WEB_PROJECT_FOLDER/WEB_PROJECT_NAME.csproj` with the path your web projects csproj file
4. Edit `Dockerfile` and replace `WEB_PROJECT_NAME.dll` with the name of your web projects dll (typically this is the same as your web project csproj file)
5. Copy the appropriate yaml-pipeline from this folder to your repository root or `.azure-pipelines/` folder.
6. Create a pipeline variable called `WEBHOOK_ENDPOINT` (keep it secret) - this should contain the Webhook URL found in UmbPanel

## Docker Hub

**File**: `dockerhub-pipeline.yml`

### Setup
1. Edit `dockerhub-pipeline.yml` and replace `DOCKER_USERNAME/DOCKER_IMAGE_NAME` with your Docker Hub username and image name
2. Create a Docker Registry service connection in Azure DevOps:
   - Go to Project Settings → Service connections
   - Create a new Docker Registry connection
   - Choose Docker Hub as the registry type
   - Name it `DockerHub` (or update the pipeline file with your connection name)
   - Enter your Docker Hub username and password/access token
3. Add the pipeline to your Azure DevOps project

## GitHub Container Registry (GHCR)

**File**: `ghcr-pipeline.yml`

### Setup
1. Edit `ghcr-pipeline.yml` and replace `GITHUB_ACCOUNT_NAME/DOCKER_IMAGE_NAME` with your GitHub account/organization and image name
2. Create a Docker Registry service connection in Azure DevOps:
   - Go to Project Settings → Service connections
   - Create a new Docker Registry connection
   - Choose Others as the registry type
   - Docker Registry: `https://ghcr.io`
   - Docker ID: Your GitHub username
   - Docker Password: GitHub Personal Access Token with `write:packages` permission
   - Service connection name: `GitHubContainerRegistry` (or update the pipeline file)
3. Add the pipeline to your Azure DevOps project

## Azure Container Registry (ACR)

**File**: `acr-pipeline.yml`

### Setup
1. Edit `acr-pipeline.yml` and replace:
   - `YOUR_ACR_NAME` with your Azure Container Registry name (without `.azurecr.io`)
   - `DOCKER_IMAGE_NAME` with your desired image name
2. Create a Docker Registry service connection in Azure DevOps:
   - Go to Project Settings → Service connections
   - Create a new Docker Registry connection
   - Choose Azure Container Registry as the registry type
   - Select your Azure subscription
   - Select your Azure Container Registry
   - Service connection name: `AzureContainerRegistry` (or update the pipeline file)
3. Add the pipeline to your Azure DevOps project

## AWS Elastic Container Registry (ECR)

**File**: `aws-ecr-pipeline.yml`

### Setup
1. Edit `aws-ecr-pipeline.yml` and replace:
   - `AWS_ACCOUNT_ID` with your AWS account ID
   - `AWS_REGION` with your desired AWS region (e.g., `us-east-1`)
   - `DOCKER_IMAGE_NAME` with your desired image name
2. Create an ECR repository in AWS (if not already exists)
3. Create pipeline variables:
   - `AWS_ACCESS_KEY_ID` - Your AWS access key ID (mark as secret)
   - `AWS_SECRET_ACCESS_KEY` - Your AWS secret access key (mark as secret)
   - Note: The IAM user should have permissions to push to ECR
4. Add the pipeline to your Azure DevOps project

## Quay.io

**File**: `quay-pipeline.yml`

### Setup
1. Edit `quay-pipeline.yml` and replace `QUAY_USERNAME/DOCKER_IMAGE_NAME` with your Quay.io username and image name
2. Create a repository on Quay.io (if not already exists)
3. Create a Docker Registry service connection in Azure DevOps:
   - Go to Project Settings → Service connections
   - Create a new Docker Registry connection
   - Choose Others as the registry type
   - Docker Registry: `https://quay.io`
   - Docker ID: Your Quay.io username or robot account name
   - Docker Password: Your Quay.io password or robot account token
   - Service connection name: `QuayRegistry` (or update the pipeline file)
4. Add the pipeline to your Azure DevOps project

## ProGet

**File**: `proget-pipeline.yml`

### Setup
1. Edit `proget-pipeline.yml` and replace:
   - `proget.example.com` with your ProGet server URL
   - `docker-feed` with your ProGet Docker feed name
   - `DOCKER_IMAGE_NAME` with your desired image name
2. Create a Docker Registry service connection in Azure DevOps:
   - Go to Project Settings → Service connections
   - Create a new Docker Registry connection
   - Choose Others as the registry type
   - Docker Registry: `https://proget.example.com` (use your actual ProGet URL)
   - Docker ID: Your ProGet username or API key name
   - Docker Password: Your ProGet password or API key
   - Service connection name: `ProGetRegistry` (or update the pipeline file)
3. Add the pipeline to your Azure DevOps project

## GitLab Container Registry

**File**: `gitlab-cr-pipeline.yml`

### Setup
1. Edit `gitlab-cr-pipeline.yml` and replace `GITLAB_GROUP/GITLAB_PROJECT/DOCKER_IMAGE_NAME` with your GitLab group, project, and image name
2. Create a Docker Registry service connection in Azure DevOps:
   - Go to Project Settings → Service connections
   - Create a new Docker Registry connection
   - Choose Others as the registry type
   - Docker Registry: `https://registry.gitlab.com`
   - Docker ID: Your GitLab username
   - Docker Password: Your GitLab personal access token or deploy token with `write_registry` scope
   - Service connection name: `GitLabContainerRegistry` (or update the pipeline file)
3. Add the pipeline to your Azure DevOps project

## Additional Notes

- All pipelines use timestamp-based tagging for version control: `HHMMSSDDMMYYYY`
- Each image is also tagged with `latest` for convenience
- Pipelines support git submodules automatically
- Make sure your service connections have the necessary permissions to push to the registries
