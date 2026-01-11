#!/bin/bash
# =========================================
# JAY TUNNELING - SSH & OpenVPN Menu
# =========================================

# Colors
R='\033[0;31m'
G='\033[0;32m'
Y='\033[0;33m'
B='\033[0;34m'
P='\033[0;35m'
C='\033[0;36m'
W='\033[1;37m'
NC='\033[0m'

show_ssh_menu() {
    clear
    echo -e "${C}╔══════════════════════════════════════════════════════╗${NC}"
    echo -e "${C}║${NC}           ${Y}★ SSH & OPENVPN MENU ★${NC}                    ${C}║${NC}"
    echo -e "${C}╠══════════════════════════════════════════════════════╣${NC}"
    echo -e "${C}║${NC}                                                        ${C}║${NC}"
    echo -e "${C}║${NC}  ${G}┌─── AKUN SSH ────────────────────────────────────┐${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${G}│${NC}  ${W}1${NC}  ➜  Create SSH Account                      ${G}│${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${G}│${NC}  ${W}2${NC}  ➜  Trial SSH Account                       ${G}│${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${G}│${NC}  ${W}3${NC}  ➜  Renew SSH Account                       ${G}│${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${G}│${NC}  ${W}4${NC}  ➜  Delete SSH Account                      ${G}│${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${G}│${NC}  ${W}5${NC}  ➜  Check User Login                        ${G}│${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${G}│${NC}  ${W}6${NC}  ➜  List All Members                        ${G}│${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${G}│${NC}  ${W}7${NC}  ➜  Delete Expired                          ${G}│${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${G}└──────────────────────────────────────────────────┘${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}                                                        ${C}║${NC}"
    echo -e "${C}║${NC}  ${B}┌─── SECURITY ────────────────────────────────────┐${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${B}│${NC}  ${W}8${NC}  ➜  Lock / Unlock User                      ${B}│${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${B}│${NC}  ${W}9${NC}  ➜  Check User Limit                        ${B}│${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${B}│${NC}  ${W}10${NC} ➜  AutoKill Multi-Login                    ${B}│${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${B}│${NC}  ${W}11${NC} ➜  AutoKick SSH                            ${B}│${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${B}└──────────────────────────────────────────────────┘${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}                                                        ${C}║${NC}"
    echo -e "${C}║${NC}  ${P}┌─── TOOLS ───────────────────────────────────────┐${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${P}│${NC}  ${W}12${NC} ➜  Restart All Services                    ${P}│${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${P}│${NC}  ${W}13${NC} ➜  Change Password                         ${P}│${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${P}│${NC}  ${W}14${NC} ➜  BadVPN Manager                          ${P}│${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${P}└──────────────────────────────────────────────────┘${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}                                                        ${C}║${NC}"
    echo -e "${C}║${NC}  ${R}┌─────────────────────────────────────────────────┐${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${R}│${NC}  ${W}0${NC}  ➜  Back to Main Menu                       ${R}│${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}  ${R}└─────────────────────────────────────────────────┘${NC}  ${C}║${NC}"
    echo -e "${C}║${NC}                                                        ${C}║${NC}"
    echo -e "${C}╚══════════════════════════════════════════════════════╝${NC}"
    echo ""
}

ssh_menu_loop() {
    while true; do
        show_ssh_menu
        read -p "  Select [0-14]: " opt
        
        case $opt in
            1) clear ; usernew ;;
            2) clear ; trial ;;
            3) clear ; renew ;;
            4) clear ; delete ;;
            5) clear ; cek ;;
            6) clear ; member ;;
            7) clear ; xp ;;
            8) clear ; lock-unlock ;;
            9) clear ; ceklim ;;
            10) clear ; autokill ;;
            11) clear ; autokick ;;
            12) clear ; restart ;;
            13) clear ; password ;;
            14) clear ; m-badvpn ;;
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

ssh_menu_loop
