# Conecta

[![wercker status](https://app.wercker.com/status/a63242f5c5cee0e75044f6895689a927/m/master "wercker status")](https://app.wercker.com/project/byKey/a63242f5c5cee0e75044f6895689a927)  

Conecta project fosters partnerships in an innovation ecosystem.

# Instalation Prerequisites

Before run the project, you need the following programs installed:
**Docker**
**docker-compose**

# Instalation
```
$ git clone https://github.com/aceleradora-TW/conecta.git
$ cd conecta
```
# Build
Build Application whenever you **add or remove gems** in Gemfile. To build run the command:
```
$ make build
```
The command **make build** takes a long time so it is recommended to use only if you really need to change the Gemfile.

# Execution
To run server locally, run the command:
```
$ make run
```

# Import Data
To have Companies and Reasearch Center data to show in the project you need to import these data from csv files.
You can find this files in Aceleradora Google Drive.
This files should be located in:
```
  csv/files/company.csv
  csv/files/research_center.csv
```
With this files in the right folder, you can run the import command (It is faster now, with postgres =D )
```
$ make import
```
# Browser
Open browser in:
```
$ localhost:9393
```
# Test
To run all tests with capibara and rspec, run the command
```
$ make test
```
# Application Bash
If you want to access application container bash (terminal), run the following command:
```
$ make bash
```

# Other informations

Postgres container data are saved in ./data/postgres

## Staging Page
```
https://conectatw-staging.herokuapp.com/
```

## Production Page
```
https://conectatw.herokuapp.com/
```
