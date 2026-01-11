#!/bin/bash
# =========================================
# JAY TUNNELING - Vmess Menu
# =========================================

# Colors
R='\033[0;31m'
G='\033[0;32m'
Y='\033[0;33m'
B='\033[0;34m'
C='\033[0;36m'
W='\033[1;37m'
NC='\033[0m'

show_vmess_menu() {
    clear
    echo -e "${C}╔══════════════════════════════════════════════════════╗${NC}"
    echo -e "${C}║${NC}              ${Y}★ VMESS MENU ★${NC}                         ${C}║${NC}"
    echo -e "${C}╠══════════════════════════════════════════════════════╣${NC}"
    echo -e "${C}║${NC}                                                        ${C}║${NC}"
    echo -e "${C}║${NC}  ${G}┌─── ACCOUNT MANAGEMENT ──────────────────────────┐${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${G}│${NC}  ${W}1${NC}  ➜  Create Vmess Account                    ${G}│${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${G}│${NC}  ${W}2${NC}  ➜  Trial Vmess Account                     ${G}│${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${G}│${NC}  ${W}3${NC}  ➜  Renew Vmess Account                     ${G}│${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${G}│${NC}  ${W}4${NC}  ➜  Delete Vmess Account                    ${G}│${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${G}└──────────────────────────────────────────────────┘${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}                                                        ${C}║${NC}"
    echo -e "${C}║${NC}  ${B}┌─── INFORMATION ─────────────────────────────────┐${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${B}│${NC}  ${W}5${NC}  ➜  Check User Login                        ${B}│${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${B}│${NC}  ${W}6${NC}  ➜  List All Members                        ${B}│${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${B}│${NC}  ${W}7${NC}  ➜  Delete Expired                          ${B}│${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${B}└──────────────────────────────────────────────────┘${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}                                                        ${C}║${NC}"
    echo -e "${C}║${NC}  ${R}┌─────────────────────────────────────────────────┐${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${R}│${NC}  ${W}0${NC}  ➜  Back to Main Menu                       ${R}│${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${R}└─────────────────────────────────────────────────┘${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}                                                        ${C}║${NC}"
    echo -e "${C}╚══════════════════════════════════════════════════════╝${NC}"
    echo ""
}

vmess_menu_loop() {
    while true; do
        show_vmess_menu
        read -p "  Select [0-7]: " opt
        
        case $opt in
            1) clear ; add-ws ;;
            2) clear ; trial-vmess ;;
            3) clear ; renew-ws ;;
            4) clear ; del-ws ;;
            5) clear ; cek-ws ;;
            6) clear ; cek-ws ;;
            7) clear ; cek-ws ;;
            0) return ;;
            *) 
                echo -e "${R}Invalid option!${NC}"
                sleep 1
                ;;
        esac
        
        if [[ $opt != "0" ]]; then
            echo ""
            read -p "  Press Enter to continue..."
        fi
    done
}

vmess_menu_loop
