FROM centos:7
RUN yum update -y --nogpgcheck && yum install -y cronie && systemctl enable --now crond.service && yum clean all
RUN touch /var/log/test.log \
    && touch /etc/cron.d/test \
    && echo "*/1 * * * * echo '1' >> /var/log/test.log" >> /etc/cron.d/test 