<div align="center">

# AnonSecuritySetup

**Web Security & Hacking Fundamentals - Environment Setup & Automation Tools**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Bash](https://img.shields.io/badge/Bash-4.0+-4EAA25?style=flat&logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)
[![Platform](https://img.shields.io/badge/Platform-Debian%20%7C%20Ubuntu-orange)](https://www.debian.org/)

---

[English](README.md) | [فارسی](README-fa.md)

</div>

## 📋 About

This repository contains a collection of **automated setup scripts** and tools developed for the **Web Security & Hacking Fundamentals** course. Created for educational practice, learning, and portfolio building.

All scripts are designed to streamline environment setup for security testing and web application vulnerability research.

---

## 🛠️ Tools & Scripts

### 1. **WebServer Setup**
Automated Nginx installation and configuration script for Debian/Ubuntu systems.

**Features:**
- Mirror repository configuration
- System update & upgrade
- Nginx installation with dependencies
- Default test site deployment on `127.0.0.1`

[📖 Full Documentation](WebServer/README.md)

---

### 2. **DNS Mapping**
Local DNS record management tool for mapping custom domains to IP addresses via `/etc/hosts`.

**Features:**
- Add custom domain-to-IP mappings
- Development environment configuration
- Local testing support

[📖 Full Documentation](DNSMapping/README.md)

---

### 3. **DVWA Installer**
Automated installer for **Damn Vulnerable Web Application (DVWA)** with full dependency management.

**Features:**
- One-command installation
- Database configuration
- Dependency resolution

[📖 Full Documentation](DVWA/README.md)

---

## 🚀 Quick Start

Each tool has its own dedicated README with detailed instructions. General usage pattern:
```bash
# Download script
curl -O https://raw.githubusercontent.com/Anon-Core/AnonSecuritySetup/main/<TOOL>/<script>.sh

# Make executable
sudo chmod +x <script>.sh

# Run
sudo ./<script>.sh [options]

---

## ⚙️ System Requirements

- **OS:** Debian 10+ or Ubuntu 20.04+
- **Privileges:** sudo/root access
- **Shell:** Bash 4.0+
- **Network:** Active internet connection

---

## ⚠️ Disclaimer

These tools are intended for **authorized security testing and educational purposes only**. Users are responsible for compliance with applicable laws and regulations. Unauthorized access to systems is illegal.

---

## 📫 Contact

**GitHub:** [@Anon-Core](https://github.com/Anon-Core)

---

## 📄 License

MIT License - See [LICENSE](LICENSE) for details.

---

<div align="center">

**Built for learning, testing, and security research** 🔒

</div>


---