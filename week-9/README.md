## 💉 Week 9: SQL Injection & Database Exploitation
* **Authentication Bypass:** Utilized tautology payloads (`' OR 1=1 --`) to bypass login forms.
* **Union-Based Extraction:** Performed database mapping to discover table structures and exfiltrated sensitive data.
* **Remediation Strategy:** Documented the use of **Prepared Statements** (Parameterized Queries) as the primary defense against SQLi.
* **Cross-Site Scripting (XSS):** Executed Stored XSS to demonstrate session cookie theft (`document.cookie`).
* **Cross-Site Request Forgery (CSRF):** Crafted a malicious image-based URL to simulate unauthorized state-changing requests.
* **Defensive Mechanisms:** Documented the implementation of **Anti-CSRF Tokens** and the difference between Reflected and Stored XSS
* **API Security Testing:** Utilized **Burp Suite** to intercept, log, and audit backend API endpoints for broken object-level authorization (BOLA) and improper asset management.
