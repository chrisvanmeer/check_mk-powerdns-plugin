from .agent_based_api.v1 import *

def discover_powerdns_security(section):
    yield Service()

def check_powerdns_security(section):
    for line in section:
        if line[0] == "3":
            yield Result(state=State.CRIT, summary="%s" % ' '.join(line[1:]))
            return
        elif line[0] == "2":
            yield Result(state=State.WARN, summary="%s" % ' '.join(line[1:]))
            return
    yield Result(state=State.OK, summary="%s" % ' '.join(line[1:]))

register.check_plugin(
    name = "powerdns_security",
    service_name = "PowerDNS Security",
    discovery_function = discover_powerdns_security,
    check_function = check_powerdns_security,
)
