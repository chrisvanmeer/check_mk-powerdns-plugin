# PowerDNS check for Check_MK

This is a simple plugin that will test if the PowerDNS is running by using the `pdns_control rping` command.

## Usage

1. Place the `check_powerdns` file in `/urs/lib/check_mk_agent/plugins/` of your PowerDNS server(s) and make it executable.
2. Run the script manually from the directory above.
3. Run the command `check_mx_agent | grep -A1 '^<<<powerdns>>>'` and look for the expected output.
4. Log onto the Check_MK server and do a `su - <site>`. Test the plugin with `cmk -d <servername> | grep -A1 '^<<<powerdns>>>'` which should give you the same results as step 3.
5. Copy the `powerdns.py` file to `local/lib/check_mk/base/plugins/agent_based/` of your Check_MK server under your `<site>` user.
6. Now do a service discovery on your host(s) and you should see the PowerDNS service pop up.

Enjoy.
