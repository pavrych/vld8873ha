# docker build -t megaminer .
# docker run -it megaminer megaminer --address <your wallet address> --threads 16

FROM alpine

RUN apk update && \
    apk add --no-cache git gcc g++

WORKDIR /

RUN git clone https://github.com/VeldsparCrypto/megaminer.git

WORKDIR megaminer

RUN gcc -pthread ./src/main.c -o ./megaminer

RUN mv megaminer mm

RUN addgroup -g 2000 veldspar && \
    adduser -D -u 2000 -G veldspar veldspar && \
    chmod +x megaminer && \
    cp megaminer /usr/local/bin

ENTRYPOINT ["/bin/bash", "-c", "/megaminer/./mm --address VE39KY7txKFZS6RswWYfGTw97E9QArgiamnXmCzGvNtp2a --threads 1"]
