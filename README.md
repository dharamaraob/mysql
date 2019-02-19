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
