#!/bin/bash
# ============================================================
# Script 5: Open Source Manifesto Generator
# Author: [Your Name] | Reg No: [Your Reg No]
# Course: Open Source Software | OSS NGMC Capstone
# Software Audited: Git (GPL v2)
# ============================================================

# Alias concept (illustrated via comment — add to ~/.bashrc to use):
# alias manifesto='bash ~/scripts/script5_manifesto.sh'
# After adding it, you can run this script just by typing: manifesto

echo "================================================"
echo "   Open Source Manifesto Generator"
echo "================================================"
echo "Answer three questions to generate your personal"
echo "open-source philosophy statement."
echo ""

# --- User input using the read command ---
# -p flag displays a prompt on the same line as the input cursor
read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

echo ""
echo "Generating your manifesto..."
echo ""

# --- Capture the current date using command substitution ---
DATE=$(date '+%d %B %Y')

# Output filename is personalised using the current username ($USER or whoami)
OUTPUT="manifesto_$(whoami).txt"

# --- Write the manifesto to file ---
# > creates/overwrites the file; >> appends to it
echo "========================================" > "$OUTPUT"
echo "MY OPEN SOURCE MANIFESTO"               >> "$OUTPUT"
echo "Generated: $DATE"                        >> "$OUTPUT"
echo "========================================" >> "$OUTPUT"
echo ""                                         >> "$OUTPUT"

# --- String concatenation: build the manifesto paragraph piece by piece ---
# Each line reassigns MANIFESTO, appending the new sentence to the existing string
MANIFESTO="Every day, I rely on $TOOL —"
MANIFESTO="$MANIFESTO a tool built not for profit, but for people."
MANIFESTO="$MANIFESTO To me, freedom means $FREEDOM,"
MANIFESTO="$MANIFESTO and open source is where that freedom lives in software."
MANIFESTO="$MANIFESTO If I could build one thing and give it away, it would be $BUILD."
MANIFESTO="$MANIFESTO Because the greatest thing a developer can do"
MANIFESTO="$MANIFESTO is put something into the world that makes someone else's life easier,"
MANIFESTO="$MANIFESTO and ask for nothing in return."
MANIFESTO="$MANIFESTO That is the spirit of open source."
MANIFESTO="$MANIFESTO That is why Git exists. That is why Linux exists."
MANIFESTO="$MANIFESTO And that is why I write code."

# Write the assembled paragraph to the output file
echo "$MANIFESTO"    >> "$OUTPUT"
echo ""              >> "$OUTPUT"
echo "— $(whoami), $DATE" >> "$OUTPUT"
echo "========================================" >> "$OUTPUT"

# --- Display the finished manifesto ---
echo "Manifesto saved to: $OUTPUT"
echo ""
# cat reads and prints the contents of the saved file
cat "$OUTPUT"
