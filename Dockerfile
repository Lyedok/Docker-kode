FROM centos:7
RUN yum update -y && yum install -y cron && yum clean all
RUN touch /var/log/test.log \
    && touch /etc/cron.d/test \
    && echo "*/1 * * * * echo '1' >> /var/log/test.log" >> /etc/cron.d/test