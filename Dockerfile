FROM centos:centos7



ADD ./build-artifacts.sh /usr/bin/build-artifacts.sh
ADD ./compile-docker /usr/bin/compile-docker
ADD ./cleanup-dockers.sh /usr/bin/compile-docker.sh
ADD ./compile-platform.sh /usr/bin/compile-platform.sh
ADD ./Dockerfile.centos7 /usr/bin/Dockerfile.centos7
RUN \
    chmod +x /usr/bin/build-artifacts.sh && \
    chmod +x /usr/bin/compile-docker.sh && \
    chmod +x /usr/bin/cleanup-dockers && \
    chmod +x /usr/bin/compile-platform.sh && \
    bash /usr/bin/build-artifacts.sh centos7 0.14.0 /dockerout/centos7












ENV JAVA_VERSION 8u31
ENV BUILD_VERSION b13

RUN yum -y upgrade
RUN yum -y install \
      automake \
      curl \
      cmake \
      openssl-devel \
      file \
      gcc \
      gcc-c++ \
      git \
      kernel-devel \
      libunwind-devel \
      libtool \
      make \
      patch \
      python \
      python-devel \
      python-setuptools \
      zip \
      unzip \
      wget \
      which

RUN wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/$JAVA_VERSION-$BUILD_VERSION/jdk-$JAVA_VERSION-linux-x64.rpm" -O /tmp/jdk-8-linux-x64.rpm

RUN yum -y install /tmp/jdk-8-linux-x64.rpm

RUN alternatives --install /usr/bin/java jar /usr/java/latest/bin/java 200000
RUN alternatives --install /usr/bin/javaws javaws /usr/java/latest/bin/javaws 200000
RUN alternatives --install /usr/bin/javac javac /usr/java/latest/bin/javac 200000

ENV JAVA_HOME /usr/java/latest

RUN wget -O /tmp/bazel.sh https://github.com/bazelbuild/bazel/releases/download/0.1.2/bazel-0.1.2-installer-linux-x86_64.sh \
      && chmod +x /tmp/bazel.sh \
      && /tmp/bazel.sh

ADD bazelrc /root/.bazelrc
ADD compile-platform.sh /compile-platform.sh
