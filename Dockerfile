FROM ubuntu

RUN apt-get update && apt-get -y upgrade && apt-get -y install build-essential curl default-jre python && mkdir /var/tools

WORKDIR /var/tools

RUN curl https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu-rm/7-2017q4/gcc-arm-none-eabi-7-2017-q4-major-linux.tar.bz2 > arm_tools.tar.bz2 && \
  bunzip2 arm_tools.tar.bz2 && tar -xvf arm_tools.tar && mv gcc-arm-none-eabi-7-2017-q4-major gcc-arm && rm arm_tools.tar

ENV PATH="/var/tools/gcc-arm/bin:${PATH}"