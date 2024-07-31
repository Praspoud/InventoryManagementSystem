# https://hub.docker.com/_/microsoft-dotnet
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /source

# copy csproj and restore as distinct layers
COPY *.sln .
COPY Inventory.Entities/*.csproj ./Inventory.Entities/
COPY Inventory.Services/*.csproj ./Inventory.Services/
COPY Inventory.Db/*.csproj ./Inventory.Db/
COPY InventoryManagementSystem/*.csproj ./InventoryManagementSystem/
RUN dotnet restore

# copy everything else and build app
COPY . .
WORKDIR /source/InventoryManagementSystem

RUN dotnet publish -c release -o /app

# final stage/image
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app ./
ENTRYPOINT ["dotnet", "InventoryManagementSystem.dll"]
