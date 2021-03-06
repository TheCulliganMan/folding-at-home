FROM nvidia/opencl:runtime-ubuntu16.04
LABEL maintainer="rrculligan@gmail.com"

ENV FAH_VERSION_MINOR=7.5.1
ENV FAH_VERSION_MAJOR=7.5

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install --no-install-recommends -y \
        curl adduser bzip2 ca-certificates ocl-icd-opencl-dev &&\
        curl -o /tmp/fah.deb https://download.foldingathome.org/releases/public/release/fahclient/debian-stable-64bit/v${FAH_VERSION_MAJOR}/fahclient_${FAH_VERSION_MINOR}_amd64.deb &&\
        mkdir -p /etc/fahclient/ &&\
        touch /etc/fahclient/config.xml &&\
        dpkg --install /tmp/fah.deb &&\
        apt-get remove -y curl &&\
        apt-get autoremove -y &&\
        apt-get clean &&\
        rm --recursive --verbose --force /tmp/* /var/log/* /var/lib/apt/

# Web viewer
EXPOSE 7396

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ENTRYPOINT ["FAHClient", "--web-allow=0/0:7396", "--allow=0/0:7396"]


