#!/bin/bash
# JAY TUNNELING - Settings Menu

R='\033[0;31m' G='\033[0;32m' Y='\033[0;33m' B='\033[0;34m' P='\033[0;35m' C='\033[0;36m' W='\033[1;37m' NC='\033[0m'

show_menu() {
    clear
    echo -e "${C}╔══════════════════════════════════════════════════════╗${NC}"
    echo -e "${C}║${NC}            ${Y}★ SETTINGS MENU ★${NC}                        ${C}║${NC}"
    echo -e "${C}╠══════════════════════════════════════════════════════╣${NC}"
    echo -e "${C}║${NC}                                                        ${C}║${NC}"
    echo -e "${C}║${NC}  ${G}┌─── DOMAIN & SSL ────────────────────────────────┐${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${G}│${NC}  ${W}1${NC}  ➜  Change Domain                          ${G}│${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${G}│${NC}  ${W}2${NC}  ➜  Renew SSL Certificate                  ${G}│${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${G}│${NC}  ${W}3${NC}  ➜  DNS Manager                            ${G}│${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${G}└──────────────────────────────────────────────────┘${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}                                                        ${C}║${NC}"
    echo -e "${C}║${NC}  ${B}┌─── SYSTEM ──────────────────────────────────────┐${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${B}│${NC}  ${W}4${NC}  ➜  Restart All Services                   ${B}│${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${B}│${NC}  ${W}5${NC}  ➜  Speedtest                              ${B}│${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${B}│${NC}  ${W}6${NC}  ➜  Bandwidth Monitor                      ${B}│${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${B}│${NC}  ${W}7${NC}  ➜  Auto Reboot Setting                    ${B}│${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${B}└──────────────────────────────────────────────────┘${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}                                                        ${C}║${NC}"
    echo -e "${C}║${NC}  ${P}┌─── BACKUP ──────────────────────────────────────┐${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${P}│${NC}  ${W}8${NC}  ➜  Backup VPS                             ${P}│${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${P}│${NC}  ${W}9${NC}  ➜  Restore VPS                            ${P}│${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${P}└──────────────────────────────────────────────────┘${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}                                                        ${C}║${NC}"
    echo -e "${C}║${NC}  ${R}│${NC}  ${W}0${NC}  ➜  Back to Main Menu                       ${R}│${NC}  ${C}║${NC}"
    echo -e "${C}╚══════════════════════════════════════════════════════╝${NC}"
    echo ""
}

while true; do
    show_menu
    read -p "  Select [0-9]: " opt
    case $opt in
        1) clear ; m-domain ;; 2) clear ; crt ;; 3) clear ; m-dns ;;
        4) clear ; restart ;; 5) clear ; speedtest-cli --share ;;
        6) clear ; bw ;; 7) clear ; auto-reboot ;;
        8) clear ; echo "Backup coming soon" ;; 9) clear ; echo "Restore coming soon" ;;
        0) break ;;
        *) echo -e "${R}Invalid!${NC}"; sleep 1 ;;
    esac
    [[ $opt != "0" ]] && read -p "  Press Enter..."
done
