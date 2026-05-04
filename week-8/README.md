# Week 8: Vertical Privilege Escalation Lab

This folder contains the artifacts and documentation for the Vertical Privilege Escalation module completed during Week 8.

## Lab Overview
- **Objective:** Escalate privileges to root from a limited user account using an insecure cron job and wildcard injection.
- **Vulnerable Service:** `/usr/local/bin/backup.sh`
- **Writable Path Used:** `/home/limited_user/backups`

## Execution Steps
1. **Enumeration:** Ran LinPEAS to identify vulnerable cron jobs and world-writable paths.
2. **Payload Creation:** Created an SUID script to spawn a root shell:
   ```bash
   echo 'cp /bin/bash /tmp/rootbash; chmod +s /tmp/rootbash' > runme.sh
