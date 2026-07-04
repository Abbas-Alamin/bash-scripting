# 🐧 Linux Systems Automation & Administration (Bash Scripting)

Welcome to my System Administration repository! This repository contains production-ready **Bash Scripts** designed to automate critical Linux operations, optimize system resource monitoring, and enforce reliable backup strategies.

---

## 🛠️ Repository Contents & Logic

### 1️⃣ 📦 Automated Incremental Backup Utility (`backup.sh`)
An enterprise-grade backup solution implementing rotation and state management rather than simple blind copying.
* **Core Logic & Mechanisms:**
  * **Argument Verification:** Utilizes `$#` special parameters to enforce strict directory validation, ensuring the user passes exactly 2 targets before executing.
  * **Dynamic Incremental Storage:** Leverages `rsync` with `--backup-dir` and `--delete` flags to keep a pristine mirror in a `current/` directory while isolating modified or deleted versions inside timestamped sub-folders (`$currentdate`).
  * **Error & State Handling:** Monitors the exit status `$?` of the `rsync` pipe to dynamically log successes or push exit status code errors (`exit 2`) for missing dependencies.

### 2️⃣ 🚨 Proactive Disk Space Monitor (`monitor_space.sh`)
A lightweight telemetry script preventing critical system/database crashes due to root partition starvation.
* **Core Logic & Mechanisms:**
  * **Text Processing Pipeline:** Combines `df /`, `awk 'NR==2 {print $5}'`, and `sed` regex filtering to extract raw storage metrics into a pure integer variable.
  * **Conditional Alerting:** Evaluates system metrics against a defined static threshold (`danger=80`) using arithmetic comparison operator flags (`-gt`).

---

## 🚀 How to Run Safely
Before running any script, make sure to grant execution permissions:
```bash
chmod +x backup.sh monitor_space.sh
