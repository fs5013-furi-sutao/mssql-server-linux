# SQL Server コンテナの docker-compose 構成サンプル

## Get Started
このリポジトリをクローンする。
```console
git clone https://github.com/fs5013-furi-sutao/mssql.server.linux.git
```

クローンしたローカルリポジトリ内に入る。
```console
cd ./mssql.server.linux
```

DB コンテナを起動。
```console
docker-compose up -d
```

## 設定値など
設定値を変えたい時は、以下の箇所の値の不整合が起こらないように留意する。 

### docker-compose.yml:
```yaml
environment:
    SA_PASSWORD: msSqlserver123
    ACCEPT_EULA: "Y"
    MSSQL_AGENT_ENABLED: "true"
ports:
    - published: 1433
      target: 1433
```

### 初期設定接続シェル: db-init.sh
```shell
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P msSqlserver123 -d master -i db-init.sql
```
### 初期データ登録 SQL: db-init.sql
```sql
CREATE DATABASE EmployeeDb;
go

use EmployeeDb;
go

DROP TABLE IF EXISTS employees;
GO

CREATE TABLE employees(
    id int identity(1,1) primary key,
    name nvarchar(32),
    birthday datetime
);
GO

BULK INSERT employees
FROM '/usr/src/docker/backup/dbo.employees.csv'
WITH
(
   FIELDTERMINATOR = ',',
   ROWTERMINATOR = '\n'
);
GO
```
