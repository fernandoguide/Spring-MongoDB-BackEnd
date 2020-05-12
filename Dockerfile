 
# For Java 8, try this

# FROM openjdk:8-jdk-alpine
# ARG JAR_FILE=target/*.jar
# COPY ${JAR_FILE} app.jar
# ENTRYPOINT ["java","-jar","/app.jar"]

# For Java 11, try this
FROM adoptopenjdk/openjdk11:alpine-jre

# Refer to Maven build -> finalName
ARG JAR_FILE=target/spring-boot-mongodb-crud-0.0.1-SNAPSHOT.jar

# cd /opt/app
WORKDIR /opt/app

# cp target/spring-boot-web.jar /opt/app/app.jar
COPY ${JAR_FILE} app.jar

# java -jar /opt/app/app.jar
ENTRYPOINT ["java","-jar","app.jar"]

# Meu repositorio no docker hub
# https://hub.docker.com/u/fernandoguide

## comando para colocar a tag na img
## sudo docker build -t name:tag .

## criando a build e  colocando a tag no container
## sudo docker build -t spring-boot-mongodb-crud:1.0 .

# $ docker login
# <enter user name and password for Docker Hub Repository>

# $ docker tag first-image {docker-hub-username}/{default-repo-folder-name}:first-image
# sudo docker tag [ID IMAGEM] fernandoguide/docker-image:spring-boot-mongodb-crud
# sudo docker tag 6a73ddec31bf fernandoguide/docker-image:latest

# $ sudo docker push {docker-hub-username}/{default-repo-folder-name}:first-image

## comando para rodar a imagem gerada
## sudo docker run -d -p 8080:8080 -t spring-boot-mongodb-crud:1.0

# $ sudo docker image tag spring-boot:1.0 your_id/spring-boot:1.0
# $ sudo docker image push your_id/spring-boot:1.0

# In production server.
# $ sudo docker pull your_id/spring-boot:1.0
# $ sudo docker run -d -p 80:8080 -t spring-boot:1.0

## sudo docker run -p 8080:8080 -t docker-spring-boot:1.0
## sudo docker run -p 80:8080 -t docker-spring-boot:1.0
## sudo docker run -p 443:8443 -t docker-spring-boot:1.0


# https://spring.io/guides/gs/spring-boot-docker/

# $ docker build -t springio/gs-spring-boot-docker .
# $ docker run -p 8080:8080 springio/gs-spring-boot-docker

# FROM openjdk:8-jdk-alpine
# RUN addgroup -S spring && adduser -S spring -G spring
# USER spring:spring
# ARG DEPENDENCY=target/dependency
# COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
# COPY ${DEPENDENCY}/META-INF /app/META-INF
# COPY ${DEPENDENCY}/BOOT-INF/classes /app
# ENTRYPOINT ["java","-cp","app:app/lib/*","hello.Application"]

# $ sudo docker run -e "SPRING_PROFILES_ACTIVE=prod" -p 8080:8080 -t springio/gs-spring-boot-docker
# $ sudo docker run -e "SPRING_PROFILES_ACTIVE=dev" -p 8080:8080 -t springio/gs-spring-boot-docker
# $ sudo docker run -e "JAVA_TOOL_OPTIONS=-agentlib:jdwp=transport=dt_socket,address=5005,server=y,suspend=n" -p 8080:8080 -p 5005:5005 -t springio/gs-spring-boot-docker

# sudo docker save [nomedaimagem] > /tmp/meu_web_server.tar
# sudo docker save a7a67c95e831 > /tmp/mysql.tar


# docker run --name [usuario] -e MYSQL_ROOT_PASSWORD=[senha] -d mysql:latest


# Hosting some simple static content
# $ docker run --name some-nginx -v /some/content:/usr/share/nginx/html:ro -d nginx
# Alternatively, a simple Dockerfile can be used to generate a 
# new image that includes the necessary content (which is a much cleaner solution than the bind mount above):

# FROM nginx
# COPY static-html-directory /usr/share/nginx/html
# Place this file in the same directory as your directory of content
#  ("static-html-directory"), run docker build -t some-content-nginx ., then start your container:

# $ docker run --name some-nginx -d some-content-nginx
# Exposing external port
# $ docker run --name some-nginx -d -p 8080:80 some-content-nginx
# Then you can hit http://localhost:8080 or http://host-ip:8080 in your browser.