#!/bin/sh
#
#
#sed -i "1i LogFile=/tmp/zabbix_agentd.log \nServer=$ZABBIX_Server \nServerActive=$ZABBIX_ServerActive \nHostname=$ZABBIX_Hostname \nDebugLevel=$ZABBIX_DebugLevel" /etc/zabbix/zabbix_agentd.conf
#printf "PGHOST=$ZABBIX_PGSQL_PGHOST \nPGPORT=$ZABBIX_PGSQL_PGPORT \nPGROLE=$ZABBIX_PGSQL_PGROLE \nPGDATABASE=$ZABBIX_PGSQL_PGDATABASE" > /usr/local/etc/pgsql_funcs.conf

printf "LogFile=/tmp/zabbix_agentd.log \
 \nServer=$ZABBIX_Server \
 \nServerActive=$ZABBIX_ServerActive \
 \nHostname=$ZABBIX_Hostname \
 \nDebugLevel=$ZABBIX_DebugLevel \
 \nInclude=/etc/zabbix/zabbix_agentd.d/*.conf \
 \nLogType=$ZABBIX_LogType" > /etc/zabbix/zabbix_agentd.conf


#printf "$ZABBIX_PGSQL_PGHOST:$ZABBIX_PGSQL_PGPORT:$ZABBIX_PGSQL_PGDATABASE:$ZABBIX_PGSQL_PGROLE:$PSQL_PASSWORD" > ~/.pgpass
#chmod 600 ~/.pgpass

#mkdir /home/zabbix
#printf "$ZABBIX_PGSQL_PGHOST:$ZABBIX_PGSQL_PGPORT:$ZABBIX_PGSQL_PGDATABASE:$ZABBIX_PGSQL_PGROLE:$PSQL_PASSWORD" > /home/zabbix/.pgpass
#chmod 600 /home/zabbix/.pgpass
#chown -hR zabbix:zabbix /home/zabbix

#mkdir /var/lib/zabbix
#printf "$ZABBIX_PGSQL_PGHOST:$ZABBIX_PGSQL_PGPORT:$ZABBIX_PGSQL_PGDATABASE:$ZABBIX_PGSQL_PGROLE:$PSQL_PASSWORD" > /var/lib/zabbix/.pgpass
chmod 600 /var/lib/zabbix/.pgpass
chown -hR zabbix:zabbix /var/lib/zabbix
zabbix_agentd -f

#cat /etc/zabbix/zabbix_agentd.conf >&2
# cat /tmp/zabbix_agentd.log >&2