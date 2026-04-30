# TITANCORP: PERIMETER ASSESSMENT REPORT
**Operator:** **Target Subnet:** 172.88.0.0/24

## PHASE 1: ACTIVE ENUMERATION (NMAP)
*(List the live IPs discovered and their running services/versions)*
* **Host 1 ([172.88.0.10]):** [Port 80/tcp:nginx 1.14.2]
* **Host 2 ([172.88.0.20]):** [port 80/tcp: Apache httpd 2.4.66]
* **Host 3 ([172.88.0.15]):** [cache Database all ports in ignored states]

## PHASE 2: VULNERABILITY AUDIT (NIKTO)
*(Run Nikto against the TWO web servers discovered above. List one major finding for each.)*
* **Web Server 1 Finding:** [There were 3 issues uncovered in this web server but the biggest one would be the outdated software version of Nginx due to the lack of patches which can result in losing control of the server to attackers. Updates prevent this issues from happening.]
* **Web Server 2 Finding:** [Being vulnerable to XST is a huge issue since attackers are able to steal important information and authorization headers.]

## PHASE 3: RISK TRIAGE
*(Review your findings. Identify the SINGLE highest-risk vulnerability across the entire DMZ. Justify why it is the top priority using the Likelihood x Impact formula.)*

* **Top Priority Remediation:** [Outdated software Nginx server]
* **Justification:** [This should recieve the top priority because old systems could have unpatched servers and its what attackers look for. They have actively exploited vulnerabilities and could lead to a full server compromise.]
