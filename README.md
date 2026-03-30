HEAD
# oss_campstone_audit

# OSS Audit — Git (Version Control System)
### Open Source Software | OSS NGMC Capstone Project

---

## Student Details

| Field | Details |
|---|---|
| **Student Name** | Your Name Here |
| **Registration Number** | Your Reg No Here |
| **Course** | Open Source Software (OSS NGMC) |
| **Software Audited** | Git — Version Control System |
| **License** | GNU General Public License v2 (GPL v2) |

---

## About This Project

This repository contains the five shell scripts submitted as part of the **Open Source Audit** capstone project. The project audits **Git**, one of the most widely used open-source tools in the world, examining its origin story, license, Linux footprint, FOSS ecosystem, and comparison against proprietary alternatives.

The full written report (12–16 pages) is submitted separately as a PDF on the VITyarthi portal.

---

## Repository Structure

```
oss-audit-[rollnumber]/
│
├── README.md                        ← This file
├── script1_system_identity.sh       ← System Identity Report
├── script2_package_inspector.sh     ← FOSS Package Inspector
├── script3_disk_auditor.sh          ← Disk and Permission Auditor
├── script4_log_analyzer.sh          ← Log File Analyzer
└── script5_manifesto.sh             ← Open Source Manifesto Generator
```

---

## Script Descriptions

### Script 1 — System Identity Report
**File:** `script1_system_identity.sh`

Displays a formatted welcome screen showing key system information: Linux distribution name, kernel version, logged-in user, home directory, system uptime, current date/time, and the open-source license that covers the operating system.

**Concepts used:** Variables, command substitution `$()`, `echo` formatting, `uname`, `whoami`, `uptime`, `date`, `lsb_release`

---

### Script 2 — FOSS Package Inspector
**File:** `script2_package_inspector.sh`

Checks whether Git is installed on the system using both `rpm` (RHEL/Fedora) and `dpkg` (Debian/Ubuntu). If installed, it retrieves the version, license, and summary. A `case` statement prints a one-line philosophy note about the package.

**Concepts used:** `if-then-else`, `case` statement, `rpm -qi`, `dpkg -l`, `apt-cache show`, pipe with `grep`

---

### Script 3 — Disk and Permission Auditor
**File:** `script3_disk_auditor.sh`

Loops through a list of important Linux system directories (including Git's own directories) and reports the permissions, owner, and disk usage of each. Also checks for Git's configuration files.

**Concepts used:** `for` loop with arrays, `-d` directory check, `ls -ld`, `awk`, `du -sh`, `cut`, `printf` for formatted output

---

### Script 4 — Log File Analyzer
**File:** `script4_log_analyzer.sh`

Reads a log file line by line, counts how many lines contain a given keyword, and prints the last 5 matching lines. Accepts the log file path and keyword as command-line arguments. Includes a retry loop if the file is not found immediately.

**Concepts used:** `while read` loop, `if-then`, counter variables with `$(( ))`, command-line arguments `$1` and `$2`, default values `${2:-default}`, `grep`, `tail`

---

### Script 5 — Open Source Manifesto Generator
**File:** `script5_manifesto.sh`

Interactively asks the user three questions, then composes a personalised open-source philosophy statement from their answers and saves it to a `.txt` file. The alias concept is illustrated in the comments.

**Concepts used:** `read -p` for user input, string concatenation, file output with `>` and `>>`, `date` command, `cat`, alias concept (in comments)

---

## How to Run the Scripts on Ubuntu/Linux

### Prerequisites
Make sure Git is installed before running Script 2:
```bash
sudo apt update
sudo apt install git
```

### Step 1 — Clone this repository
```bash
git clone https://github.com/yourusername/oss-audit-rollnumber.git
cd oss-audit-rollnumber
```

### Step 2 — Make all scripts executable
```bash
chmod +x script1_system_identity.sh
chmod +x script2_package_inspector.sh
chmod +x script3_disk_auditor.sh
chmod +x script4_log_analyzer.sh
chmod +x script5_manifesto.sh
```

### Step 3 — Run the scripts

**Script 1:**
```bash
bash script1_system_identity.sh
```

**Script 2:**
```bash
bash script2_package_inspector.sh
```

**Script 3:**
```bash
bash script3_disk_auditor.sh
```

**Script 4:**
```bash
bash script4_log_analyzer.sh /var/log/syslog error
```
> Replace `/var/log/syslog` with any log file path on your system.
> Replace `error` with any keyword (e.g. `warning`, `failed`, `git`).

**Script 5:**
```bash
bash script5_manifesto.sh
```
> This script is interactive — it will ask you 3 questions. Type your answers and press Enter.

---

## Dependencies

| Dependency | Used By | Install Command |
|---|---|---|
| `git` | Script 2 | `sudo apt install git` |
| `lsb-release` | Script 1 | `sudo apt install lsb-release` |
| `coreutils` | All scripts | Pre-installed on Ubuntu |
| `util-linux` | Script 1 (`uptime`) | Pre-installed on Ubuntu |

All dependencies are pre-installed on a standard Ubuntu system except `git` itself.

---

## Troubleshooting

| Problem | Solution |
|---|---|
| `Permission denied` | Run `chmod +x scriptname.sh` |
| `lsb_release not found` | Run `sudo apt install lsb-release` |
| Script 4 — file not found | Try `/var/log/auth.log` or `ls /var/log/` to find available logs |
| Script 2 — package not found | Run `sudo apt install git` first |
| Windows line ending error | Run `sed -i 's/\r//' scriptname.sh` |

---

## License

This project is submitted for academic evaluation under the VIT Open Source Software course. The shell scripts are original work by the student and are freely shareable under the spirit of open source.

---

*"Every tool you will use in your career was shaped by people who chose to build in the open and share their work freely."*
*— OSS NGMC Course, VITyarthi*
21b0aea (OSS Capstone Project DATA)
