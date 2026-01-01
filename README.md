# 💻 Portable Remote Development Station

![VS Code](https://img.shields.io/badge/VS%20Code-007ACC?style=for-the-badge&logo=visual-studio-code&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![C++](https://img.shields.io/badge/C%2B%2B-00599C?style=for-the-badge&logo=c%2B%2B&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)

> A production-ready, containerized Integrated Development Environment (IDE) accessible via any web browser. Designed to standardize tooling across devices and provide seamless access to NAS-hosted projects.

---

## 📖 Overview

This repository defines a **Development-as-Code** environment. Instead of manually installing compilers and tools on every new laptop or tablet, this setup deploys a fully configured VS Code Server instance inside a Docker container.

It bridges the gap between local comfort and remote power, allowing for:
* **Consistency:** The exact same GCC version and Python libraries, everywhere.
* **Portability:** Code from an iPad, a low-power laptop, or a library computer.
* **Centralization:** All source code and data remain securely stored on the NAS, never synced to temporary devices.

---

## ⚡ Tech Stack & Features

| Component | Technology | Description |
| :--- | :--- | :--- |
| **Core IDE** | [code-server](https://github.com/coder/code-server) | VS Code running on a remote server, accessible via HTTP. |
| **Container** | [Docker](https://www.docker.com/) | Isolates the dev environment from the host OS. |
| **Languages** | Python 3, C++ | Pre-installed compilers (GCC/G++) and interpreters. |
| **Version Control** | Git | Integrated terminal access for full Git workflows. |
| **Storage** | Bind Mounts | Direct access to the host's physical project directories. |

### 🛠️ Pre-Installed Toolchain
The container automatically provisions the following tools on startup:
* **Python 3.x** + `pip`
* **Build Essentials:** `make`, `gcc`, `g++`, `gdb`
* **Git** for version control
* **Sudo** privileges for package management (`apt`)

---

## 🚀 Deployment Guide

### 1. Prerequisites
* A server or NAS running **Docker Engine** & **Docker Compose**.
* (Optional) **Tailscale** for secure remote access without port forwarding.

### 2. Installation
Clone the repository to your host machine:
```bash
git clone [https://github.com/kimzam30/RemoteDevSetupWithNAS.git](https://github.com/kimzam30/RemoteDevSetupWithNAS.git)
cd RemoteDevSetupWithNAS
```
### 3.Configuration
Create the environment file. This is critical for security and permissions.
```bash
cp .env.example .env
```
Open ``` .env``` and cinfigure your settings:
```
# User Permissions 
PUID=1000
PGID=1000

#SECURIY
PASSWORD=urpasswordhere

#Host Paths
PROJECT_ROOT=/home/kimzam30/projects
```

