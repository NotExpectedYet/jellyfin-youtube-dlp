FROM jellyfin/jellyfin:unstable
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y
RUN apt-get install -y gpg-agent wget python3 python3-pip
RUN wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O /usr/local/bin/yt-dlp
RUN apt-get update -y
RUN apt-get remove gpg-agent wget -y
RUN apt-get upgrade -y
RUN apt-get clean -y
RUN chmod a+rx /usr/local/bin/yt-dlp
