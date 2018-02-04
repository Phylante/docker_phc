FROM debian:jessie
RUN Deps='libevent-dev libssl-dev libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev libminiupnpc-dev libzmq3-dev libdb-dev libboost-all-dev libqrencode-dev libgmp3-dev libminiupnpc-dev libcurl4-openssl-dev libdb++-dev' \
    buildDeps='ca-certificates build-essential libtool autotools-dev automake pkg-config bsdmainutils wget git' \
    DB4DIR="/usr/local/db4" \
    DB4VERSION="db-4.8.30.NC" \
    DB4FILE=$DB4VERSION".tar.gz" \
    DB4URL="http://download.oracle.com/berkeley-db/"$DB4FILE \
    DB4HASH=12edc0df75bf9abd7f82f821795bcee50f42cb2e5f76a6a281b85732798364ef \
    && set -x \
    && set -e \
    && apt-get update -y && apt-get install -y $buildDeps $Deps --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \

    && wget $DB4URL \
    && echo "$DB4HASH $DB4FILE" | sha256sum -c - \
    && tar -xzvf $DB4FILE \
    && cd $DB4VERSION"/build_unix/" \
    && ../dist/configure --enable-cxx --disable-shared --with-pic --prefix=$DB4DIR \
    && mkdir -p $DB4DIR \
    && make install \
    && cd ../../ \
    && rm $DB4FILE \
    && rm -rf $DB4VERSION
RUN USE_UPNP=1 \
    && git clone https://github.com/BiznatchEnterprises/phc.git \
    && cd phc/src \
    && make -j4 -f makefile.unix \ 
#    && make install \
    && cd .. \
#    && rm -rf phc \
    && apt-get purge -y --auto-remove $buildDeps

CMD ["/phc_data/entrypoint.sh"]

