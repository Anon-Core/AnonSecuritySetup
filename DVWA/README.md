<div align="center">

# 🎯 DVWA Setup

### Damn Vulnerable Web Application - Automated Installation

---

</div>

## About

Automated setup script for DVWA (Damn Vulnerable Web Application) - a PHP/MySQL web application designed for security professionals to test their skills and tools in a legal environment. Perfect for learning web application security.

---

## Tech Stack

![PHP](https://img.shields.io/badge/PHP-777BB4?style=for-the-badge&logo=php&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Apache](https://img.shields.io/badge/Apache-D22128?style=for-the-badge&logo=apache&logoColor=white)
![Security](https://img.shields.io/badge/Security-FF0000?style=for-the-badge&logo=security&logoColor=white)

---

## Features

✅ **Automated Installation** – One-command setup  
✅ **Full LAMP Stack** – Apache, MySQL, PHP configured automatically  
✅ **Database Setup** – MySQL database created and configured  
✅ **Security Levels** – Low, Medium, High, Impossible difficulty modes  
✅ **Ready to Use** – Access immediately after installation

---

## Installation

### Step 1: Clone DVWA Repository
```bash
git clone https://github.com/digininja/DVWA.git

### Step 2: Download Setup Script

bash
curl -O https://raw.githubusercontent.com/Anon-Core/AnonSecuritySetup/main/DVWA/dvwa.sh

### Step 3: Make it Executable

bash
sudo chmod +x dvwa.sh

### Step 4: Run Installation

bash
sudo ./dvwa.sh

---

## Post-Installation

### Access DVWA

Open your browser and navigate to:


http://localhost/DVWA

Or if using DNS mapping:


http://dvwa.local

### Default Credentials


Username: admin
Password: password

### First Login Steps

1. Click **"Create / Reset Database"** button
2. Login with default credentials
3. Set security level in **DVWA Security** page
4. Start practicing!

---

## Security Levels

| Level | Description | Use Case |
|-------|-------------|----------|
| **Low** | No security measures | Learn basic vulnerabilities |
| **Medium** | Basic protections | Practice bypass techniques |
| **High** | Strong protections | Advanced exploitation |
| **Impossible** | Secure code | Study proper security |

---

## Available Vulnerabilities

- **Brute Force** – Password cracking
- **Command Injection** – OS command execution
- **CSRF** – Cross-Site Request Forgery
- **File Inclusion** – LFI/RFI attacks
- **File Upload** – Malicious file upload
- **SQL Injection** – Database exploitation
- **XSS** – Cross-Site Scripting (Reflected/Stored/DOM)
- **Weak Session IDs** – Session prediction
- **Insecure CAPTCHA** – CAPTCHA bypass
- **JavaScript** – Client-side attacks

---

## Verification

Check if DVWA is running:

bash
# Check Apache status
sudo systemctl status apache2

# Check MySQL status
sudo systemctl status mysql

# Test web access
curl http://localhost/DVWA

---

## Requirements

- **OS:** Ubuntu/Debian Linux
- **RAM:** Minimum 1GB
- **Disk Space:** 500MB free
- **Network:** Internet connection for initial setup
- **Privileges:** Root or sudo access

---

## Troubleshooting

**Cannot access DVWA?**
bash
# Restart Apache
sudo systemctl restart apache2

# Check if port 80 is in use
sudo netstat -tulpn | grep :80

**Database connection error?**
bash
# Restart MySQL
sudo systemctl restart mysql

# Check MySQL status
sudo systemctl status mysql

**Permission issues?**
bash
# Fix DVWA directory permissions
sudo chown -R www-data:www-data /var/www/html/DVWA
sudo chmod -R 755 /var/www/html/DVWA

**PHP errors?**
bash
# Check PHP version
php -v

# Restart Apache after PHP changes
sudo systemctl restart apache2

---

## Configuration Files

| File | Purpose |
|------|---------|
| `/var/www/html/DVWA/config/config.inc.php` | Main configuration |
| `/etc/apache2/sites-available/000-default.conf` | Apache config |
| `/etc/php/*/apache2/php.ini` | PHP settings |

---

## ⚠️ Security Warning

**NEVER deploy DVWA on a public server or production environment!**

- DVWA is **intentionally vulnerable**
- Use only in isolated lab environments
- Do not expose to the internet
- Use virtual machines or containers
- Practice only on systems you own

---

## Uninstall

bash
# Remove DVWA files
sudo rm -rf /var/www/html/DVWA

# Drop database
mysql -u root -p -e "DROP DATABASE dvwa;"

# Optional: Remove LAMP stack
sudo apt remove --purge apache2 mysql-server php

---

## Learning Resources

- [DVWA Official Documentation](https://github.com/digininja/DVWA)
- [OWASP Top 10](https://owasp.org/www-project-top-ten/)
- [Web Security Academy](https://portswigger.net/web-security)

---

<div align="center">

[← Back to Main Repository](../)

</div>


---
