# who2f2b.sh
Ban the entire Network-Range associated to all banned IPs seen in the /var/log/fail2ban.log file!

Note: this is quite a dangerous script when used, as you can potetially lock your entire network range out, if co-workers or associates in the same network range as you get banned by f2b.

Ever wanted to ban entrie subnet of all the IP's that continually try to hack your server through ssh port.

Then this script will go a little way in banning the entire range, after extrapolating which IPs have been banned by fail2ban.  A simple transpose IP to corresponding network range is done.

Still work in progress, so its will have some bugs.

Tested on Ubuntu 20.04

# Latest script
 - who2f2b-v3.sh - works fine and tested 2.8.2021 on ubuntu 20.04
 - who2f2b-v2.sh - not working
 - who2f2b.sh - not working
 
# WARNING

Test script on non-production/development server, to avoid screwing up big time if script fails in some way.

Use at your own risk, ensure you add your IP to ingore list to avoid locking yourself out of your ssh console session on the server if things screw up while using this script/fail2ban.

# steps

1. chmod +x who2f2b.sh # to make it executable
2. change F2b log location to part actual fail2ban.log containing all BAN instances.
3. bash who2f2b.sh # to exceute, there is a delay of 5secs for each whois to avoid flood

# Thanks

Thanks goes out to whois.cymru.com for providing a fantastic tool to whois IP for the entire network ranges!

# Update 4th Aug 2021

-Stats

In the space of 48-hours running this script through cron once a night, these are the stats:

Currently banned:	783 of which 330 are entire subnet bans!


**Todo**
- [ ] Add a country filter, so only ban subnets from list of countries you provide!
- [ ] Figure out why f2b is banning 0.0.0.0 (not to be mistaken by 0.0.0.0/0 which will ban everything)

