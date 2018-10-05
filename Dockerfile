FROM debian

RUN apt-get update && apt-get dist-upgrade

RUN apt-get install -y procps wget curl build-essential unzip libgtk2.0-dev libcairo2-dev libpango1.0-dev libgdk-pixbuf2.0-dev libatk1.0-dev libghc-x11-dev gdb-minimal binutils-arm-none-eabi qemu-system-arm

RUN curl https://nim-lang.org/choosenim/init.sh -sSf | sh -s -- -y
ENV PATH /root/.nimble/bin:$PATH

COPY codeship-install-ultibo.sh .
RUN ./codeship-install-ultibo.sh

WORKDIR /workdir
COPY . .
