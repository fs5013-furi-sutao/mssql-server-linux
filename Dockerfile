# FROM microsoft/mssql-server-linux:2017-latest
# FROM microsoft/mssql-server-linux:latest
FROM mcr.microsoft.com/mssql/server:2017-latest

COPY . /usr/src/docker

WORKDIR /usr/src/docker

RUN chmod +x ./db-init.sh
RUN chmod +r ./data/dbo.MstBranches.csv
RUN chmod +r ./data/dbo.MstDisasterStocks.csv
RUN chmod +r ./data/dbo.MstKbns.csv
RUN chmod +r ./data/dbo.MstManufactures.csv
RUN chmod +r ./data/dbo.MstPrefs.csv
RUN chmod +r ./data/dbo.MstProducts.csv

CMD /bin/bash ./entrypoint.sh
