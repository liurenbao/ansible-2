FROM 192.168.160.47:8888/plantu/plantu_centos_base:latest
WORKDIR /
RUN rm -rf /opt/ansible
RUN yum clean all
ENV JAVA_HOME=/opt/soft/jdk-10.0.2
ENV PATH=$PATH:$JAVA_HOME/bin