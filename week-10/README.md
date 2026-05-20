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
