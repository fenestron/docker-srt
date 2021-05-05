# SRT - https://github.com/Haivision/srt
#
#

FROM        alpine:3.13 AS base

RUN         apk add --no-cache --update ca-certificates libstdc++

############
# Build SRT.
FROM    base AS build

RUN     apk add --no-cache --update linux-headers curl cmake make g++ openssl-dev

ENV     VERSION=1.4.3
ENV     PREFIX=/usr/local

RUN \
        DIR=/tmp/srt && \
        mkdir -p ${DIR} && \
        cd ${DIR} && \
        curl -sLO https://github.com/Haivision/srt/archive/v${VERSION}.tar.gz && \
        tar -xz --strip-components=1 -f v${VERSION}.tar.gz && \
        cmake -DCMAKE_INSTALL_PREFIX="${PREFIX}" . && \
        make && \
        make install && \
        rm -rf ${DIR}


##########################
# Build the release image.
FROM        base AS release

ENV         LD_LIBRARY_PATH=/usr/local/lib:/usr/local/lib64

COPY --from=build /usr/local /usr/local
