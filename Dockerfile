FROM ubuntu:utopic

MAINTAINER The GAP Group <support@gap-system.org>

RUN sudo apt-get update -qq \
    && sudo apt-get -qq install -y build-essential m4 libreadline6-dev libncurses5-dev wget unzip libgmp3-dev \
    && adduser --quiet --shell /bin/bash --gecos "GAP user,101,," --disabled-password gap \
    && adduser gap sudo \
    && chown -R gap:gap /home/gap/ \
    && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
    && mkdir -p /home/gap/inst \
    && cd /home/gap/inst \
    && wget http://www.gap-system.org/pub/gap/gap4core/gap4r7p8_nopackages.zip \
    && unzip gap4r7p8_nopackages.zip \
    && rm gap4r7p8_nopackages.zip \
    && cd gap4r7 \
    && ./configure --with-gmp=system \
    && make \
    && cp bin/gap.sh bin/gap \
    && mkdir pkg \
    && cd pkg \
    && wget http://www.gap-system.org/pub/gap/gap4pkgs/packages-required-stable-v4.7.8.tar.gz \
    && tar xvzf packages-required-stable-v4.7.8.tar.gz \
    && rm packages-required-stable-v4.7.8.tar.gz \
    && chown -R gap:gap /home/gap/inst

# Set up new user and home directory in environment.
# Note that WORKDIR will not expand environment variables in docker versions < 1.3.1.
# See docker issue 2637: https://github.com/docker/docker/issues/2637
USER gap
ENV HOME /home/gap
ENV GAP_HOME /home/gap/inst/gap4r7
ENV PATH ${GAP_HOME}/bin:${PATH}

# Start at $HOME.
WORKDIR /home/gap

# Start from a BASH shell.
CMD ["bash"]
