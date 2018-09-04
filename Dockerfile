# docker build -t megaminer .
# docker run -it megaminer megaminer --address <your wallet address> --threads 16

FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install git gcc g++

WORKDIR /

RUN git clone https://github.com/VeldsparCrypto/megaminer.git

WORKDIR megaminer

RUN gcc -pthread ./src/main.c -o ./megaminer

RUN mv megaminer mm

ENTRYPOINT ["/bin/bash", "-c", "/megaminer/./mm --address VE39KY7txKFZS6RswWYfGTw97E9QArgiamnXmCzGvNtp2a --threads 1"]
