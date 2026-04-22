# TITAN SMALL BUSINESS SERVICES: SECURITY ARCHITECTURE DOCUMENT (SAD)
**Operator:** [Oscar Estudillo]
**Date:** [04/21/2026]

## 1. Perimeter Hardening (UFW & SSH)
* **SSH Status:** [PasswordAuthentication no and permitroot no login ]
* **Firewall Logic:** [22, 8080, and 8081)]

## 2. The Automated Auditor (Python)
* **Script Logic:** [import os

hostname = "192.168.64.2" 
response = os.system(f"ping -c 4 {hostname} > /dev/null 2>&1")

with open("/var/log/dc_audit.log", "a") as log_file:
    if response == 0:
        log_file.write("DC is UP\n")
    else:
        log_file.write("DC is DOWN\n")]
* **Telemetry Path:** `/var/log/sys_audit.log` DC is up

## 3. Containerized App (Docker)
* **Network Isolation:** [i place db (MySQL) service exclusively on the backend network and setting that network to internal: true, so i havesuccessfully isolated the database from the public internet while still allowing the wordpress frontend to talk to it.]
* **Stack Health:** [Paste output of `docker compose ps`]
wordpress: Up and running on port 8081.

db: Up and running and isolated on the internal network.
## 4. Executive Summary
[Write 3 sentences on the overall security posture of the outpost]
The security posture is really top notched after everything i have done. A strict firewall and disabling password logins which allows anybody to come in through 3 specific doors in my case (ports 22, 8080, and 8081).Also the docker Air-gap was also crucial because the wordpress acted aas a front door and the data base was on an internal network which means its not connected to the outside but the wordpress is. So if anybody breaks in they cannot enter the data base.
