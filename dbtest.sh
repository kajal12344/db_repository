#!/bin/bash

# install the anuglar dependency
# npm install

# build the application


# ng build --prod

# remove the container if exists or running
if [ $(sudo docker container ls -q --filter name=my_db_c) != '' ]; then
   sudo docker container stop my_db_c
    sudo docker container rm my_db_c
fi

# remove the image if exists
if [ $(sudo docker image ls -q --filter reference=my_db) != '' ]; then
    sudo docker image rm my_db
fi

# build the image
sudo docker build -t my_db .

# start the container
sudo docker run -itd -p 9099:3306 --name my_db_c my_db

# mysql -u root -h localhost --port=3308 --protocol=tcp -p
