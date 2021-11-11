FROM 192.168.160.47:8888/public/primetoninc/jdk:1.8
LABEL maintainer="mouyongde"
RUN mkdir -p /app/uoamp
COPY application.yml /app/uoamp/application.yml
COPY application-alarmdesc.yml /app/uoamp/application-alarmdesc.yml
COPY hisi-uoamp-monitor-server-1.0-SNAPSHOT.jar /app/uoamp/uoamp.jar
ENV  LANG="en_US.UTF-8"
ENTRYPOINT ["java","-jar","/app/uoamp/uoamp.jar","--spring.config.location=/app/uoamp/application.yml,/app/uoamp/application-alarmdesc.yml"]
