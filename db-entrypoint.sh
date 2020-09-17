#!/usr/bin/env bash

# Simple docker entryfile to bootstrap mssql server.
cat << EOF > /tmp/setup.sql
USE master;
GO
CREATE DATABASE ${DATABASE_NAME};
GO
USE ${DATABASE_NAME};
GO
CREATE LOGIN ${APP_USER} WITH PASSWORD =N'${APP_PASSWORD}';
CREATE USER ${APP_USER} FOR LOGIN ${APP_USER};
GO
ALTER LOGIN ${APP_USER} ENABLE;
ALTER ROLE db_owner ADD MEMBER ${APP_USER};
GO
EOF

/opt/mssql/bin/sqlservr &
sleep 20

for i in {1..50};
do
    /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P ${SA_PASSWORD} -d master -i /tmp/setup.sql
    if [[ $? -eq 0 ]]
    then
        echo "setup.sql completed"
        break
    else
        echo "not ready yet... waiting another second."
        sleep 1
    fi
done

while true
do
    sleep 1800
done
