FROM debian:buster

RUN apt update -y && \
    DEBIAN_FRONTEND=noninteractive apt install -y bsdmainutils gcc git lcab make dos2unix curl bzip2

RUN mkdir /build
COPY . orig
COPY build_shim MiraySoftwareAG2020.DER.cer sbat.miray.csv shim_miray.dbx /build/
    
WORKDIR /build

RUN chmod +x build_shim && \
    ./build_shim

WORKDIR /

RUN hexdump -Cv /orig/shim_mirayx64.efi > orig.hex && \
    hexdump -Cv /build/shim_mirayx64.efi > build.hex && \
    diff -u orig.hex build.hex
