FROM debian
WORKDIR /workdir
COPY . .
RUN apt-get update && apt-get dist-upgrade
