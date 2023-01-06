from .agent_based_api.v1 import *

def discover_powerdns(section):
    yield Service()

def check_powerdns(section):
    for line in section:
        if line[0].startswith("2"):
            yield Result(state=State.CRIT, summary="PowerDNS is NOT running")
            return
    yield Result(state=State.OK, summary="PowerDNS is running")

register.check_plugin(
    name = "powerdns",
    service_name = "PowerDNS",
    discovery_function = discover_powerdns,
    check_function = check_powerdns,
)