# Remote Dev Setup

A containerised VS Code Server environment — a full development machine, reachable from a browser on any device, with your code staying on the NAS instead of on whatever laptop you happen to be holding.

![Docker](https://img.shields.io/badge/Docker-2496ED?style=flat-square&logo=docker&logoColor=white)
![VS Code](https://img.shields.io/badge/code--server-007ACC?style=flat-square&logo=visual-studio-code&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white)
![C++](https://img.shields.io/badge/C%2B%2B-00599C?style=flat-square&logo=c%2B%2B&logoColor=white)
![License](https://img.shields.io/github/license/kimzam30/Remote-Dev-Setup?style=flat-square)

---

## Why

Setting up a toolchain on every new machine is wasted time, and syncing source code onto borrowed or low-power devices is a bad idea. This repo defines the environment once, as code:

- **Consistent** — the same GCC and Python everywhere, no "works on my laptop".
- **Portable** — usable from a tablet, an old laptop, or a lab machine; all you need is a browser.
- **Centralised** — source stays on the NAS and is never copied onto the client device.

---

## Stack

| Component | Technology | Purpose |
|---|---|---|
| IDE | [code-server](https://github.com/coder/code-server) | VS Code served over HTTP |
| Runtime | Docker | Isolates the environment from the host |
| Languages | Python 3, C++ | `python3`, `pip`, `gcc`, `g++`, `gdb`, `make` |
| Storage | Bind mounts | Direct access to project directories on the host |
| Access | Tailscale | Private mesh networking, no port forwarding |

---

## Setup

### Prerequisites

- A host or NAS running Docker Engine and Docker Compose v2
- Tailscale on both the host and the client device (recommended)

### 1. Clone

```bash
git clone https://github.com/kimzam30/Remote-Dev-Setup.git
cd Remote-Dev-Setup
```

### 2. Configure

```bash
cp .env.example .env
```

```ini
# Host user — run `id` to find yours
PUID=1000
PGID=1000

# Password for the code-server login page
PASSWORD=change-me

# Timezone
TZ=Asia/Kuala_Lumpur

# Where your code actually lives on the host
PROJECTS_ROOT=/home/youruser/projects
```

### 3. Launch

```bash
docker compose up -d
```

---

## Remote access over Tailscale

Binding to `0.0.0.0` makes the service reachable on the local network, so it should not be exposed to the internet directly. Tailscale gives you remote access without opening a single port.

1. **On the host** — make sure Tailscale is running, then find its private address:
   ```bash
   tailscale ip -4
   ```
   It will look like `100.x.x.x`.
2. **On the client** — install Tailscale and sign in to the same tailnet.
3. **Connect** — open `http://<tailscale-ip>:8443` and log in with the password from `.env`.

---

## Usage

- Projects are mounted at `/home/coder/project` inside the container.
- Open the integrated terminal with `` Ctrl+` `` to run `python3` or `g++` directly.
- Extensions install from the Open VSX registry — search for "Python" or "C/C++" as usual.
- Extensions and editor settings persist in `config/code-server/` on the host, so they survive container restarts and image updates.

---

## Layout

```
Remote-Dev-Setup/
├── config/
│   └── code-server/      # Persisted extensions and user settings
├── .env.example          # Configuration template
├── .gitignore
└── docker-compose.yaml   # Container definition
```

---

## License

MIT — see [LICENSE](LICENSE).
