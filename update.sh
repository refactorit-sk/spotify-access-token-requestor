
export HOST_UID=$(id -u)
export HOST_GID=$(id -g)
export HOST_USERNAME=$(whoami)

CONTAINER_NAME="spotify-access-token-requestor"

mvn clean verify
docker build --build-arg UID=$HOST_UID --build-arg GID=$HOST_GID --build-arg USERNAME=$HOST_USERNAME --build-arg GROUPNAME=$HOST_USERNAME --tag=ivansla/${CONTAINER_NAME} .
docker push ivansla/${CONTAINER_NAME}

#docker container stop ${CONTAINER_NAME}
#docker container rm ${CONTAINER_NAME}

#rm -rf ./logs/

#docker run -dt --name ${CONTAINER_NAME} -v ./logs:/logs ivansla/${CONTAINER_NAME}
#docker network connect my-network ${CONTAINER_NAME}
#docker network inspect my-network
#sudo docker exec -ti psb-logs-reducer bash


#java -Dspring.profiles.active=local -jar logsreducer.jar

#podman run -dt --userns=keep-id --name psb-logs-reducer -v ./logs:/logs docker.io/library/psb-logs-reducer