# GITHUB Actions

Quick setup for GitHub Actions.

1. Place the [`Dockerfile`](../Dockerfile) from the root of this repository, in the root of your repository.
2. Place the [`.dockerignore`](../.dockerignore) from the root of this repository, in the root of your repository.
3. Edit `Dockerfile` and replace all instances of `WEB_PROJECT_FOLDER/WEB_PROJECT_NAME.csproj` with the path your web projects csproj file
4. Edit `Dockerfile` and replace `WEB_PROJECT_NAME.dll` with the name of your web projects dll (typically this is the same as your web project csproj file)
5. Copy the yaml-scripts from this folder into your `.github/workflows` folder.
6. Edit `main.yml` and replace `GITHUB_ACCOUNT_NAME/DOCKER_IMAGE_NAME` with the name of your docker image
7. Create a GitHub repository secret called `WEBHOOK_ENDPOINT` this should contain the Webhook URL found in UmbPanel
