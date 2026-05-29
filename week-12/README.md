# 🛡️ Enterprise Subnet Breach & Vulnerability Triage Capstone

## 📋 Project Overview
This repository contains the comprehensive post-mortem security analysis and defensive mitigation playbook compiled during an incident response simulation across a multi-tiered simulated enterprise network. The operation required executing full-spectrum discovery, vulnerability isolation, forensic analysis, and host-level perimeter control deployment to remediate systematic architectural and software flaws.

---

## 🌐 Network Topology & Architecture
The lab infrastructure simulates an enterprise DMZ and backend application environment segregated into three distinct subnet layers:

1. **Triage Network (`172.100.0.0/24`):** Contains peripheral enterprise operational systems running reverse proxies and public-facing interfaces.
2. **Breach Network (`172.80.0.0/24`):** An internal staging segment hosting backend microservices and secondary authentication interfaces.
3. **Exploitation Network (`172.60.0.0/24`):** A highly sensitive production perimeter tier exposing raw backend application processing nodes.

---

## 🔍 Core Deliverables & Repository Structure
The security artifacts are organized into structured weekly directories tracking the defensive lifecycle:

```text
~/cyber-p1-oscarestj/
├── week-11/
│   └── Operation_Fortress_Report.md     # Initial boundary security audit
└── week-12/
    ├── portfolio_audit.md               # Infrastructure mapping & review
    └── tepp_postmortem.md               # Complete 3-Phase technical report
