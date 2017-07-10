# Conecta

[![wercker status](https://app.wercker.com/status/a63242f5c5cee0e75044f6895689a927/m/master "wercker status")](https://app.wercker.com/project/byKey/a63242f5c5cee0e75044f6895689a927)  

Conecta project fosters partnerships in an innovation ecosystem.

# Installation requirements

Before running the project, you need to install the the following programs:
**Docker**
**docker-compose**

# Getting started

Below is the checklist of all you have to do to run the project in your local machine:

### 0 - Clone this project:

``` sh
git clone https://github.com/aceleradora-TW/conecta.git
cd conecta
```

### 1 - Build the application with Docker Compose

First, remember to set the Gmail credentials to configure the mailer. To do so, export them in
your environment:

`GMAIL_USER=<your_email>`

`GMAIL_PASSWORD=<your password>`

``` sh
make build
```

### 2 - Create the initial database schema in the Postgres container

``` sh
make db-migrate
```

__Optionally you can seed the database with some data from `CSV` files:__

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

``` sh
make db-seed
```

### 3 - Running the project

_The database schema must be created before starting the application, or
it will crash otherwise. To do so, you have two options:_

``` sh
make run
```
The application will be available at:

```
localhost:9393
```

# Tests

Running all the tests with Capybara and Rspec:

``` sh
make test
```

# Application Bash

If you want to access application container bash (terminal), run the following command:

``` sh
make bash
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

Postgres container data will be saved under `./data/postgres`

## Staging Page

```
https://conectatw-staging.herokuapp.com/
```

## Production Page

```
https://conectatw.herokuapp.com/
```
