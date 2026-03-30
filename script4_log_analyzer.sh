#!/bin/bash
# ============================================================
# Script 4: Log File Analyzer
# Author: [Your Name] | Reg No: [Your Reg No]
# Course: Open Source Software | OSS NGMC Capstone
# Software Audited: Git (GPL v2)
# Usage: ./script4_log_analyzer.sh <logfile> [keyword]
# Example: ./script4_log_analyzer.sh /var/log/syslog error
# ============================================================

# $1 = first command-line argument (log file path)
LOGFILE=$1

# $2 = second argument; ${2:-"error"} means "use $2 if given, else use 'error'"
KEYWORD=${2:-"error"}

# Counter variable — will be incremented for each matching line
COUNT=0

echo "======================================"
echo " Log File Analyzer"
echo "======================================"

# --- Validate that a log file argument was provided ---
if [ -z "$LOGFILE" ]; then
    echo "Usage: $0 <logfile> [keyword]"
    echo "Example: $0 /var/log/syslog error"
    exit 1
fi

# --- do-while style retry: attempt to find the file up to 3 times ---
# Useful when a file may be temporarily locked or still being created
ATTEMPTS=0
while [ ! -f "$LOGFILE" ] && [ $ATTEMPTS -lt 3 ]; do
    echo "Warning: $LOGFILE not found. Retrying (attempt $((ATTEMPTS+1))/3)..."
    ATTEMPTS=$((ATTEMPTS + 1))
    sleep 1  # Wait 1 second before retrying
done

# Final check after retry loop — exit if still not found
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File '$LOGFILE' not found after 3 attempts. Exiting."
    exit 1
fi

# Check if the file is empty using -s (true if file exists and has size > 0)
if [ ! -s "$LOGFILE" ]; then
    echo "Warning: '$LOGFILE' exists but is empty. Nothing to analyze."
    exit 0
fi

echo "Analyzing: $LOGFILE"
echo "Keyword:   '$KEYWORD' (case-insensitive)"
echo "--------------------------------------"

# --- while-read loop: read the log file one line at a time ---
# IFS= prevents leading/trailing whitespace from being trimmed
# -r flag prevents backslash interpretation
while IFS= read -r LINE; do
    # if-then: check if the current line contains the keyword (case-insensitive)
    # grep -iq: -i = ignore case, -q = quiet (no output, only sets exit code)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        # Increment counter using arithmetic expansion $(( ))
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"   # Redirect file into the while loop as input

# --- Print summary ---
echo "Result: Keyword '$KEYWORD' found $COUNT time(s) in $LOGFILE"
echo ""

# --- Print the last 5 lines that matched the keyword ---
# grep -i: case-insensitive match; tail -5: show only last 5 results
echo "--- Last 5 matching lines ---"
MATCHES=$(grep -i "$KEYWORD" "$LOGFILE" | tail -5)

if [ -z "$MATCHES" ]; then
    echo "(No matching lines found)"
else
    echo "$MATCHES"
fi

echo "======================================"
