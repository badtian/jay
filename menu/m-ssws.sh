#!/bin/bash
# JAY TUNNELING - Shadowsocks Menu

R='\033[0;31m' G='\033[0;32m' Y='\033[0;33m' B='\033[0;34m' C='\033[0;36m' W='\033[1;37m' NC='\033[0m'

show_menu() {
    clear
    echo -e "${C}╔══════════════════════════════════════════════════════╗${NC}"
    echo -e "${C}║${NC}          ${Y}★ SHADOWSOCKS MENU ★${NC}                       ${C}║${NC}"
    echo -e "${C}╠══════════════════════════════════════════════════════╣${NC}"
    echo -e "${C}║${NC}  ${G}┌─── ACCOUNT MANAGEMENT ──────────────────────────┐${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${G}│${NC}  ${W}1${NC}  ➜  Create Shadowsocks Account              ${G}│${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${G}│${NC}  ${W}2${NC}  ➜  Trial Shadowsocks Account               ${G}│${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${G}│${NC}  ${W}3${NC}  ➜  Renew Shadowsocks Account               ${G}│${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${G}│${NC}  ${W}4${NC}  ➜  Delete Shadowsocks Account              ${G}│${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${G}│${NC}  ${W}5${NC}  ➜  Check User Login                        ${G}│${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${G}└──────────────────────────────────────────────────┘${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${R}│${NC}  ${W}0${NC}  ➜  Back to Main Menu                       ${R}│${NC}  ${C}║${NC}"
    echo -e "${C}╚══════════════════════════════════════════════════════╝${NC}"
    echo ""
}

while true; do
    show_menu
    read -p "  Select [0-5]: " opt
    case $opt in
        1) clear ; add-ssws ;; 2) clear ; trial-ssws ;; 3) clear ; renew-ssws ;;
        4) clear ; del-ssws ;; 5) clear ; cek-ssws ;; 0) break ;;
        *) echo -e "${R}Invalid!${NC}"; sleep 1 ;;
    esac
    [[ $opt != "0" ]] && read -p "  Press Enter..."
done
