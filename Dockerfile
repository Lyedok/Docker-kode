FROM ubuntu:22.04

RUN apt update && apt upgrade -y && apt install -y cron && rm -rf /var/lib/apt/lists/*

RUN touch /var/log/test.log \
    && touch /etc/cron.d/test \
    && echo "*/1 * * * * echo '1' >> /var/log/test.log" >> /etc/cron.d/test

CMD cron && tail -f /var/log/test.log