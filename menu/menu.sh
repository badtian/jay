#!/bin/bash
# =========================================
# JAY TUNNELING - Main Menu
# Premium VPS Management System
# =========================================

# Color definitions
R='\033[0;31m'
G='\033[0;32m'
Y='\033[0;33m'
B='\033[0;34m'
P='\033[0;35m'
C='\033[0;36m'
W='\033[1;37m'
NC='\033[0m'

# Box characters
BL='┌' BR='┐' TL='└' TR='┘' H='─' V='│' LT='├' RT='┤' TT='┬' BT='┴' X='┼'

# Function to get IP with fallbacks
get_ip() {
    ip=$(curl -s -4 --connect-timeout 5 ifconfig.me 2>/dev/null || \
         wget -qO- --timeout=5 ipv4.icanhazip.com 2>/dev/null || \
         echo "Unknown")
    echo "$ip"
}

# Function to get domain safely
get_domain() {
    if [[ -f "/usr/local/etc/xray/domain" ]]; then
        domain=$(cat /usr/local/etc/xray/domain 2>/dev/null | head -n1)
    elif [[ -f "/root/domain" ]]; then
        domain=$(cat /root/domain 2>/dev/null | head -n1)
    else
        domain="Not Set"
    fi
    echo "$domain"
}

# Check certificate status
check_cert_status() {
    local domain=$1
    local cert_file="$HOME/.acme.sh/${domain}_ecc/${domain}.key"
    
    if [[ ! -f "$cert_file" ]]; then
        echo "${R}Not Found${NC}"
        return
    fi
    
    if modifyTime=$(stat -c %y "$cert_file" 2>/dev/null); then
        modifyTime1=$(date +%s -d "$modifyTime")
        currentTime=$(date +%s)
        stampDiff=$((currentTime - modifyTime1))
        days=$((stampDiff / 86400))
        remainingDays=$((90 - days))
        
        if [[ $remainingDays -le 7 ]]; then
            echo "${R}${remainingDays} days${NC}"
        elif [[ $remainingDays -le 30 ]]; then
            echo "${Y}${remainingDays} days${NC}"
        else
            echo "${G}${remainingDays} days${NC}"
        fi
    else
        echo "${Y}Unknown${NC}"
    fi
}

# Service status indicator
svc_status() {
    if systemctl is-active --quiet "$1" 2>/dev/null; then
        echo -e "${G}●${NC}"
    else
        echo -e "${R}○${NC}"
    fi
}

# Display header
display_header() {
    clear
    MYIP=$(get_ip)
    domain=$(get_domain)
    tlsStatus=$(check_cert_status "$domain")
    uptime=$(uptime -p | sed 's/up //')
    DATE=$(date '+%a, %d %b %Y %H:%M:%S')
    
    # Memory info
    tram=$(free -m | awk 'NR==2 {print $2}')
    uram=$(free -m | awk 'NR==2 {print $3}')
    fram=$(free -m | awk 'NR==2 {print $4}')
    ram_pct=$((uram * 100 / tram))
    
    # OS info
    os_info=$(hostnamectl | grep "Operating System" | cut -d ' ' -f5- | cut -c1-25)
    
    # CPU usage
    cpu=$(top -bn1 | grep "Cpu(s)" | awk '{printf "%.1f%%", 100 - $8}')
    
    echo -e "${C}╔══════════════════════════════════════════════════════╗${NC}"
    echo -e "${C}║${NC}              ${Y}★ JAY TUNNELING ★${NC}                      ${C}║${NC}"
    echo -e "${C}║${NC}          ${W}Premium VPS Management${NC}                     ${C}║${NC}"
    echo -e "${C}╠══════════════════════════════════════════════════════╣${NC}"
    echo -e "${C}║${NC}  ${W}OS${NC}      : ${G}${os_info}${NC}"
    echo -e "${C}║${NC}  ${W}IP${NC}      : ${G}${MYIP}${NC}"
    echo -e "${C}║${NC}  ${W}Domain${NC}  : ${G}${domain}${NC}"
    echo -e "${C}║${NC}  ${W}SSL${NC}     : ${tlsStatus}"
    echo -e "${C}║${NC}  ${W}Uptime${NC}  : ${G}${uptime:0:20}${NC}"
    echo -e "${C}╠══════════════════════════════════════════════════════╣${NC}"
    echo -e "${C}║${NC}  ${W}RAM${NC}     : ${G}${uram}MB${NC} / ${tram}MB (${Y}${ram_pct}%${NC})"
    echo -e "${C}║${NC}  ${W}CPU${NC}     : ${G}${cpu}${NC}"
    echo -e "${C}║${NC}  ${W}Time${NC}    : ${G}${DATE}${NC}"
    echo -e "${C}╠══════════════════════════════════════════════════════╣${NC}"
    echo -e "${C}║${NC}  SSH:$(svc_status ssh) ${V} DROP:$(svc_status dropbear) ${V} NGINX:$(svc_status nginx) ${V} XRAY:$(svc_status xray)"
    echo -e "${C}╚══════════════════════════════════════════════════════╝${NC}"
}

# Display menu
display_menu() {
    echo ""
    echo -e "  ${Y}┌────────────── PROTOKOL ──────────────┐${NC}"
    echo -e "  ${Y}│${NC}  ${W}1${NC} ${H}${H} SSH & OpenVPN                    ${Y}│${NC}"
    echo -e "  ${Y}│${NC}  ${W}2${NC} ${H}${H} Vmess                            ${Y}│${NC}"
    echo -e "  ${Y}│${NC}  ${W}3${NC} ${H}${H} Vless                            ${Y}│${NC}"
    echo -e "  ${Y}│${NC}  ${W}4${NC} ${H}${H} Trojan                           ${Y}│${NC}"
    echo -e "  ${Y}│${NC}  ${W}5${NC} ${H}${H} Shadowsocks                      ${Y}│${NC}"
    echo -e "  ${Y}└───────────────────────────────────────┘${NC}"
    echo ""
    echo -e "  ${B}┌────────────── SYSTEM ────────────────┐${NC}"
    echo -e "  ${B}│${NC}  ${W}6${NC} ${H}${H} Settings & Domain               ${B}│${NC}"
    echo -e "  ${B}│${NC}  ${W}7${NC} ${H}${H} TOR Browser                     ${B}│${NC}"
    echo -e "  ${B}│${NC}  ${W}8${NC} ${H}${H} Xray Log                        ${B}│${NC}"
    echo -e "  ${B}│${NC}  ${W}9${NC} ${H}${H} Service Status                  ${B}│${NC}"
    echo -e "  ${B}└───────────────────────────────────────┘${NC}"
    echo ""
    echo -e "  ${P}┌────────────── TOOLS ─────────────────┐${NC}"
    echo -e "  ${P}│${NC}  ${W}10${NC} ${H} Clear RAM Cache                  ${P}│${NC}"
    echo -e "  ${P}│${NC}  ${W}11${NC} ${H} Reboot VPS                       ${P}│${NC}"
    echo -e "  ${P}│${NC}  ${R}x${NC}  ${H} Exit                             ${P}│${NC}"
    echo -e "  ${P}└───────────────────────────────────────┘${NC}"
    echo ""
}

# Clear RAM cache
clear_ram_cache() {
    echo -e "${Y}Clearing RAM cache...${NC}"
    sync
    echo 3 > /proc/sys/vm/drop_caches
    sleep 1
    echo -e "${G}✓ RAM cache cleared!${NC}"
    sleep 2
}

# Safe reboot
safe_reboot() {
    echo -e "${Y}Rebooting in 3 seconds...${NC}"
    sleep 3
    /sbin/reboot
}

# Main menu function
main_menu() {
    while true; do
        display_header
        display_menu
        
        read -p "  Select [1-11 or x]: " opt
        
        case $opt in
            1) clear ; m-sshovpn ;;
            2) clear ; m-vmess ;;
            3) clear ; m-vless ;;
            4) clear ; m-trojan ;;
            5) clear ; m-ssws ;;
            6) clear ; m-system ;;
            7) clear ; m-tor ;;
            8) clear ; xray-log ;;
            9) clear ; running ;;
            10) clear ; clear_ram_cache ;;
            11) clear ; safe_reboot ;;
            x|X) 
                echo -e "${G}Goodbye!${NC}"
                exit 0 
                ;;
            *) 
                echo -e "${R}Invalid option!${NC}"
                sleep 1
                ;;
        esac
        
        if [[ $opt != "x" ]] && [[ $opt != "X" ]]; then
            echo ""
            read -p "  Press Enter to continue..."
        fi
    done
}

# Main execution
main_menu
