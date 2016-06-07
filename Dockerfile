FROM centos:centos7



ADD ./build-artifacts.sh /usr/bin/build-artifacts.sh
ADD ./compile-docker.sh /usr/bin/compile-docker.sh
ADD ./cleanup-dockers.sh /usr/bin/compile-docker.sh
ADD ./compile-platform.sh /usr/bin/compile-platform.sh
ADD ./Dockerfile.centos7 /usr/bin/Dockerfile.centos7
RUN \
    chmod +x /usr/bin/build-artifacts.sh && \
    chmod +x /usr/bin/compile-docker.sh && \
    chmod +x /usr/bin/cleanup-dockers.sh && \
    chmod +x /usr/bin/compile-platform.sh
#RUN cd /usr/bin/
#RUN bash ./build-artifacts.sh centos7 0.14.0 /dockerout/centos7
#RUN bash /usr/bin/build-artifacts.sh centos7 0.14.0 /dockerout/centos7