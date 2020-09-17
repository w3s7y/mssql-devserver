# mssql-devserver
MS SQL 2019 Docker build with bootstrap for development

## Start args
| Name | Default | Description |
|------|---------|-------------|
|SA_PASSWORD|weSFEWdsd2w35r3e|sa password for DB|
|APP_USER|testuser|Application user| 
|APP_PASSWORD|TestPassword123|Application password|
|DATABASE_NAME|testdb|Application database name|

All the other default `mcr.microsoft.com/mssql/server:2019-latest` vars can also be overridden. 
## Booting a container
Example overriding the default DB name 
```$bash
docker run --it --rm --name mssql --env DATABASE_NAME=someotherdb theshipyard/mssql-devserver:<tag>
```
