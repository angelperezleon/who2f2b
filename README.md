# who2f2b.sh
Ban the entire Network-Range associated to all banned fail2ban IPs seen in the /var/log/fail2ban.log file!

Note: this is quite a dangerous script when used, as you can potetially lock your entire network range if co-workers or associates in same network get banned by f2b.

Ever wanted to ban entrie subnet of all the IP's that continually try to hack your server through ssh port.

Then this script will go a little way in banning the entire range, after extrapolating what abnned IP are already set by fail2ban.

Still work in progress, so its will have bugs.

Tested on Ubuntu 20.04


# WARNING

Test script on non-production/development server, to avoid screwing up big time if script fails in some way.

Use at your own risk, ensure you add your IP to ingore list to avoid locking yourself out of your ssh console session on the server if things screw up while using this script/fail2ban.

# steps

1. chmod +x who2f2b.sh # to make it executable
2. change F2b log location to part actual fail2ban.log containing all BAN instances.
3. bash who2f2b.sh # to exceute, there is a deley of 5secs for each whois to avoid flood

# Thanks

Thanks goes out to whois.cymru.com for providing a fantastic tool to whois IP for the entire network ranges!

**Todo**
- [] Add a country filter, so only ban subnet from list of countries you provide!
