# OSはCentOS
FROM centos:latest
# Pythonは公式イメージ
# FROM python:3.6

# 各パッケージをインストール
# pipやvirtualenvインストールも想定しています。
RUN yum -y install https://centos7.iuscommunity.org/ius-release.rpm
RUN yum -y update
RUN yum -y groupinstall "Development Tools"
RUN yum -y install \
           kernel-devel \
           kernel-headers \
           gcc-c++ \
           patch \
           libyaml-devel \
           libffi-devel \
           autoconf \
           automake \
           make \
           libtool \
           bison \
           tk-devel \
           zip \
           wget \
           tar \
           gcc \
           zlib \
           zlib-devel \
           bzip2 \
           bzip2-devel \
           readline \
           readline-devel \
           sqlite \
           sqlite-devel \
           openssl \
           openssl-devel \
           git \
           gdbm-devel \
           python36u \
           python36u-libs \
           python36u-devel \
           python36u-pip

RUN ln -s -f /usr/bin/python3.6 /usr/bin/python

ARG USERNAME=USERNAME
ARG USERID=USERID
ARG PROJECT_NAME=PROJECT_NAME

RUN adduser --uid ${USERID} ${USERNAME}
USER ${USERNAME}
WORKDIR /home/${USERNAME}
CMD ["/bin/bash"]

COPY "./requirements.txt" ./

# RUN pip3.6 install virtualenv --user
# RUN python -m venv venv
# RUN source venv/bin/activate
RUN pip3.6 install -r requirements.txt --user

EXPOSE 8000
