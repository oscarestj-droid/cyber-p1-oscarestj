import socket

# This is your list of targets from target_intel.txt
targets = ["127.0.0.1", "8.8.8.8", "1.1.1.1", "10.0.0.1"]
for ip in targets:
# Create the 'digital hand' to knock on the door
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    
    # Set a timer so we don't wait forever (1 second)
    s.settimeout(1)
    result = s.connect_ex((ip, 22)) 
    if result == 0:
        print(f"SUCCESS: Port 22 is OPEN on {ip}")
    else:
        print(f"FAILED: Port 22 is CLOSED on {ip}")
    
    # Don't forget to wash your hands! Close the socket.
        s.close() 