# put your code in code/in.php
# run docker below and read the output in code/out.py
#
# docker build . -t php2py
# docker run \
# 	  --rm  \
# 	  --user $(id -u):$(id -g) \
#	  -v `pwd`/code/:/code \
#	  php2py


FROM ubuntu:14.04

ENV DEBIAN_FRONTEND=noninteractive 

RUN apt-get update 

RUN apt-get install -y \
  build-essential \
  libgc-dev \
  libboost1.55-all-dev \
  graphviz \
  autoconf \
  git \
  php8.1-cli

WORKDIR /opt

RUN git clone https://github.com/taichino/php2py 
RUN git clone https://github.com/pbiggar/phc

WORKDIR /opt/phc

RUN touch src/generated/* Makefile.in configure Makefile libltdl/aclocal.m4 libltdl/Makefile.in libltdl/configure libltdl/Makefile

RUN ./configure
RUN make -j4
RUN make install
RUN ldconfig

WORKDIR /opt/php2py
