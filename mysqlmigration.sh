#!/bin/bash
[[ -z ${aurora_service+x} ]] && { aurora_service="localhost" ; }
[[ -z ${aurora_port+x} ]] && { aurora_port="3306" ; }
[[ -z ${aurora_user+x} ]] && { aurora_user="root" ; }
[[ -z ${aurora_pass+x} ]] && { aurora_pass="example" ; }
mysql_create(){

    if [[ -f ./docker-compose.yml ]] && [[ -r ./docker-compose.yml ]]; then
        echo "dropping the database"
        docker-compose -f ./docker-compose.yml -p mysql down
        sleep 10
        if [[ $? -eq 0 ]]; then echo "mysql docker container deleted"; fi
        echo "Creating docker container"
        docker-compose -f ./docker-compose.yml -p mysql up -d
        if [[ $? -eq 0 ]]; then echo "mysql container is created"; fi
    else
        echo "docker compose file not found or  not readable";
    fi
}
drop_db_ifexits(){
    docker exec -it mysql_db_1  mysql -uroot -pexample  -e "drop database test"
}
initialize_db(){
    sudo docker exec -it mysql_db_1 mysql -u${aurora_user} -p${aurora_pass} -e "CREATE DATABASE test; use test;  CREATE TABLE employees ( \
    first_name varchar(25), \
    last_name  varchar(25), \
    department varchar(15), \
    email  varchar(50) \
    );"  --connect-timeout=3600

    if [[ "$?" -ne 0 ]] ; then
      echo  "Failed@ mysql -h ${aurora_service} -P ${aurora_port} -u ${aurora_user} -paurora_pass -e ${1} --connect-timeout=3600" ;
    fi

    sudo docker exec -it mysql_db_1  mysql -u${aurora_user} -p${aurora_pass} -e "use test; INSERT INTO employees (first_name, last_name, department, email) VALUES ('dharama', 'rao', 'IT', 'bala@mail.com')";
    if [[ "$?" -ne 0 ]] ; then echo "ERROR: failed to insert data. Please check"; fi
    sudo docker exec -it mysql_db_1  mysql -u${aurora_user} -p${aurora_pass}  -e "use test; INSERT INTO employees (first_name, last_name, department, email) VALUES ('Lorenz', 'Vanthillo', 'IT', 'lv@mail.com')";
    if [[ "$?" -ne 0 ]] ; then echo "ERROR: failed to insert data. Please check"; fi
}
# drop_db_ifexits
mysql_create
sleep 30
initialize_db