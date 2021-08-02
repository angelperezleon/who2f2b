#!/bin/bash
# file: who2f2b.sh
# Source: $me
# Date: April 8th 2021 at CET 18:11
# Description: zgrep fail2ban logs for any ban 2nd or 3rd octecs and compress older log

# Paths for binary files
TAR="/bin/tar"
PGDUMP="/usr/bin/pg_dump"
MYSQLDUMP="/usr/bin/mysqldump"
GZIP="/bin/gzip"
SCP="/usr/bin/scp"
SSH="/usr/bin/ssh"
LOGGER="/usr/bin/logger"
RSYNC="/usr/bin/rsync"

#f2b log
F2B="/opt/log/fail2ban.log"
#F2B="/var/log/fail2ban.log"

# Compress old IP text files
${GZIP} ip-bans-*.txt
#${GZIP} ${BACKUP}/*.sql

# Store todays date
NOW=$(date +"%F")

awk '($(NF-1) = /Ban/){print $NF}' ${F2B} | sort | uniq -c | sort -u >ip-bans-$(date '+%Y-%m-%d_%H-%M-%S').txt
#awk '($(NF-1) = /Ban/){print $NF}' /var/log/fail2ban.log | sort | uniq -c | sort -u >ip-bans-$(date '+%Y-%m-%d_%H-%M-%S').txt

awk '{print $2}' ip-bans-*.txt
echo $ips
#print $ips

#
whois -h v4.whois.cymru.com " -c -p ips"  | awk 'NR!=1{print $3}' | echo $ban && sleep 5 && sudo fail2ban-client set sshd banip $ban

#while
#        whois -h v4.whois.cymru.com " -c -p ips"  | awk 'NR!=1{print $3}'
#        echo $ban
#        sudo fail2ban-client set sshd banip $ban
#        sleep 5
#done

service fail2ban restart
