#!/bin/bash

# =========================================================
#  ANON SERVER SETUP
#  https://github.com/Anon-Core
# =========================================================

# =========================
# Colors
# =========================

RED="\e[1;31m"
DARK="\e[0;31m"
GREEN="\e[1;32m"
YELLOW="\e[1;33m"
CYAN="\e[1;36m"
RESET="\e[0m"

# =========================
# Banner
# =========================

clear

echo -e "${RED}"
echo "=================================================="
echo "              ANON SERVER SETUP"
echo "           github.com/Anon-Core"
echo "=================================================="
echo -e "${RESET}"

# =========================
# Logger Functions
# =========================

log() {
    echo -e "${CYAN}[INFO]${RESET} $1"
}

success() {
    echo -e "${GREEN}[SUCCESS]${RESET} $1"
}

error() {
    echo -e "${RED}[ERROR]${RESET} $1"
}

warn() {
    echo -e "${YELLOW}[WARNING]${RESET} $1"
}

# =========================
# Root Check
# =========================

if [ "$EUID" -ne 0 ]; then
    error "Run this script with sudo or root."
    exit 1
fi

# =========================
# Detect OS
# =========================

log "Detecting operating system..."

if [ ! -f /etc/os-release ]; then
    error "/etc/os-release not found."
    exit 1
fi

source /etc/os-release

DIST=$ID
CODENAME=$VERSION_CODENAME
VERSION=$VERSION_ID

success "Detected OS: $DIST $VERSION ($CODENAME)"

# =========================
# Supported Check
# =========================

if [[ "$DIST" != "ubuntu" && "$DIST" != "debian" ]]; then
    error "Unsupported Linux distribution."
    exit 1
fi

# =========================
# Backup Sources
# =========================

log "Creating backup of sources.list..."

cp /etc/apt/sources.list /etc/apt/sources.list.backup.$(date +%F-%H%M%S)

success "Backup created."

# =========================
# Configure Mirrors
# =========================

log "Configuring mirrors..."

if [[ "$DIST" == "ubuntu" ]]; then

cat > /etc/apt/sources.list <<EOF
deb http://linux-mirror.liara.ir/repository/ubuntu $CODENAME main restricted universe multiverse
deb http://linux-mirror.liara.ir/repository/ubuntu $CODENAME-updates main restricted universe multiverse
deb http://linux-mirror.liara.ir/repository/ubuntu $CODENAME-backports main restricted universe multiverse
deb http://linux-mirror.liara.ir/repository/ubuntu-security $CODENAME-security main restricted universe multiverse
EOF

fi

if [[ "$DIST" == "debian" ]]; then

cat > /etc/apt/sources.list <<EOF
deb http://linux-mirror.liara.ir/repository/debian $CODENAME main contrib non-free non-free-firmware
deb http://linux-mirror.liara.ir/repository/debian-security $CODENAME-security main contrib non-free non-free-firmware
deb http://linux-mirror.liara.ir/repository/debian $CODENAME-updates main contrib non-free non-free-firmware
EOF

fi

success "Mirror configuration completed."

# =========================
# Test Repository
# =========================

log "Testing repositories..."

apt update

if [ $? -ne 0 ]; then
    error "Repository test failed."

    warn "Restoring backup..."

    LATEST_BACKUP=$(ls -t /etc/apt/sources.list.backup.* | head -n 1)

    cp "$LATEST_BACKUP" /etc/apt/sources.list

    success "Backup restored."

    exit 1
fi

success "Repositories working correctly."

# =========================
# System Upgrade
# =========================

log "Updating system packages..."

apt upgrade -y

if [ $? -ne 0 ]; then
    error "System update failed."
    exit 1
fi

success "System updated successfully."

# =========================
# Install Packages
# =========================

PACKAGES=(
    curl
    wget
    git
    nginx
    ufw
)

log "Installing required packages..."

for pkg in "${PACKAGES[@]}"
do
    log "Installing: $pkg"

    apt install -y "$pkg"

    if [ $? -eq 0 ]; then
        success "$pkg installed."
    else
        error "Failed to install $pkg"
    fi
done

# =========================
# Nginx Setup
# =========================

log "Enabling nginx..."

systemctl enable nginx >/dev/null 2>&1

systemctl restart nginx

sleep 2

if systemctl is-active --quiet nginx; then
    success "Nginx is running."
else
    error "Nginx failed to start."

    systemctl status nginx --no-pager

    exit 1
fi

# =========================
# Firewall Setup
# =========================

log "Configuring firewall..."

ufw allow 22/tcp >/dev/null 2>&1
ufw allow 80/tcp >/dev/null 2>&1
ufw allow 443/tcp >/dev/null 2>&1

echo "y" | ufw enable >/dev/null 2>&1

success "Firewall configured."

# =========================
# Detect Server IP
# =========================

SERVER_IP=$(hostname -I | awk '{print $1}')

if [ -z "$SERVER_IP" ]; then
    SERVER_IP="127.0.0.1"
fi

success "Server IP: $SERVER_IP"

# =========================
# Create HTML Page
# =========================

HTML_PATH="/var/www/html/index.html"

log "Creating default HTML page..."

cat > "$HTML_PATH" <<EOF
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Anon Server</title>
</head>

<body style="background:black;color:red;text-align:center;font-family:monospace;padding-top:100px;">

<h1>ANON SERVER ONLINE</h1>

<p>Server IP: $SERVER_IP</p>

<p>Powered by Anon-Core</p>

<p>https://github.com/Anon-Core</p>

</body>

</html>
EOF

if [ $? -eq 0 ]; then
    success "HTML page created."
else
    error "Failed to create HTML page."
fi

# =========================
# Final Test
# =========================

log "Running final checks..."

systemctl is-active nginx >/dev/null 2>&1

if [ $? -eq 0 ]; then
    success "Nginx service verified."
else
    error "Nginx verification failed."
fi

# =========================
# Final Output
# =========================

echo
echo -e "${RED}==================================================${RESET}"
echo -e "${GREEN}          SERVER SETUP COMPLETED${RESET}"
echo -e "${RED}==================================================${RESET}"

echo -e "${CYAN}Website:${RESET} http://$SERVER_IP"
echo -e "${CYAN}HTML File:${RESET} $HTML_PATH"
echo -e "${CYAN}OS:${RESET} $DIST $VERSION"
echo -e "${CYAN}Mirror:${RESET} Liara Mirror"

echo -e "${RED}==================================================${RESET}"
echo
