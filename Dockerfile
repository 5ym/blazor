FROM mcr.microsoft.com/dotnet/core/sdk:3.1-alpine AS build
WORKDIR /app
COPY . .
RUN dotnet publish -c Release

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-alpine AS runtime
WORKDIR /app
COPY --from=build /app/bin/Release/netcoreapp3.1/publish .
EXPOSE 80
ENTRYPOINT ["dotnet"]
CMD ["blazor.dll"]