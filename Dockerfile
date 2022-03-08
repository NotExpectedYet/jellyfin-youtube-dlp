FROM jellyfin/jellyfin:unstable
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y
RUN apt-get install -y gpg-agent wget python3 python3-pip
RUN wget -qO - https://repositories.intel.com/graphics/intel-graphics.key | apt-key add -
RUN echo 'deb [arch=amd64] https://repositories.intel.com/graphics/ubuntu focal main' >> /etc/apt/sources.list
RUN wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O /usr/local/bin/yt-dlp
RUN apt-get update -y
RUN apt-get install --only-upgrade -y libnvidia-encode-460-server libnvidia-decode-460-server
RUN apt-get remove gpg-agent wget -y
RUN apt-get upgrade -y
RUN apt-get clean -y
RUN chmod a+rx /usr/local/bin/yt-dlp
