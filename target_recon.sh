#!/bin/bash
# Comprehensive Recon Tool for IP or Domain

# Prompt for target IP or domain
read -p "Enter the target IP address or domain name: " target

# Resolve domain to IP if it's not already an IP
if [[ "$target" =~ ^[a-zA-Z0-9.-]+$ ]]; then
    if [[ "$target" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        ip=$target
    else
        ip=$(dig +short "$target" | head -n 1)
    fi
else
    echo "Invalid input. Please enter a valid IP or domain."
    exit 1
fi

# Display target IP
echo -e "\nTarget IP: $ip"

# Function for performing recon tasks
recon_task() {
    echo -e "\nSelect an option for reconnaissance on $target ($ip):"
    echo "1) IP Location Information"
    echo "2) Open Ports Scan (Nmap)"
    echo "3) DNS Information (Dig)"
    echo "4) Scan for Subdomains"
    echo "5) Exit"
    read -p "Choose an option (1-5): " choice

    case $choice in
        1)
            # Get location info from ipinfo.io
            echo -e "\nIP Location Information:"
            curl -s "https://ipinfo.io/$ip/json" | jq .
            recon_task
            ;;
        2)
            # Scan for open ports using Nmap
            echo -e "\nScanning for open ports on $ip:"
            nmap -p 1-65535 $ip --open -T4 -v
            recon_task
            ;;
        3)
            # DNS Information
            echo -e "\nFetching DNS Information for $target:"
            dig $target
            recon_task
            ;;
        4)
            # Scan for subdomains (using sublist3r or a similar tool)
            echo -e "\nScanning for subdomains of $target:"
            sublist3r -d $target -o "$target-subdomains.txt"
            echo -e "Subdomains saved to $target-subdomains.txt"
            recon_task
            ;;
        5)
            echo "Exiting script."
            exit 0
            ;;
        *)
            echo "Invalid choice, please select a valid option (1-5)."
            recon_task
            ;;
    esac
}

# Start the recon process
recon_task
