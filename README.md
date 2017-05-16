# Conecta

[![wercker status](https://app.wercker.com/status/a63242f5c5cee0e75044f6895689a927/m/master "wercker status")](https://app.wercker.com/project/byKey/a63242f5c5cee0e75044f6895689a927)  

Conecta project fosters partnerships in an innovation ecosystem.

# Instalation 
```
$ git clone https://github.com/aceleradora-TW/conecta.git
$ cd conecta
$ bundle install
```

# Import Data

To have Companies and Reasearch Center data to show in the project you need to import these data from csv files.
You can find this files in Aceleradora Google Drive.
This files should be located in:
```
  csv/files/company.csv
  csv/files/research_center.csv
```
With this files in the right folder, you can run the import command (It may took a while, you can take a coffee :O ).
```
$ rake i
```

# Execution
To run server locally, run the command: 
```
$ rake s
```

# Browser 
Open browser in:
```
$ localhost:9393
```
# Other informations
## Staging Page
```
https://conectatw-staging.herokuapp.com/
```

## Production Page
```
https://conectatw.herokuapp.com/
```
