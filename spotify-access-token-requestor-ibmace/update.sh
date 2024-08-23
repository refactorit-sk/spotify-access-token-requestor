REPOSITORY_NAME="ivansla"
CONTAINER_NAME="spotify-access-token-requestor-ibmace"
SSL_FOLDER="./ssl/refactorit_sk"

. ~/Tools/ace-12.0.8.0/server/bin/mqsiprofile

openssl pkcs12 -export -out ${SSL_FOLDER}/refactorit.brazilsouth.cloudapp.azure.com.pfx -passout pass:LenovoLenovo123 -inkey ${SSL_FOLDER}/privkey.pem -in ${SSL_FOLDER}/fullchain.pem -name refactorit.sk

ibmint package --input-path ~/Repositories/spotify-access-token-requestor/spotify-access-token-requestor-ibmace/SpotifyAccessTokenRequestor \
--output-bar-file ~/Repositories/spotify-access-token-requestor/spotify-access-token-requestor-ibmace/SpotifyAccessTokenRequestor.bar \
--do-not-compile-java

docker build --tag=${REPOSITORY_NAME}/${CONTAINER_NAME} --build-arg="PASSWORD=LenovoLenovo123" --build-arg="HOSTNAME=refactorit_sk" .
docker push ${REPOSITORY_NAME}/${CONTAINER_NAME}

#docker container stop ace
#docker container rm ace
#docker run -dt --name ace ${REPOSITORY_NAME}/${CONTAINER_NAME}
#docker network connect my-network ace
#docker network inspect my-network
#docker exec -ti ace bash

