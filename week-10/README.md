# 🔍 Week 10: Digital Forensics & Incident Response (DFIR)

## 📋 Case Overview: Volatile Data Acquisition
This directory contains the core evidence collection logs from an incident response investigation. The primary focus of this phase was to identify active indicators of compromise (IoCs), isolate the malicious process, and securely harvest system artifacts without contaminating volatile memory.

## 🛠️ Forensics Methodology
1. **Live Response & Triaging:** Analyzed active network connections and process trees to identify unauthorized listeners.
2. **Volatile Memory Preservation:** Documented process footprints before system shutdown to ensure vital evidence wasn't lost.
3. **Chain of Custody Integration:** Immediately generated unique cryptographic signatures for all extracted artifacts to ensure admissibility and prove compliance with legal integrity standards.

## 🗃️ Evidence Inventory
* **`collection_log.txt`**: The baseline collection record capturing the target process names, localized PIDs, and verifiable hash outputs (`MD5` / `SHA-256`).
# TitanCorp Incident Response: The Digital Autopsy

## 🗺️ Mission Scenario
An employee inside the TitanCorp corporate network opened a suspicious file named `Resume.exe`, which subsequently vanished from the filesystem interface. The adversary believed that deleting the binary payload was sufficient to evade detection. 

As the Lead Forensic Analyst, this repository documents the process of carving volatile system memory (RAM) to discover hidden active threats, reaching past operating system abstractions to recover the deleted malware payload from raw disk sectors, and analyzing the artifact to construct a complete tactical picture.

---

## ⚙️ Phase 1 — The Micro-Lab: "Volatility & RAM"
**Objective:** Carve raw, unallocated memory structures to identify hidden execution blocks.

By evaluating strings extracted directly from the raw memory image (`memdump.raw`) and isolating anomalous signatures, a covert background beacon process was identified attempting to hide from active process auditing utilities.

* **Execution Command:** ```bash
    strings memdump.raw | grep -i "HIDDEN"
    ```
* **Identified Executable Name:** `rootkit_beacon.exe`
* **Identified Process ID (PID):** `4444`

---

## ⚙️ Phase 2 — The Deep Dive: "The Malware Autopsy"
**Objective:** Reconstruct an infection timeline and payload mechanics from a raw disk image using The Sleuth Kit (TSK).

### 1. Filesystem Auditing
Using the filesystem utility `fls`, a recursive sweep of the storage drive image (`compromised_drive.dd`) was executed to locate entries flagged as unallocated (deleted).
```bash
fls -r compromised_drive.dd
# TitanCorp Incident Response: The Central Nervous System (SIEM Correlation)

## 🗺️ Mission Scenario
An Advanced Persistent Threat (APT) actor successfully compromised the TitanCorp enterprise network, escalated privileges to Domain Admin, and moved laterally across multiple internal systems before exfiltrating critical corporate data. Investigating this breach across thousands of scattered log files would be impossible manually. 

As the Incident Responder, this repository documents the utilization of the SIEM (Kibana) as a central brain to aggregate, filter, and correlate disparate telemetry from Web Servers, Windows Security event logs, and Network Firewalls. By tracking attacker footprints across shared IP addresses and tight timestamp windows, the complete network kill chain was successfully reconstructed.

---

## ⚙️ Phase 1 — The Micro-Lab: "Kibana Search"
**Objective:** Search aggregated log indexes to isolate the initial Indicator of Compromise (IoC).

Using the Kibana **Discover** interface against the `enterprise_logs*` index, a query was built to isolate authentication failures across the perimeter.

* **SIEM Search Query:** ```text
  event_type: "Failed Login"
# TitanCorp Enterprise Incident Response: Operation Phantom Pursuit

## 🗺️ Mission Overview
Operation Phantom Pursuit simulates a comprehensive, end-to-end breach lifecycle investigation within the TitanCorp enterprise network. Rather than looking at security milestones in isolation, this engagement requires navigating the complete defense pipeline: correlating decentralized SIEM alerts, performing volatile live triage on a compromised container, establishing a cryptographic Chain of Custody, and executing a low-level disk autopsy to carve out hidden malware.

This repository serves as the official central registry for the threat intelligence and forensic artifacts recovered during the investigation.

---

## ⚙️ Phase 1 — SIEM Correlation: "The Alert"
**Objective:** Identify and document the initial perimeter vector of the threat actor.

Using the centralized SIEM interface (Kibana) to parse the aggregated `enterprise_logs*` index, a sweep was performed to isolate high-severity system signals. A cluster of malicious ingestion spikes flagged a critical perimeter event.

* **Search Telemetry:** `Critical Alert`
* **Discovered Threat Vector (Attacker Source IP):** `198.51.100.44`
* **Analysis:** The external IP address was tracked making unauthorized ingress attempts, confirming the threat actor's initial point of network presence.

---

## ⚙️ Phase 2 — Live Triage & Chain of Custody
**Objective:** Contain the volatile host environment, profile the active compromise, and seal the physical evidence.

### 1. Volatile Memory Inspection
An interactive TTY session was established into the quarantined environment (`quarantined_host`) to collect highly volatile network socket states before they faded from RAM.
```bash
docker exec -it quarantined_host /bin/sh
netstat -antp
