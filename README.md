# target_recon

Explanation:

    Target Input: The script prompts for an IP address or domain name and resolves it if it's a domain.
    Recon Options: After providing the target, the script will present a list of tasks you can choose from:
        Option 1: Fetch and display IP location information using ipinfo.io.
        Option 2: Perform an open port scan using nmap.
        Option 3: Get DNS information for the domain using dig.
        Option 4: Use sublist3r (a popular subdomain enumeration tool) to scan for subdomains of the domain. You will need to have sublist3r installed for this to work.
        Option 5: Exit the script.
    Recursion: After each task, the script will return to the menu so you can perform additional reconnaissance.

Prerequisites:

    Ensure you have jq installed for parsing JSON output:

sudo apt-get install jq

sublist3r (for subdomain enumeration): Install sublist3r via the following commands:

git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r
sudo python3 setup.py install


Installation and use
chmod +x target_recon.sh
./target_recon.sh

aliasing is recommended if using in command line. 
