# OMNI-PORTAL ASSESSMENT REPORT
**Operator:** **Deadline:** April 5 @ 11:59 PM 

## PHASE 1: AUTH BYPASS (SQLi)
* **Payload Used:** ['OR 1=1 --]
* **Result:** Successfully bypassed login and obtained 'auth_token' cookie.

## PHASE 2: CLIENT-SIDE HIJACK (XSS)
* **Stored XSS Payload:** [<script>alert(document.cookie);</script>]
* **Secret Cookie Captured:** [session_id=admin_secret_99812_do_not_share; auth_token=SUPPORT_TIER_1_SECRET_TOKEN]

## PHASE 3: API ENUMERATION (BOLA)
* **Insecure Order ID:** [501]
* **Confidential Data Leaked:** [15,000.00 server lease order id 501]

## PHASE 4: THE REMEDIATION
* **Fix for SQLi:** * Using prepared statments would utimaltely elminate SQL injections due to the seperation of data and code since attackers link the user input into a query string which can change the rules or retrieve information from a search engine.
 **Fix for XSS:** Implementing more security on validating data and always sanitizing input to make sure we treat input strictly as text.
* **Fix for API BOLA:** we have to validate the user session's against the requested object ownership and add UUIDs which stops attackers from enumerating endpoints.
