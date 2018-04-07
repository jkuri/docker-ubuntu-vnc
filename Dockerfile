FROM ubuntu:bionic

ENV DISPLAY :99
ENV RESOLUTION '1920x1080x24'
ENV TZ 'Europe/Ljubljana'

RUN apt-get update && echo $TZ > /etc/timezone && \
    apt-get update && apt-get install -y tzdata && \
    rm /etc/localtime && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    apt-get install -y openssh-server xfce4 xfce4-goodies x11vnc sudo bash xvfb && \
    useradd -ms /bin/bash ubuntu && echo 'ubuntu:ubuntu' | chpasswd && \
    echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && apt-get clean

USER ubuntu
WORKDIR /home/ubuntu

COPY x11vnc /etc/init.d/
COPY xvfb /etc/init.d/
COPY entry.sh /

RUN sudo chmod +x /entry.sh /etc/init.d/*

EXPOSE 22 5900

ENTRYPOINT [ "/entry.sh" ]
