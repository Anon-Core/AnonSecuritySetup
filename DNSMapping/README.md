<div align="center">

# 🌍 DNS Mapping

### Local DNS Record Manipulation Tool

---

</div>

## About

This script modifies the local `/etc/hosts` file to map custom domain names to specific IP addresses. Essential for local development, testing, and security research environments.

---

## Tech Stack

![Bash](https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnubash&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![DNS](https://img.shields.io/badge/DNS-0078D4?style=for-the-badge&logo=cloudflare&logoColor=white)

---

## Features

✅ **Custom Domain Mapping** – Map any domain to any IP  
✅ **Local DNS Override** – Bypass external DNS resolution  
✅ **Development Environment** – Test sites locally before deployment  
✅ **Security Testing** – Redirect domains for penetration testing  
✅ **Automatic Backup** – Preserves original `/etc/hosts`

---

## Installation

### Step 1: Download the Script
```bash
curl -O https://raw.githubusercontent.com/Anon-Core/AnonSecuritySetup/main/DNSMapping/dnsmapping.sh

### Step 2: Make it Executable

bash
sudo chmod +x dnsmapping.sh

### Step 3: Run with Parameters

bash
sudo ./dnsmapping.sh -dnsmapping -u http://example.com -i 192.168.1.100

---

## Usage

### Basic Syntax

bash
sudo ./dnsmapping.sh -dnsmapping -u <URL> -i <IP_ADDRESS>

### Parameters

| Parameter | Description | Example |
|-----------|-------------|---------|
| `-dnsmapping` | Enable DNS mapping mode | Required flag |
| `-u` | Target URL/domain | `http://test.local` |
| `-i` | IP address to map | `127.0.0.1` |

---

## Examples

### Map Local Domain

bash
sudo ./dnsmapping.sh -dnsmapping -u http://myapp.local -i 127.0.0.1

### Map to Remote Server

bash
sudo ./dnsmapping.sh -dnsmapping -u http://target.com -i 10.0.0.50

### Map DVWA for Testing

bash
sudo ./dnsmapping.sh -dnsmapping -u http://dvwa.local -i 127.0.0.1

---

## Verification

Check if mapping was successful:

bash
# View hosts file
cat /etc/hosts

# Test DNS resolution
ping example.com

# Test in browser
curl http://example.com

---

## Requirements

- **OS:** Linux (any distribution)
- **Privileges:** Root or sudo access
- **File Access:** Write permission to `/etc/hosts`

---

## Troubleshooting

**Changes not taking effect?**
bash
# Flush DNS cache (Ubuntu/Debian)
sudo systemd-resolve --flush-caches

# Restart network service
sudo systemctl restart NetworkManager

**Permission denied?**
bash
# Ensure you're using sudo
sudo ./dnsmapping.sh -dnsmapping -u http://test.com -i 127.0.0.1

---

## ⚠️ Important Notes

- **Backup:** Script automatically backs up `/etc/hosts` before modification
- **Persistence:** Changes persist across reboots
- **Removal:** Manually edit `/etc/hosts` to remove mappings
- **Testing Only:** Use only on systems you own or have permission to modify

---

## Restore Original Hosts File

bash
# If backup exists
sudo cp /etc/hosts.backup /etc/hosts

# Or manually edit
sudo nano /etc/hosts

---

<div align="center">

[← Back to Main Repository](../)

</div>


---
