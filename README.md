# Conecta

[![wercker status](https://app.wercker.com/status/a63242f5c5cee0e75044f6895689a927/m/master "wercker status")](https://app.wercker.com/project/byKey/a63242f5c5cee0e75044f6895689a927)  

Conecta project fosters partnerships in an innovation ecosystem.

# Installation requirements

Before running the project, you need to install the the following programs:
**Docker**
**docker-compose**

# Installation
```
$ git clone https://github.com/aceleradora-TW/conecta.git
$ cd conecta
```
# Build
Build the docker application image whenever you **change the Gemfile**. To build it, run the command:
```
$ make build
```
_The command **make build** takes a long time so it is recommended to use it only if you really need to change the Gemfile._

# Import Data
To have Companies and Research Centers available in the project you need to
import their data from CSV files.

You can find such files in Aceleradora's Google Drive.

The CSV files should be located in:
```
  csv/files/company.csv
  csv/files/research_center.csv
```

With the files in the right folder, you can run the import
command (It is faster now, with postgres =D )
```
$ make db-seed
```

# Execution

_The database schema must be created before starting the application, or
it will crash otherwise. To do so, you have two options:_

- Run the command mentioned above, importing the data from the CSV files

- Create the schema without any data, by running `make db-migrate`.

Once you set up your schema, you can run the server with:

```
$ make run
```

# Browser
Open browser in:
```
$ localhost:9393
```
# Test
To run all the tests with Capybara and Rspec, run the command:
```
$ make test
```
# Application Bash
If you want to access application container bash (terminal), run the following command:
```
$ make bash
```

# Database operations

There are a few make targets that help with schema management with PostgreSQL
in Docker:

__Generate and/or migrate database schema__

Which will run `DataMapper.auto_upgrade!`.

```
make db-migrate
```

__Reset database data and recreate schema__

Which will run `DataMapper.auto_migrate!`.

```
make db-reset
```

__Access Postgres Client in a running Docker container__

```
make db-console
```

__Insert data from CSV files into a database
(see Import Data section of this document to get some context)__

```
make db-seed
```

_Since some of the above operations require a previously started Psql container,
they all execute `db-start`, which will start the psql container with
Docker Compose._

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
