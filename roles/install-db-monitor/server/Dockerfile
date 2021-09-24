FROM 192.168.160.47:8888/public/openjdk:8u292
LABEL maintainer="yangyang400@hisilicon.com"
WORKDIR /srv
COPY application.yml .
COPY application-alarmdesc.yml config/
COPY hisi-uoamp-monitor-server-1.0-SNAPSHOT.jar app.jar
CMD ["java","-jar","app.jar"]