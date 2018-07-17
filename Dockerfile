FROM ubuntu

RUN apt-get update && apt-get -y upgrade && apt-get -y install curl && mkdir /var/tools

WORKDIR /var/tools

RUN curl https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu-rm/6-2017q2/gcc-arm-none-eabi-6-2017-q2-update-linux.tar.bz2 > arm_tools.tar.bz2 && \
  bunzip2 arm_tools.tar.bz2 && tar -xvf arm_tools.tar && mv gcc-arm-none-eabi-6-2017-q2-update gcc-arm && rm arm_tools.tar

ENV PATH="/var/tools/gcc-arm/bin:${PATH}"