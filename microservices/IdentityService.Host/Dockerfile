FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["microservices/IdentityService.Host/IdentityService.Host.csproj", "microservices/IdentityService.Host/"]
COPY ["shared/MsDemo.Shared/MsDemo.Shared.csproj", "shared/MsDemo.Shared/"]
RUN dotnet restore "microservices/IdentityService.Host/IdentityService.Host.csproj" -nowarn:msb3202,msb3277,nu1503
COPY . .
WORKDIR "/src/microservices/IdentityService.Host"
RUN dotnet build "IdentityService.Host.csproj" --no-restore -nowarn:msb3202,msb3277,nu1503 -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "IdentityService.Host.csproj" --no-restore -nowarn:msb3202,msb3277,nu1503 -c Release -o /app/publish

FROM base AS final
WORKDIR /app

# Change timezone to local time
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN mkdir https

COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "IdentityService.Host.dll"]