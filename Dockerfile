FROM mcr.microsoft.com/mssql/server:2019-latest
ENV ACCEPT_EULA "Y"
ENV MSSQL_MEMORY_LIMIT_MB "1024"
ENV MSSQL_IP_ADDRESS "0.0.0.0"
ENV MSSQL_PID "Developer"
ENV SA_PASSWORD "weSFEWdsd2w35r3e"
ENV APP_USER "testuser"
ENV APP_PASSWORD "testpassword123"
ENV DATABASE_NAME "testdb"
ADD db-entrypoint.sh /code/db-entrypoint.sh
ENTRYPOINT /code/db-entrypoint.sh
