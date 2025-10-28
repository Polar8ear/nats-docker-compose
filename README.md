# 🧭 NATS + NATS CLI (Docker Compose)

This setup provides a simple environment containing:

- A **NATS server** container (using the official `nats:2.12.1-alpine` image) — but **not actually running NATS**, just idling.  
- A **NATS CLI** container that installs the official [NATS CLI](https://github.com/nats-io/natscli) for testing and exploration.

The two containers share the same Docker network (`natsnet`) for easy communication.

---

## 🧩 File Structure

.
├── docker-compose.yml
└── README.md

yaml
Copy code

---

## ⚙️ Services Overview

| Service     | Description |
|--------------|-------------|
| **nats**     | Based on `nats:2.12.1-alpine`. Its entrypoint is overridden and replaced with `sleep infinity`, so it does nothing by design. |
| **nats-cli** | Based on `alpine:latest`. Installs the NATS CLI binary at startup, then sleeps indefinitely for manual interaction. |

Both services run in the same custom Docker network: `natsnet`.

---

## 🚀 Usage

### 1. Start the environment

```bash
docker compose up -d
#This launches both containers:
```
nats → idle
nats-cli → installs NATS CLI, then sleeps

2. Access the NATS CLI container
```bash
#Copy code
docker compose exec nats-cli sh
#Once inside, verify that the CLI works:
```

```bash
#Copy code
nats --version
#You can then use any NATS CLI commands, for example:
```

```bash
#Copy code
nats --help
#⚠️ The NATS server is sleeping, so commands requiring a live server will fail.
```

3. Stop and clean up
```bash
#Copy code
docker compose down
```

## 🧱 Customization
If you want the NATS CLI to be preinstalled (to avoid downloading on each start), you can:

Create a small Dockerfile for the CLI.

Build and reference it in the docker-compose.yml instead of installing on container startup.

Example snippet for that can be added later if needed.

## 📦 Requirements
Docker

Docker Compose

## 🧠 Notes
The nats service has its entrypoint set to empty (entrypoint: []) to prevent the default NATS process from starting.

This setup is mainly for testing environments, CLI exploration, or tooling development — not for running an active NATS cluster.

