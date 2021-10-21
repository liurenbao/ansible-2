FROM openjdk:10.0.2 as jdk-stage

FROM mcr.microsoft.com/dotnet/runtime:3.1 as run-stage
COPY --from=jdk-stage /docker-java-home/ /docker-java-home/
ENV JAVA_VERSION=10.0.2
ENV JAVA_HOME=/docker-java-home
ENV LANG=C.UTF-8
ENV PATH=$PATH:$JAVA_HOME/bin
ADD sources.list /etc/apt/sources.list
#RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 40976EAF437D05B5 3B4FE6ACC0B21F32
#RUN apt update
#RUN apt install libtinfo5 -y
#RUN apt install unixodbc unixodbc-dev -y

