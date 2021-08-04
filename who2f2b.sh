
#!/bin/bash
# file: who2f2b.sh - v1.3
# Source: $me
# Credits: <jochum> libera.chat irc (2.8.2021)
# Date: April 8th 2021 at CET 18:11
# Description: zgrep fail2ban logs for any ban 2nd or 3rd octecs and compress older log

ips=$(awk '($(NF-1) = /Ban/){print $NF}' /opt/log/fail2ban.log | sort | uniq | sort -n)

for i in ${ips};
do
    ban=$(whois -h v4.whois.cymru.com " -c -p ${i}" | awk 'NR!=1{print $5}')
    sleep 2
    sudo fail2ban-client set sshd banip "${ban}";
    #echo "sudo fail2ban-client set sshd banip ${ban}";
done
service fail2ban reload

