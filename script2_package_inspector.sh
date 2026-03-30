#!/bin/bash
# ============================================================
# Script 2: FOSS Package Inspector
# Author: [Your Name] | Reg No: [Your Reg No]
# Course: Open Source Software | OSS NGMC Capstone
# Software Audited: Git (GPL v2)
# ============================================================

# Package to inspect — change to your chosen software if different
PACKAGE="git"

echo "======================================"
echo " FOSS Package Inspector"
echo "======================================"
echo "Checking package: $PACKAGE"
echo ""

# --- if-then-else: check if package is installed ---
# Tries rpm first (RHEL/Fedora), then dpkg (Debian/Ubuntu)
if rpm -q "$PACKAGE" &>/dev/null; then
    # Package found via rpm
    echo "[INSTALLED] $PACKAGE is installed on this system (rpm-based distro)."
    echo ""
    echo "--- Package Details ---"
    # Pipe rpm output through grep to extract only Version, License, Summary fields
    rpm -qi "$PACKAGE" | grep -E "^Version|^License|^Summary"

elif dpkg -l "$PACKAGE" 2>/dev/null | grep -q "^ii"; then
    # Package found via dpkg (Debian/Ubuntu)
    echo "[INSTALLED] $PACKAGE is installed on this system (dpkg-based distro)."
    echo ""
    echo "--- Package Details ---"
    # apt-cache show gives detailed info; grep filters to key fields
    apt-cache show "$PACKAGE" 2>/dev/null | grep -E "^Version:|^Section:|^Maintainer:|^Homepage:"
    echo ""
    # Also print the installed version directly
    echo "Installed version: $(git --version 2>/dev/null || echo 'version not available')"

else
    # Package not found by either method
    echo "[NOT INSTALLED] $PACKAGE was not found on this system."
    echo "To install on Debian/Ubuntu: sudo apt install $PACKAGE"
    echo "To install on RHEL/Fedora:  sudo dnf install $PACKAGE"
fi

echo ""
echo "--- Open Source Philosophy Note ---"

# --- case statement: print a philosophy note based on the package name ---
case $PACKAGE in
    git)
        echo "Git: born from the failure of proprietary tools,"
        echo "     built in weeks, used by millions ever since."
        echo "     GPL v2 ensures its freedom propagates forward."
        ;;
    httpd|apache2)
        echo "Apache HTTP Server: the web server that made the"
        echo "     open internet possible — powering ~30% of all websites."
        ;;
    mysql|mariadb)
        echo "MySQL/MariaDB: open source at the heart of millions"
        echo "     of web applications worldwide."
        ;;
    vlc)
        echo "VLC: built by students in Paris who needed a tool"
        echo "     that did not exist — now plays virtually anything."
        ;;
    python3|python)
        echo "Python: a language shaped entirely by its community,"
        echo "     for its community — the PSF license reflects that."
        ;;
    firefox)
        echo "Firefox: a nonprofit's answer to a corporate web —"
        echo "     fighting to keep browsing open and user-controlled."
        ;;
    libreoffice)
        echo "LibreOffice: born from a community fork of OpenOffice,"
        echo "     proving that communities can reclaim their tools."
        ;;
    *)
        echo "Unknown package — but if it runs on Linux,"
        echo "     it owes a debt to the open-source community."
        ;;
esac

echo "======================================"
