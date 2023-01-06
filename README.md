# PowerDNS check for CheckMK

Two PowerDNS plugins for CheckMK.  
  
The `health` plugin does a basic health check by performing a `pdns_control rping`.  
The `security` plugindoes a `TXT` lookup with `dig` at powerdns.com to verify the status of the installed version.   See [this article](https://blog.powerdns.com/2014/10/22/powerdns-security-status-polling/) explaining the mechanism.

## Installation instructions

### Health

1. Place the `health/powerdns_health.sh` file in `/urs/lib/check_mk_agent/plugins/` of your PowerDNS server(s) and make it executable.
2. Run the script manually from the directory above.
3. Run the command `check_mx_agent | grep -A1 '^<<<powerdns_health'` and look for the expected output.
4. Log onto the Check_MK server and do a `su - <site>`. Test the plugin with `cmk -d <servername> | grep -A1 '^<<<powerdns_health'` which should give you the same results as step 3.
5. Copy the `health/powerdns_health.py` file to `local/lib/check_mk/base/plugins/agent_based/` of your Check_MK server under your `<site>` user.
6. Now do a service discovery on your host(s) and you should see the PowerDNS service pop up.

### Security

1. Place the `security/powerdns_security.sh` file in `/urs/lib/check_mk_agent/plugins/` of your PowerDNS server(s) and make it executable.
2. Run the script manually from the directory above.
3. Run the command `check_mx_agent | grep -A1 '^<<<powerdns_security'` and look for the expected output.
4. Log onto the Check_MK server and do a `su - <site>`. Test the plugin with `cmk -d <servername> | grep -A1 '^<<<powerdns_security'` which should give you the same results as step 3.
5. Copy the `security/powerdns_security.py` file to `local/lib/check_mk/base/plugins/agent_based/` of your Check_MK server under your `<site>` user.
6. Now do a service discovery on your host(s) and you should see the PowerDNS service pop up.

Enjoy.  
Chris
