#!/bin/bash
# ============================================================
# Script 1: System Identity Report
# Author: [Your Name] | Reg No: [Your Reg No]
# Course: Open Source Software | OSS NGMC Capstone
# Software Audited: Git (GPL v2)
# ============================================================

# --- Variables (fill in your name and software choice) ---
STUDENT_NAME="Your Name Here"
SOFTWARE_CHOICE="Git (GPL v2)"

# --- Gather system information using command substitution $() ---
KERNEL=$(uname -r)                                       # Linux kernel version
USER_NAME=$(whoami)                                      # Current logged-in user
HOME_DIR=$HOME                                           # User home directory path
UPTIME=$(uptime -p)                                      # Uptime in human-readable form
DATETIME=$(date "+%A, %d %B %Y  %H:%M:%S")              # Full formatted date and time

# Detect distro name — tries lsb_release first, falls back to /etc/os-release
if command -v lsb_release &>/dev/null; then
    DISTRO=$(lsb_release -ds)
elif [ -f /etc/os-release ]; then
    DISTRO=$(grep '^PRETTY_NAME' /etc/os-release | cut -d= -f2 | tr -d '"')
else
    DISTRO="Unknown Linux Distribution"
fi

# The Linux kernel is licensed under GNU GPL v2 — same as Git
OS_LICENSE="GNU General Public License version 2 (GPL v2)"

# --- Display formatted welcome screen ---
echo "=============================================="
echo "   Open Source Audit — $STUDENT_NAME"
echo "   Software: $SOFTWARE_CHOICE"
echo "=============================================="
echo "Distribution : $DISTRO"
echo "Kernel       : $KERNEL"
echo "User         : $USER_NAME"
echo "Home Dir     : $HOME_DIR"
echo "Uptime       : $UPTIME"
echo "Date/Time    : $DATETIME"
echo "----------------------------------------------"
echo "OS License   : $OS_LICENSE"
echo "=============================================="
echo ""
echo "This system runs open-source software."
echo "You are free to use, study, modify, and"
echo "redistribute it under the terms of the GPL."
echo "=============================================="
