FROM ubuntu:xenial

MAINTAINER The GAP Group <support@gap-system.org>

RUN    dpkg --add-architecture i386 \
    && apt-get update -qq \
    && apt-get -qq install -y build-essential m4 libreadline6-dev libncurses5-dev wget \
                              unzip libgmp3-dev cmake gcc-multilib gcc-5 g++-5 gcc-5-multilib sudo \
    && adduser --quiet --shell /bin/bash --gecos "GAP user,101,," --disabled-password gap \
    && adduser gap sudo \
    && chown -R gap:gap /home/gap/ \
    && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
    && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 60 \
    && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 60 \
    && cd /home/gap \
    && touch .sudo_as_admin_successful \
    && mkdir -p /home/gap/inst \
    && cd /home/gap/inst \
    && wget https://www.gap-system.org/pub/gap/gap4core/gap4r8p9_nopackages.zip \
    && unzip gap4r8p9_nopackages.zip \
    && rm gap4r8p9_nopackages.zip \
    && cd gap4r8 \
    && wget https://www.gap-system.org/Manuals/gap-4.8.9-manuals.tar.gz \
    && tar xvzf gap-4.8.9-manuals.tar.gz \
    && rm gap-4.8.9-manuals.tar.gz \
    && ./configure --with-gmp=system \
    && make \
    && cp bin/gap.sh bin/gap \
    && mkdir pkg \
    && cd pkg \
    && wget https://www.gap-system.org/pub/gap/gap4pkgs/packages-required-stable-v4.8.9.tar.gz \
    && tar xvzf packages-required-stable-v4.8.9.tar.gz \
    && rm packages-required-stable-v4.8.9.tar.gz \
    && chown -R gap:gap /home/gap/inst

# Set up new user and home directory in environment.
# Note that WORKDIR will not expand environment variables in docker versions < 1.3.1.
# See docker issue 2637: https://github.com/docker/docker/issues/2637
USER gap
ENV HOME /home/gap
ENV GAP_HOME /home/gap/inst/gap4r8
ENV PATH ${GAP_HOME}/bin:${PATH}

# Start at $HOME.
WORKDIR /home/gap

# Start from a BASH shell.
CMD ["bash"]
