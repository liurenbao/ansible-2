FROM 10.12.107.150:80/public/primetoninc/jdk:1.8
LABEL maintainer="mouyongde"
RUN mkdir -p /app/uoamp
#COPY application.yml /app/uoamp/application.yml
#COPY application-alarmdesc.yml /app/uoamp/application-alarmdesc.yml
COPY hisi-uoamp-monitor-server-1.0-SNAPSHOT.jar /app/uoamp/uoamp.jar
ENV  LANG="en_US.UTF-8"
ENTRYPOINT ["java","-jar","/app/uoamp/uoamp.jar"]
