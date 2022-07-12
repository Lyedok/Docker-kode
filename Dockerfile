FROM ubuntu:22.04

RUN apt update && apt upgrade -y && apt install -y cron && rm -rf /var/lib/apt/lists/*

RUN touch /var/log/test.log \
    && echo "*/1 * * * * echo '1' >> /var/log/test.log" | crontab -

CMD ["/bin/bash", "cron && : >> /var/log/test.log && tail -f /var/log/test.log"]