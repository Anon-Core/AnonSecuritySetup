<div align="center">

# 🌐 WebServer Setup

### Automated Nginx Installation for Debian/Ubuntu

---

</div>

## About

This script automates the complete installation and configuration of **Nginx web server** on Debian/Ubuntu systems. It handles repository configuration, system updates, package installation, and sets up a default test site accessible at `127.0.0.1`.

---

## Tech Stack

![Nginx](https://img.shields.io/badge/Nginx-009639?style=for-the-badge&logo=nginx&logoColor=white)
![Bash](https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnubash&logoColor=white)
![Debian](https://img.shields.io/badge/Debian-A81D33?style=for-the-badge&logo=debian&logoColor=white)
![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)

---

## Features

✅ **Repository Mirror Configuration** – Optimizes package sources  
✅ **System Update** – Updates all packages to latest versions  
✅ **Nginx Installation** – Installs and configures Nginx  
✅ **Service Activation** – Enables Nginx to start on boot  
✅ **Test Site** – Creates default page on `127.0.0.1`

---

## Installation

### Step 1: Download the Script
```bash
curl -O https://raw.githubusercontent.com/Anon-Core/AnonSecuritySetup/main/WebServer/setup.sh

### Step 2: Make it Executable

bash
sudo chmod +x setup.sh

### Step 3: Run the Script

bash
sudo ./setup.sh

---

## Verification

After installation, verify Nginx is running:

bash
# Check service status
sudo systemctl status nginx

# Test in browser
# Open: http://127.0.0.1

You should see the default Nginx welcome page.

---

## Requirements

- **OS:** Debian 10+ or Ubuntu 18.04+
- **Privileges:** Root or sudo access
- **Internet:** Active connection for package downloads

---

## Troubleshooting

**Nginx won't start?**
bash
sudo systemctl restart nginx
sudo journalctl -u nginx -n 50

**Port 80 already in use?**
bash
sudo lsof -i :80
# Stop conflicting service or change Nginx port

---

## ⚠️ Security Note

This setup is for **local development and testing**. For production use, configure SSL, firewall rules, and security hardening.

---

<div align="center">

[← Back to Main Repository](../)

</div>


---

