# who2f2b.sh
whois all banned fail2ban IPs and add the entire subnet to firewall!

Ever wanted to ban entrie subnet of all the IP's that continually try to hack your server through ssh port.

Then this script will go a little way in banning the entire range, after extrapolating what abnned IP are already set by fail2ban.

Still work in progress, so its will have bugs.

Tested on Ubuntu 20.04

Use at your own risk, ensure you add your IP to ingore list to avoid locking yourself out of your ssh console session on the server if things screw up while using this script/fail2ban.

