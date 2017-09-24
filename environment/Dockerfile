# OSはCentOS
FROM centos:latest

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

# # pipインストール(最新版)
# RUN wget https://bootstrap.pypa.io/get-pip.py
# RUN python get-pip.py
#
# # readlineインストール
# RUN pip install readline
#
# # virtualenvインストール
# RUN pip install virtualenv
#
# # Djangoインストール
# RUN pip install django
#
# # おまけ
# # Django以外のフレームワークインストール
# bottleインストール
# RUN pip install bottle
#
# # Flaskインストール
# RUN pip install Flask


ARG USERNAME=USERNAME
ARG USERID=USERID
ARG PROJECT_NAME=PROJECT_NAME

RUN adduser --uid ${USERID} ${USERNAME}
USER ${USERNAME}
WORKDIR /home/${USERNAME}

RUN pip3.6 install virtualenv --user
RUN python -m venv venv
RUN source venv/bin/activate
# RUN sed "s/,/\n/g" "${REQUIREMENTS}" > requirements.txt
# RUN pip3.6 install -r requirements.txt


CMD ["/bin/bash"]
