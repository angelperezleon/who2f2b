# who2f2b.sh

Ban the entire Network-Range associated to all banned IPs seen in the /var/log/fail2ban.log file for failed ssh logins!

Note: this is quite a dangerous script when used, as you can potetially lock your entire network range out, if co-workers or associates in the same network range as you get banned by f2b.

Ever wanted to ban entrie subnet of all the IP's that continually try to hack your server through ssh port.

Then this script will go a little way in banning the entire range, after extrapolating which IPs have been banned by fail2ban.  A simple transpose IP to corresponding network range is done.

Still work in progress, so its will have some bugs.

Tested on Ubuntu 20.04.2 LTS (GNU/Linux 5.4.0-62-generic x86_64)

# WARNING

Test script on non-production/development server, to avoid screwing up big time if script fails in some way.

Use at your own risk, ensure you add your IP to ingore list to avoid locking yourself out of your ssh console session on the server if things screw up while using this script/fail2ban.

# steps

1. VERY IMPORTANT: Add your IP/Network to "ignoreip = " in/etc/fail2ban/jail.local setting file
2. service fail2ban reload
3. chmod +x who2f2b.sh # to make it executable
4. change F2b log location to part actual fail2ban.log containing all BAN instances.
5. bash who2f2b.sh # to exceute, there is a delay of 5secs for each whois to avoid flood

# Thanks

Thanks goes out to whois.cymru.com for providing a fantastic tool to whois IP for the entire network ranges!

# Update

- Stats 4th Aug 2021

 running this script through cron once a night, these are the stats:

 - In the space of 48-hours: Currently banned:	783 of which 330 are entire subnet bans!
 - & after 72hours: Currently banned:	938 of which 447 are entire subnet bans!
 
- Stats 12th Aug 2021 (after 8-days)
 - Currently banned:	3109 of which 1489 are entire subnet bans!

Using cmd: sudo fail2ban-client status sshd


**Todo**
- [ ] Add a country filter, so only ban subnets from list of countries you provide!
- [x] Figure out why f2b is banning 0.0.0.0 (not to be mistaken by 0.0.0.0/0 which will ban everything) - added an unban after each run

