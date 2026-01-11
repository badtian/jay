#!/bin/bash
# JAY TUNNELING - Service Status

R='\033[0;31m' G='\033[0;32m' Y='\033[0;33m' C='\033[0;36m' W='\033[1;37m' NC='\033[0m'

svc() {
    if systemctl is-active --quiet "$1" 2>/dev/null; then
        echo -e "${G}● RUNNING${NC}"
    else
        echo -e "${R}○ STOPPED${NC}"
    fi
}

clear
echo -e "${C}╔══════════════════════════════════════════════════════╗${NC}"
echo -e "${C}║${NC}           ${Y}★ SERVICE STATUS ★${NC}                        ${C}║${NC}"
echo -e "${C}╠══════════════════════════════════════════════════════╣${NC}"
echo -e "${C}║${NC}                                                        ${C}║${NC}"
printf "${C}║${NC}  %-20s : %s\n" "SSH" "$(svc ssh)"
printf "${C}║${NC}  %-20s : %s\n" "Dropbear" "$(svc dropbear)"
printf "${C}║${NC}  %-20s : %s\n" "Stunnel" "$(svc stunnel4)"
printf "${C}║${NC}  %-20s : %s\n" "OpenVPN" "$(svc openvpn)"
printf "${C}║${NC}  %-20s : %s\n" "Nginx" "$(svc nginx)"
printf "${C}║${NC}  %-20s : %s\n" "Xray" "$(svc xray)"
printf "${C}║${NC}  %-20s : %s\n" "WS-Proxy" "$(svc ws-proxy)"
printf "${C}║${NC}  %-20s : %s\n" "Cron" "$(svc cron)"
printf "${C}║${NC}  %-20s : %s\n" "Fail2Ban" "$(svc fail2ban)"
echo -e "${C}║${NC}                                                        ${C}║${NC}"
echo -e "${C}╚══════════════════════════════════════════════════════╝${NC}"
