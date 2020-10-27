#Build:
#   	sudo docker build -t "sight:9.0-devel-ubuntu16.04" .
#Run:
#	sudo nvidia-docker run -it -p 9002:9002 sight:9.0-devel-ubuntu16.04 bash
 


FROM ubuntu:18.04  

LABEL maintainer "Benjha"

RUN apt-get update && apt-get install -y --no-install-recommends \
        ca-certificates \
        git \
        g++ \
	vim \
        curl \
        git \
        make libtool autotools-dev automake autoconf\
	openssh-client &&\
        rm -rf /var/lib/apt/lists/*


RUN echo $HOME

RUN git clone https://github.com/esnet/iperf.git &&\
        cd iperf &&\
        ./bootstrap.sh &&\
        ./configure &&\
        ls &&\
        make &&\
        make install

ENV LD_LIBRARY_PATH /usr/local/lib

RUN echo hostname
EXPOSE 23232
ENTRYPOINT ["iperf3"]
#RUN iperf3 -s -p 23232 
