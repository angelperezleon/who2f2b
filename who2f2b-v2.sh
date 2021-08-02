
#!/bin/bash
# file: whois2f2b.sh
# Source: $me
# Date: April 8th 2021 at CET 18:11
# Description: zgrep fail2ban logs for any ban 2nd or 3rd octecs and compress older log

#find all banned ips by
#zgrep -h "Ban " /var/log/fail2ban.log* | awk '{print $NF}' | sort | uniq -c

awk '($(NF-1) = /Ban/){print $NF}' /opt/log/fail2ban.log | sort | uniq | sort -n >ips.txt

#for i in $(cat ips.txt); do whois .... -p $i; done
##for i in $(cat ips.txt); do whois -h v4.whois.cymru.com " -c -p $i" | awk 'NR!=1{print $NF}' | sort | uniq -c;
#awk 'NR!=1{print $4}';
#echo $1;
##sleep 5;
##done

#for i in $NF ; do whois -h v4.whois.cymru.com " -c -p $NF" >netipbans.txt; done

#whois -h v4.whois.cymru.com " -c -p 103.100.208.50" | awk 'NR!=1{print $5}'

#for i in $(cat ips.txt); do whois .... -p $i; done
#below works
#####whois -h v4.whois.cymru.com " -c -p 103.100.208.50"  | awk 'NR!=1{print $5}'
#bove works

#for i in $(cat ips.txt); do whois -h v4.whois.cymru.com " -c -p $i";

for i in $(cat ips.txt); do whois -h v4.whois.cymru.com " -c -p $i" >ip2ban.txt;
awk 'NR!=1{print $5}' ip2ban.txt;
echo $ban;
print $ban;
sleep 5;
sudo fail2ban-client set sshd banip $ban;
done
