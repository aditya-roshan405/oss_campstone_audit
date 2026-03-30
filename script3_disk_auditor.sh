#!/bin/bash
# ============================================================
# Script 3: Disk and Permission Auditor
# Author: [Your Name] | Reg No: [Your Reg No]
# Course: Open Source Software | OSS NGMC Capstone
# Software Audited: Git (GPL v2)
# ============================================================

# Array of important Linux system directories to audit
# Includes /usr/lib/git-core — Git's own auxiliary directory
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/usr/lib/git-core" "/usr/share/git-core")

echo "======================================================"
echo " Directory Audit Report"
echo "======================================================"
# printf for aligned column headers
printf "%-30s %-12s %-10s %-10s\n" "DIRECTORY" "PERMISSIONS" "OWNER" "SIZE"
echo "------------------------------------------------------"

# --- for loop: iterate over each directory in the array ---
for DIR in "${DIRS[@]}"; do
    # Check if the directory exists using -d flag
    if [ -d "$DIR" ]; then
        # awk '{print $1}' extracts the permission bits (e.g. drwxr-xr-x)
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')

        # awk '{print $3}' extracts the owner username from ls -ld output
        OWNER=$(ls -ld "$DIR" | awk '{print $3}')

        # du -sh gives human-readable size; cut -f1 extracts just the size number
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        # printf for aligned tabular output
        printf "%-30s %-12s %-10s %-10s\n" "$DIR" "$PERMS" "$OWNER" "${SIZE:-N/A}"
    else
        # Directory not found on this system
        printf "%-30s %s\n" "$DIR" "[NOT FOUND on this system]"
    fi
done

echo ""
echo "--- Git-Specific Configuration Check ---"

# Check for Git's system-wide config file
GIT_SYSTEM_CONFIG="/etc/gitconfig"
if [ -f "$GIT_SYSTEM_CONFIG" ]; then
    echo "System gitconfig found: $GIT_SYSTEM_CONFIG"
    # awk extracts permissions, owner, and group fields from ls output
    echo "Permissions: $(ls -l "$GIT_SYSTEM_CONFIG" | awk '{print $1, $3, $4}')"
else
    echo "No system-wide /etc/gitconfig found (normal on fresh installations)."
fi

# Check for user-level gitconfig in home directory
USER_GIT_CONFIG="$HOME/.gitconfig"
if [ -f "$USER_GIT_CONFIG" ]; then
    echo ""
    echo "User gitconfig found: $USER_GIT_CONFIG"
    echo "Permissions: $(ls -l "$USER_GIT_CONFIG" | awk '{print $1, $3, $4}')"
    echo "Contents:"
    cat "$USER_GIT_CONFIG"
else
    echo "No user-level ~/.gitconfig found."
    echo "Set one up with: git config --global user.name 'Your Name'"
fi

echo "======================================================"
