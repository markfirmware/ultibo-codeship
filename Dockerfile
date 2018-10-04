FROM debian

RUN apt-get update && apt-get dist-upgrade

RUN apt-get install -y procps wget build-essential unzip libgtk2.0-dev libcairo2-dev libpango1.0-dev libgdk-pixbuf2.0-dev libatk1.0-dev libghc-x11-dev gdb-minimal binutils-arm-none-eabi

COPY codeship-install-ultibo.sh .
RUN ./codeship-install-ultibo.sh

RUN apt-get install -y qemu-system-arm

WORKDIR /workdir
COPY . .
