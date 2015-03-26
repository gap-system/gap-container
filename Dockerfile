FROM ubuntu:utopic

MAINTAINER GAP Project

RUN sudo apt-get update -qq && sudo apt-get -qq install -y build-essential wget \
    && wget http://www.gap-system.org/pub/gap/gap47/tar.gz/gap4r7p7_2015_02_13-15_29.tar.gz \
    && tar xvzf gap4r7p7_2015_02_13-15_29.tar.gz \
    && cd ace \
    && ./configure ../.. \
    && make \
    && cd ../anupq* \
    && ./configure \
    && make \
    && cd ../atlasrep \
    && chmod 1777 datagens dataword \
    && cd ../Browse \
    && ./configure \
    && make \
    && cd ../carat \
    && tar xzpf carat-2.1b1.tgz \
    && rm -f bin \
    && ln -s carat-2.1b1/bin bin \
    && cd carat-2.1b1/functions \
    && tar xzpf gmp-*.tar.gz \
    && cd .. \
    && make TOPDIR=`pwd` Links \
    && make TOPDIR=`pwd` Gmp \
    && make TOPDIR=`pwd` CFLAGS=`-O2` \
    && cd ../../cohomolo \
    && ./configure \
    && cd standalone/progs.d \
    && cp makefile.orig makefile \
    && cd ../.. \
    && make \
    && cd ../cvec-* \
    && ./configure \
    && make \
    && cd ../edim \
    && ./configure \
    && make \
    && cd ../example \
    && ./configure ../.. \
    && make \
    && cd ../float-* \
    && ./configure \
    && make \
    && cd ../fplsa \
    && ./configure ../.. \
    && make CC="gcc -O2 " \
    && cd .. \
    && cd Gauss \
    && ./configure \
    && make \
    && cd ../grape \
    && ./configure ../.. \
    && make \
    && cd ../guava* \
    && ./configure ../.. \
    && make \
    && make install \
    && cd ../cd io-* \
    && ./configure \
    && make \
    && cd ../json-* \
    && ./configure \
    && make \
    && cd ../kbmag \
    && make clean \
    && ./configure ../.. \
    && make COPTS="-O2 -g" \
    && cd ../linboxing \
    && ./configure \
    && make \
    && cd ../nq-* \
    && ./configure \
    && make \
    && cd ../orb-* \
    && ./configure \
    && make \
    && cd ../pargap \
    && ./configure ../.. \
    && make \
    && cp bin/pargap.sh ../../bin/ \
    && cd .. \
    && rm -f ALLPKG \
    && cd PolymakeInterface \
    && ./configure ../.. \
    && make \
    && cd ../xgap \
    && ./configure \
    && make \
    && rm -f ../../bin/xgap.sh \
    && cp bin/xgap.sh ../../bin/ \
    && cd .. \
