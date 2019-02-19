Write a Script file </br>
Script has to create the Database </br> ( Here I have taken mysql )
and Table </br>
and Instert data into it. </br>
One approach would be, i would be creating a docker container and adding a docker-entrypoint.sh </br>
But this requirement doesn't require a local docker container. </br>
Started with the docker compose. then thought of creating a script file. </br>
but As it is going to create unnecessary overhead and I can execute command in my container using </br>
docker exec -it conantainername bash "and that command" ... </br>
I have gone in this path and created db , created table and inserted records.</br>
bash mysqlmigration.sh </br>
dropping the database</br>
Stopping mysql_db_1 ... done</br>
Removing mysql_db_1 ... done</br>
Removing network mysql_default</br>
mysql docker container deleted</br>
Creating docker container</br>
WARNING: The Docker Engine you're using is running in swarm mode.</br>

Compose does not use swarm mode to deploy services to multiple nodes in a swarm. All containers will be scheduled on the current node.</br>

To deploy your application across the swarm, use `docker stack deploy`.</br>

Creating network "mysql_default" with the default driver</br>
Creating mysql_db_1 ... done</br>
mysql container is created</br>
mysql: [Warning] Using a password on the command line interface can be insecure.</br>
mysql: [Warning] Using a password on the command line interface can be insecure.</br>
mysql: [Warning] Using a password on the command line interface can be insecure.</br></br>

mysql> use test;</br>
Reading table information for completion of table and column names</br>
You can turn off this feature to get a quicker startup with -A</br>

Database changed</br>
mysql> select * from employees;</br>
+------------+-----------+------------+------------------------+</br>
| first_name | last_name | department | email                  |</br>
+------------+-----------+------------+------------------------+</br>
| dharama    | rao       | IT         | bala@mail.com |</br>
| Lorenz     | Vanthillo | IT         | lv@mail.com      |</br>
+------------+-----------+------------+------------------------+</br>
2 rows in set (0.00 sec)</br>
