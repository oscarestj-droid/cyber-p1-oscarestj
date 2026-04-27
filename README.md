# 🛡️ Cyber Security Portfolio: Oscar Estj

Welcome to my security engineering repository. This project documents my laboratory work, automated forensic tools, and system hardening scripts.

---

## 📁 Repository Structure
### 🧱 Week 1: Reconnaissance & Hardening
Initial phase focusing on system discovery and baseline security.
* `harden.sh`: A shell script for basic Linux system lockdown.
* `discovery.txt`: Reconnaissance notes and system inventory.
* `threat_ips.txt`: Initial list of flagged malicious IP addresses

### 🌐 Week 2: Network Forensics & Architecture
Focus on mapping the attack surface and analyzing protocol traffic.
* `subnet_blueprint.txt`: Logical mapping of the internal network and VLANs.
* `protocol_audit.txt`: Deep dive into active services (SSH, HTTP, FTP) and their risks.
* `network_audit.txt`: Summary of discovered live hosts and potential vulnerabilities.
* `lab report.txt`: Detailed analysis of network-layer security findings. 

### 🕵️ Week 3: Log Analysis & System Auditing
This week focused on automating incident response and system health checks using Python.
* `brute_detector.py`: Scans logs for failed login attempts and calculates total hits.
* `incident_response.py`: Orchestrates `grep` via subprocess to extract attacker IPs into JSON format.
* `system_auditor.py`: A comprehensive tool for checking system health and security configurations.
* `port_check.py`: A utility to identify open network ports and potential exposure.

### 🐳 Week 4: Containerization
* `docker-compose.yml`: Deploys an air-gapped stack for secure environment orchestration. 
* `deploy_web.sh`: Deploying a disposable web server using docker by launching an nginx container, modifying its content, audit its logs then destroy it completely and automate the entire sequence in a delpoyment script.
* `sandbox_report.txt`: Detailed behavioral analysis of malware executed within the air-gapped container environment.# Cybersecurity Portfolio - Week 4

## 🏗️ Project 1: Three-Tier Hyper-Stack Orchestration
Deployed a hardened, multi-container environment using **Docker Compose** to simulate a production-grade web infrastructure.

* **Architecture**: WordPress (Frontend) and MariaDB (Backend).
* **Security Control**: Implemented **Micro-segmentation** using a custom internal Docker network (`private_net`).
* **Verification**: 
    * Performed an `nmap` audit to confirm the database port (3306) is hidden from the host.
    * Executed a sandbox isolation test; verified that the web container has no route to the host network (Ping Test: **PASSED**).

## 🛡️ Project 2: Malware Sandbox Detonation
Conducted dynamic analysis of a suspicious executable within an air-gapped container environment.

* **File Analyzed**: `sandbox_report.txt`
* **Objective**: Observe system-level changes and network callbacks without risking the host machine.
* **Findings**: Documented behavioral patterns and identified why "Bridged" networking is a critical risk during detonation.

## 🛠️ Skills Demonstrated
* **Infrastructure as Code (IaC)**: Docker Compose YAML configuration.
* **Network Security**: Firewalling, internal networking, and port auditing.
* **Forensics**: Dynamic analysis reporting and environmental isolation. 

--- 
## 🛡️ Week 6: The Hardened Outpost (Infrastructure Security)

### 🏗️ Security Architecture Document (SAD)
Detailed analysis can be found in: [`week6/HardenedOutpost_SAD.md`](./week6/HardenedOutpost_SAD.md)

**Key Security Principles Implemented:**
* **Defense in Depth:** Layered security starting from the host OS (UFW/SSH hardening) down to the containerized application.
* **Principle of Least Privilege:** The MySQL database is strictly confined to a private backend network with no external port mapping.
* **Segregated Networking:** * `frontend-nw`: Connects the user to the WordPress DMZ.
  * `backend-nw`: An isolated "Dark Net" for internal database traffic only.

### 🛠️ Technical Stack & Tools
* **Orchestration:** Docker Compose
* **Hardening:** UFW (Uncomplicated Firewall), SSH Key-Auth, Configured `.env` secrets.
* **Auditing:** Custom Python Connectivity Auditor (`dc_auditor.py`)

### 📊 Deployment Diagram
The architecture follows a classic **Two-Tier DMZ pattern**, ensuring that a compromise of the web server does not lead to an immediate database breach. 
## Week 7: Network Discovery and Strategic Triage

### 🔍 Project Overview
This week focused on identifying network assets and assessing vulnerabilities using industry-standard tools. The goal was to move beyond simply finding "bugs" and start practicing **Risk-Based Prioritization**—deciding what to fix based on Likelihood and Impact.

### 🛠️ Tools Used
* **Nmap:** Used for network mapping, host discovery, and service version detection.
* **Nikto:** Utilized for web server vulnerability scanning and configuration auditing.
* **Git/GitHub:** Managed session artifacts and remediation plans.

### 📈 Key Learning Objectives
1. **Network Intelligence:** Performed `-sn` ping sweeps to map active subnets followed by `-sV` and `-A` scans to identify specific service versions (Nginx, Redis, Apache).
2. **The Risk Formula:** Applied the formula **Risk = Likelihood x Impact** to triage a list of vulnerabilities.
3. **Strategic Remediation:** Drafted a remediation plan focusing on high-risk items like public S3 buckets and RCE vulnerabilities over high-CVSS items that were non-reachable (air-gapped).

### 📁 Artifacts
* [Nmap Scan Results](./week-7/nmap_scan_results.txt) - Detailed port and service mapping.
* [Remediation Plan](./week-7/remediation_plan.md) - A strategic triage of the top 5 vulnerabilities identified during the audit.
*Generated by Oscar Estj - April 2026*
