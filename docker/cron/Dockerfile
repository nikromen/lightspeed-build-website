FROM registry.fedoraproject.org/fedora:38
MAINTAINER copr-devel@lists.fedorahosted.org

RUN dnf -y update && dnf -y install cronie tar && dnf clean all

RUN touch /var/log/cron.log

COPY --chmod=755 docker/cron/files/tar_persistent.sh /bin/tar_persistent

COPY --chmod=755 docker/cron/files/crontab_daily /etc/cron.d/crontab_daily

RUN crontab /etc/cron.d/crontab_daily
