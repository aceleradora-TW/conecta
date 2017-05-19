#!/bin/bash

if [ $1 = 's' ]
then
  echo "Starting Server"
  sudo docker-compose up
elif [ $1 = 'i' ]
then
  echo "Starting Importing Data from csv"
  sudo docker-compose run web rake i
elif [ $1 = 't' ]
then
  echo "Starting Tests"
  sudo docker-compose run web rake test
fi
