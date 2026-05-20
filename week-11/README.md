# TitanCorp Network Security Engineering: The DMZ Lockdown

## 🗺️ Mission Scenario
Public-facing assets like web servers operate within a Demilitarized Zone (DMZ). Because they face the public internet, they carry a high risk of initial compromise. If an Advanced Persistent Threat (APT) actor takes control of a DMZ web server, their immediate next tactical goal is **lateral movement**—pivoting from the DMZ to exploit sensitive internal corporate networks.

This project focuses on host-level hardening and network isolation. By configuring explicit firewall rule hierarchies using both UFW and raw `iptables`, we enforce a strict "least privilege" security architecture. This ensures that even if a public-facing web server is fully compromised, the threat actor is trapped inside a sandbox and blocked from accessing the internal corporate subnet.

---

## ⚙️ Phase 1 — The Micro-Lab: "The Rule Maker" (UFW)
**Objective:** Establish a secure "Default Deny" baseline posture using the Uncomplicated Firewall (UFW) wrapper interface.

Before applying granular packet filtering, the host's default fallback configuration was tightened to block all unexpected inbound communication while safely permitting outbound updates.

* **Default Global Posture Configuration:**
  ```bash
  ufw default deny incoming
  ufw default allow outgoing
