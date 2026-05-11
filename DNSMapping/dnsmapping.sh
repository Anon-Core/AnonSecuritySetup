#!/usr/bin/env bash

#═══════════════════════════════════════════════════════════════════════════════
#  Anon DNSMapping
#  GitHub: https://github.com/Anon-Core
#  Advanced DNS mapping tool for local development and testing
#═══════════════════════════════════════════════════════════════════════════════

set -euo pipefail

# Colors
readonly RED='\033[0;31m'
readonly BRED='\033[1;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly BLUE='\033[0;34m'
readonly CYAN='\033[0;36m'
readonly GRAY='\033[0;90m'
readonly NC='\033[0m'

# Config
readonly HOSTS_FILE="/etc/hosts"
readonly BACKUP_FILE="/etc/hosts.anon.backup"
readonly MARKER="# ANON-DNSMAPPING"

#═══════════════════════════════════════════════════════════════════════════════
# Banner
#═══════════════════════════════════════════════════════════════════════════════
print_banner() {
    clear
    echo -e "${BRED}"
    cat << "EOF"
    ╔═══════════════════════════════════════════════════════════╗
    ║                                                           ║
    ║     █████╗ ███╗   ██╗ ██████╗ ███╗   ██╗                ║
    ║    ██╔══██╗████╗  ██║██╔═══██╗████╗  ██║                ║
    ║    ███████║██╔██╗ ██║██║   ██║██╔██╗ ██║                ║
    ║    ██╔══██║██║╚██╗██║██║   ██║██║╚██╗██║                ║
    ║    ██║  ██║██║ ╚████║╚██████╔╝██║ ╚████║                ║
    ║    ╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═══╝                ║
    ║                                                           ║
    ║              D N S   M A P P I N G                        ║
    ║                                                           ║
    ╚═══════════════════════════════════════════════════════════╝
EOF
    echo -e "${NC}"
    echo -e "${GRAY}    GitHub: https://github.com/Anon-Core${NC}"
    echo -e "${GRAY}    Advanced DNS Mapping Tool${NC}"
    echo ""
}

#═══════════════════════════════════════════════════════════════════════════════
# Logging
#═══════════════════════════════════════════════════════════════════════════════
log_info() {
    echo -e "${CYAN}[*]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[✓]${NC} $1"
}

log_error() {
    echo -e "${RED}[✗]${NC} $1" >&2
}

log_warning() {
    echo -e "${YELLOW}[!]${NC} $1"
}

#═══════════════════════════════════════════════════════════════════════════════
# Validation
#═══════════════════════════════════════════════════════════════════════════════
validate_ip() {
    local ip=$1
    if [[ $ip =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
        local IFS='.'
        local -a octets=($ip)
        for octet in "${octets[@]}"; do
            if ((octet > 255)); then
                return 1
            fi
        done
        return 0
    fi
    return 1
}

validate_domain() {
    local domain=$1
    # Remove protocol if present
    domain=$(echo "$domain" | sed -E 's|^https?://||' | sed 's|/.*||')
    
    if [[ $domain =~ ^([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,}$ ]]; then
        echo "$domain"
        return 0
    fi
    return 1
}

check_root() {
    if [[ $EUID -ne 0 ]]; then
        log_error "This script must be run as root (use sudo)"
        exit 1
    fi
}

#═══════════════════════════════════════════════════════════════════════════════
# Core Functions
#═══════════════════════════════════════════════════════════════════════════════
backup_hosts() {
    if [[ ! -f "$BACKUP_FILE" ]]; then
        log_info "Creating backup of hosts file..."
        cp "$HOSTS_FILE" "$BACKUP_FILE"
        log_success "Backup created at $BACKUP_FILE"
    fi
}

add_mapping() {
    local url=$1
    local ip=$2
    
    # Validate IP
    if ! validate_ip "$ip"; then
        log_error "Invalid IP address: $ip"
        exit 1
    fi
    
    # Extract and validate domain
    local domain
    if ! domain=$(validate_domain "$url"); then
        log_error "Invalid domain: $url"
        exit 1
    fi
    
    log_info "Processing DNS mapping..."
    echo -e "${GRAY}  Domain: ${CYAN}$domain${NC}"
    echo -e "${GRAY}  IP:     ${CYAN}$ip${NC}"
    echo ""
    
    # Backup first
    backup_hosts
    
    # Remove existing mapping if present
    if grep -q "$domain" "$HOSTS_FILE"; then
        log_warning "Existing mapping found, updating..."
        sed -i.tmp "/$domain/d" "$HOSTS_FILE"
    fi
    
    # Add new mapping
    echo "" >> "$HOSTS_FILE"
    echo "$MARKER - $(date '+%Y-%m-%d %H:%M:%S')" >> "$HOSTS_FILE"
    echo "$ip    $domain" >> "$HOSTS_FILE"
    
    log_success "DNS mapping added successfully"
    echo ""
    echo -e "${GREEN}╔═══════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║  Mapping Active:                                      ║${NC}"
    echo -e "${GREEN}║  ${CYAN}$domain${GREEN} → ${CYAN}$ip${GREEN}$(printf '%*s' $((47 - ${#domain} - ${#ip})) '')║${NC}"
    echo -e "${GREEN}╚═══════════════════════════════════════════════════════╝${NC}"
    echo ""
    
    # Flush DNS cache
    flush_dns_cache
}

remove_mapping() {
    local domain=$1
    
    if ! domain=$(validate_domain "$domain"); then
        log_error "Invalid domain: $domain"
        exit 1
    fi
    
    if ! grep -q "$domain" "$HOSTS_FILE"; then
        log_warning "No mapping found for: $domain"
        exit 0
    fi
    
    log_info "Removing DNS mapping for: $domain"
    sed -i.tmp "/$domain/d" "$HOSTS_FILE"
    sed -i.tmp "/$MARKER.*$(date '+%Y-%m-%d')/d" "$HOSTS_FILE"
    
    log_success "Mapping removed successfully"
    flush_dns_cache
}

list_mappings() {
    log_info "Current Anon DNS Mappings:"
    echo ""
    
    local found=0
    while IFS= read -r line; do
        if [[ $line =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+[[:space:]]+[a-zA-Z] ]]; then
            local ip=$(echo "$line" | awk '{print $1}')
            local domain=$(echo "$line" | awk '{print $2}')
            echo -e "  ${CYAN}$domain${NC} ${GRAY}→${NC} ${YELLOW}$ip${NC}"
            found=1
        fi
    done < <(grep -A1 "$MARKER" "$HOSTS_FILE" 2>/dev/null || true)
    
    if [[ $found -eq 0 ]]; then
        echo -e "  ${GRAY}No mappings found${NC}"
    fi
    echo ""
}

restore_backup() {
    if [[ ! -f "$BACKUP_FILE" ]]; then
        log_error "No backup file found"
        exit 1
    fi
    
    log_info "Restoring hosts file from backup..."
    cp "$BACKUP_FILE" "$HOSTS_FILE"
    log_success "Hosts file restored"
    flush_dns_cache
}

flush_dns_cache() {
    log_info "Flushing DNS cache..."
    
    if command -v systemd-resolve &> /dev/null; then
        systemd-resolve --flush-caches 2>/dev/null || true
    elif command -v resolvectl &> /dev/null; then
        resolvectl flush-caches 2>/dev/null || true
    fi
    
    # Restart network services if available
    if command -v systemctl &> /dev/null; then
        systemctl restart NetworkManager 2>/dev/null || true
        systemctl restart systemd-resolved 2>/dev/null || true
    fi
    
    log_success "DNS cache flushed"
}

#═══════════════════════════════════════════════════════════════════════════════
# Usage
#═══════════════════════════════════════════════════════════════════════════════
usage() {
    print_banner
    cat << EOF
${CYAN}Usage:${NC}
  $0 -dnsmapping -u <URL> -i <IP>     Add DNS mapping
  $0 -remove -u <URL>                  Remove DNS mapping
  $0 -list                             List all mappings
  $0 -restore                          Restore from backup
  $0 -flush                            Flush DNS cache

${CYAN}Examples:${NC}
  ${GRAY}# Map domain to localhost${NC}
  sudo $0 -dnsmapping -u http://andromeda.net -i 127.0.0.1

  ${GRAY}# Map to custom IP${NC}
  sudo $0 -dnsmapping -u https://test.local -i 192.168.1.100

  ${GRAY}# Remove mapping${NC}
  sudo $0 -remove -u andromeda.net

  ${GRAY}# List all mappings${NC}
  sudo $0 -list

${CYAN}Options:${NC}
  -dnsmapping    Add new DNS mapping
  -u, --url      Target URL/domain
  -i, --ip       IP address to map to
  -remove        Remove existing mapping
  -list          Show all current mappings
  -restore       Restore original hosts file
  -flush         Flush DNS cache
  -h, --help     Show this help message

EOF
}

#═══════════════════════════════════════════════════════════════════════════════
# Main
#═══════════════════════════════════════════════════════════════════════════════
main() {
    print_banner
    
    if [[ $# -eq 0 ]]; then
        usage
        exit 0
    fi
    
    local action=""
    local url=""
    local ip=""
    
    while [[ $# -gt 0 ]]; do
        case $1 in
            -dnsmapping)
                action="add"
                shift
                ;;
            -u|--url)
                url="$2"
                shift 2
                ;;
            -i|--ip)
                ip="$2"
                shift 2
                ;;
            -remove)
                action="remove"
                shift
                ;;
            -list)
                action="list"
                shift
                ;;
            -restore)
                action="restore"
                shift
                ;;
            -flush)
                action="flush"
                shift
                ;;
            -h|--help)
                usage
                exit 0
                ;;
            *)
                log_error "Unknown option: $1"
                usage
                exit 1
                ;;
        esac
    done
    
    check_root
    
    case $action in
        add)
            if [[ -z "$url" || -z "$ip" ]]; then
                log_error "Both -u (URL) and -i (IP) are required for DNS mapping"
                exit 1
            fi
            add_mapping "$url" "$ip"
            ;;
        remove)
            if [[ -z "$url" ]]; then
                log_error "URL (-u) is required for removal"
                exit 1
            fi
            remove_mapping "$url"
            ;;
        list)
            list_mappings
            ;;
        restore)
            restore_backup
            ;;
        flush)
            flush_dns_cache
            ;;
        *)
            log_error "No valid action specified"
            usage
            exit 1
            ;;
    esac
}

main "$@"
