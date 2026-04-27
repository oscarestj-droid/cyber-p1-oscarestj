# CLOUDNANO REMEDIATION PLAN
**Operator:** ## TOP 5 CRITICAL FIXES
*(From the 20 raw findings, select the 5 that pose the greatest ACTUAL risk. Explain your reasoning.)*

1. **[Unauthenticated AWS S3 bucket]**
   * **Justification:** [This a huge issue since AWS holds senstive data and unauthenticatd users can be viewing information that is in the cloud.]

2. **[SQL Injection in login page]**
   * **Justification:** [This poses a threat since this would allow attackers to bypass login page by logging in as a user without using a password which results in attackers gaining important information]

3. **[remote code Execution in Apache Struts]**
   * **Justification:** [This can cause a huge issue since an attacker can take full control of an server]

4. **[Missing HTTP strict transport security]**
   * **Justification:** [Having http provides protection against data interception and session hijacking and without it attackers could steal your login credentials or session cookies]

5. **[Cross-Site Scripting (XSS) on support form]**
   * **Justification:** [Attackers can pose as users or admin by stealing session cookies which can result in the admin losing control of the forum]
