FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS base
WORKDIR /app
EXPOSE 8080

FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY . ./
RUN dotnet restore "WEB_PROJECT_FOLDER/WEB_PROJECT_NAME.csproj" --locked-mode
RUN dotnet build "WEB_PROJECT_FOLDER/WEB_PROJECT_NAME.csproj" -c $BUILD_CONFIGURATION --no-restore

FROM build AS publish
RUN dotnet publish "WEB_PROJECT_FOLDER/WEB_PROJECT_NAME.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false --no-build

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "WEB_PROJECT_NAME.dll", "--console-logger-format=json"]