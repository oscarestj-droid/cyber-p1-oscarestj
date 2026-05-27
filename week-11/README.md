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
# TitanCorp Network Security Monitoring: Custom IDS Signature Deployment

## 🗺️ Mission Scenario
Intrusion Detection Systems (IDS) serve as the strategic "security cameras" of an organization's network infrastructure. While firewalls are designed to blindly permit or block traffic based on strict IP addresses and port rules, an IDS like **Suricata** conducts real-time Deep Packet Inspection (DPI). It analyzes packet payloads to uncover hidden threats trying to sneak past legitimate, open ports.

In this lab, a containerized Suricata sensor was deployed on a target network (`ids_net`) to monitor traffic destined for a vital corporate web server (`172.90.0.10`). Custom detection signatures were engineered to catch reconnaissance tactics (ping sweeps) and active cyber espionage tools masking their identity inside application-layer payloads.

---

## ⚙️ Phase 1 — The Micro-Lab: "The ICMP Trap"
**Objective:** Engineer a network-layer signature to detect initial reconnaissance activity (ping sweeps).

Attackers often scan subnets using ICMP echoes to identify active targets. A signature was built to trigger an alert any time an ICMP packet is directed at the primary web host.

* **Engineered Signature Rule:**
  ```text
  alert icmp any any -> 172.90.0.10 any (msg:"ICMP Ping Detected"; sid:1000001; rev:1;)
