FROM debian:sid

RUN set -ex \
    && apt update -y \
    && apt upgrade -y \
    && apt install -y wget \
    && apt install -y nginx \
    && apt autoremove -y \
    && mkdir -p /wwwroot

COPY conf/ /conf
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

CMD /entrypoint.sh
