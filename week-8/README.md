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
## 🎯 Week 8: Operation Deep Pivot (Offensive Operations)
**Goal:** Simulate a full attack lifecycle, from initial access to lateral movement within a corporate network.

### 🛠️ Technical Milestones
* **Privilege Escalation:** Identified and exploited a misconfigured `sudo` binary (`/usr/bin/find`) using **GTFOBins** methodology to break out of a restricted shell.
* **Persistence:** Established a resilient backchannel using a **Crontab reverse shell**, ensuring continued access across system reboots.
* **Lateral Movement (The Pivot):** * Utilized **Metasploit** (auxiliary scanners and socks_proxy) to tunnel through the initial entry point.
  * Discovered a hidden internal database segment (`10.0.10.0/24`).
  * Successfully enumerated an open **Redis port (6379)** on a protected internal host.

### 📁 Key Artifacts
* [`week-8/Deep_Pivot_Report.md`](./week-8/Deep_Pivot_Report.md): Full After-Action Report (AAR) detailing the exploit chain and discovered vulnerabilities.
