FROM eclipse-temurin:21.0.3_9-jre

ARG UID
ARG GID
ARG USERNAME
ENV SPRING_PROFILE=local
ENV TZ="Europe/Prague"

RUN addgroup --gid $GID ${USERNAME} \
    && adduser --uid $UID --gid $GID --disabled-password ${USERNAME}

COPY target/spotify*.jar spotifyaccesstokenrequestor.jar

USER ${USERNAME}

ENTRYPOINT ["java", "-Dspring.profiles.active=${SPRING_PROFILE}", "-jar","/spotifyaccesstokenrequestor.jar"]



