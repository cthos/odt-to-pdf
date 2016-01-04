FROM ubuntu:14.04

## Libreoffice and Apt
RUN apt-get update -y
RUN apt-get install libreoffice -y
RUN apt-get install build-essential wget -y

RUN mkdir /home/watchy
RUN mkdir /target

## FSWatch
RUN wget "https://github.com/emcrisostomo/fswatch/releases/download/1.7.0/fswatch-1.7.0.tar.gz" -O /home/watchy/fswatch.tar.gz
RUN cd /home/watchy && tar -xzvf fswatch.tar.gz
RUN mv /home/watchy/fswatch-1.7.0 /home/watchy/fswatch
RUN cd /home/watchy/fswatch && ./configure && make && make install
RUN ldconfig

## Watch Scripts
COPY watch.sh /home/watchy/watch.sh
COPY triggerwatch.sh /home/watchy/triggerwatch.sh
RUN chmod +x /home/watchy/triggerwatch.sh

WORKDIR '/home/watchy'
CMD /home/watchy/triggerwatch.sh