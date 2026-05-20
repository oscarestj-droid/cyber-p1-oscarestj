# 🔍 Week 10: Digital Forensics & Incident Response (DFIR)

## 📋 Case Overview: Volatile Data Acquisition
This directory contains the core evidence collection logs from an incident response investigation. The primary focus of this phase was to identify active indicators of compromise (IoCs), isolate the malicious process, and securely harvest system artifacts without contaminating volatile memory.

## 🛠️ Forensics Methodology
1. **Live Response & Triaging:** Analyzed active network connections and process trees to identify unauthorized listeners.
2. **Volatile Memory Preservation:** Documented process footprints before system shutdown to ensure vital evidence wasn't lost.
3. **Chain of Custody Integration:** Immediately generated unique cryptographic signatures for all extracted artifacts to ensure admissibility and prove compliance with legal integrity standards.

## 🗃️ Evidence Inventory
* **`collection_log.txt`**: The baseline collection record capturing the target process names, localized PIDs, and verifiable hash outputs (`MD5` / `SHA-256`).
