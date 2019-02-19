Write a Script file \n
Script has to create the Database \n
and Table \n
and Instert data into it. \n.
One approach would be, i would be creating a docker container and adding a docker-entrypoint.sh \n.
But this requirement doesn't require a local docker container. \n
Started with the docker compose. then thought of creating a script file. \n
but As it is going to create unnecessary overhead and I can execute command in my container using \n
docker exec -it conantainername bash "and that command" ... \n
I have gone in this path and created db , created table and inserted records.
