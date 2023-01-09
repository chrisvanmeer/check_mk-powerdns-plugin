# PowerDNS check for CheckMK

Two PowerDNS plugins for CheckMK.  
  
In two separate formats, depending on what you would like:

1. Custom check (see directory `custom/`)
2. Local check (see directory `local/`)

With a local check, you only have to place the files on the monitored host(s). If your host is down however, your check will also not be visible within CheckMK. A custom check registers the service within CheckMK itself.

The `health` plugin does a basic health check by performing a `pdns_control rping`.  
The `security` plugindoes a `TXT` lookup with `dig` at powerdns.com to verify the status of the installed version. See [this article](https://blog.powerdns.com/2014/10/22/powerdns-security-status-polling/) explaining the mechanism.

## Installation instructions

### Custom check

These instructions are only for the custom checks found under `custom/`.

#### Health

1. Place the `health/powerdns_health.sh` file in `/urs/lib/check_mk_agent/plugins/` of your PowerDNS server(s) and make it executable.
2. Run the script manually from the directory above.
3. Run the command `check_mx_agent | grep -A1 '^<<<powerdns_health'` and look for the expected output.
4. Log onto the Check_MK server and do a `su - <site>`. Test the plugin with `cmk -d <servername> | grep -A1 '^<<<powerdns_health'` which should give you the same results as step 3.
5. Copy the `health/powerdns_health.py` file to `local/lib/check_mk/base/plugins/agent_based/` of your Check_MK server under your `<site>` user.
6. Now do a service discovery on your host(s) and you should see the PowerDNS service pop up.

#### Security

1. Place the `security/powerdns_security.sh` file in `/urs/lib/check_mk_agent/plugins/` of your PowerDNS server(s) and make it executable.
2. Run the script manually from the directory above.
3. Run the command `check_mx_agent | grep -A1 '^<<<powerdns_security'` and look for the expected output.
4. Log onto the Check_MK server and do a `su - <site>`. Test the plugin with `cmk -d <servername> | grep -A1 '^<<<powerdns_security'` which should give you the same results as step 3.
5. Copy the `security/powerdns_security.py` file to `local/lib/check_mk/base/plugins/agent_based/` of your Check_MK server under your `<site>` user.
6. Now do a service discovery on your host(s) and you should see the PowerDNS service pop up.

### Local check

These instructions are only for the local checks found under `local/`.

1. Copy the files to `/usr/lib/check_mk_agent/local/` and do a `chmod +x` on these files.
2. Either run the agent check manually (`check_mx_agent` and watch for `<<<local`) or wait until a scheduled run has finished.
3. Do a service discovery on your host(s) and you should see the checks appear in the Undecided section.

Enjoy.  
Chris
