FROM ubuntu:22.04

RUN apt update && apt upgrade -y && apt install -y cron && rm -rf /var/lib/apt/lists/*

RUN echo "* */1 * * * echo '1' >> /var/log/test.log" | crontab -

CMD ["/bin/bash", "-c", "cron && touch /var/log/test.log && tail -f /var/log/test.log"]