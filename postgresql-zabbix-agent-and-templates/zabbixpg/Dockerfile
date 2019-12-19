FROM ubuntu:18.04

RUN apt-get update
RUN apt-get -y install apt-utils
RUN apt-get -y install dialog
RUN apt-get install -y git

RUN apt-get -y install curl
RUN curl https://repo.zabbix.com/zabbix/4.4/ubuntu/pool/main/z/zabbix/zabbix-agent_4.4.3-1+bionic_amd64.deb -o zabbix-agent.deb
RUN apt-get -y install ./zabbix-agent.deb
RUN apt-get install -y postgresql-client

RUN mkdir /var/lib/zabbix
ADD postgresql /var/lib/zabbix
ADD postgresql/template_db_postgresql.conf /etc/zabbix/zabbix_agentd.d


RUN curl https://repo.zabbix.com/zabbix/4.4/ubuntu/pool/main/z/zabbix/zabbix-sender_4.4.3-1+bionic_amd64.deb  -o zabbix-sender.deb
RUN apt-get -y install ./zabbix-sender.deb

ADD .pgpass /var/lib/zabbix/

COPY ./entrypoint.sh entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]