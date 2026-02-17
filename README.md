# 🌌 Nexus Cloud VR (NCVR) 
### *The Cloud-Native Virtual Console Ecosystem*
**Version:** `1.0.0 - Genesis Build.`  
**Status:** `Stable Release.`  
**Codename:** `Genesis-System`

---

## 📜 Project Overview
**Nexus Cloud VR (NCVR)** is a high-performance, automated "Virtual Console" layer designed to bridge the gap between affordable smartphone VR hardware and high-fidelity PC-VR gaming. Developed on a **Dell Chromebook 3100** using **VS Code**, NCVR orchestrates a [Shadow PC](https://shadow.tech) cloud instance to deliver 1:1 responsive VR streaming to [Feebz VR 2.0](https://www.feebzstore.com) headsets via a dedicated **Ultra-Link USB** architecture.

Inspired by the tactile, responsive feel of Sony’s *The Playroom*, NCVR removes the "friction" of cloud gaming by automating driver orchestration, network handshakes, and lens calibration through a centralized API.

---

## 🏗️ System Architecture & Stack
The NCVR ecosystem is built on a precise three-tier language architecture optimized for low-latency command execution:

*   **🖥️ 48.5% HTML (Frontend Dashboard):** A custom-coded [Google Apps Script Web Portal](https://developers.google.com) that provides a "Console-Style" UI for remote management from any Chromebook or mobile browser.
*   **⚙️ 29.0% JavaScript (The Nexus API):** The backend "Brain" hosted on Google Cloud. It manages protocol requests, handles `POST` telemetry from the Shadow PC, and serves dynamic JSON configurations.
*   **🚀 22.5% Batchfile (Automation Engine):** The "Muscle" running on the [Shadow PC](https://shadow.tech). A highly optimized `NCVR_Switch.bat` that uses `curl` to execute real-time driver hot-swapping and system reboots.

---

## 🎮 Key Features

### 1. The Nexus Protocol (Hot-Swapping)
No more manual driver configuration. Change your "Game Profile" on the NCVR Dashboard, and the system automatically:
- Terminates existing [SteamVR](https://store.steampowered.com) processes.
- Swaps binaries between **iVRy**, **VRidge**, or **Trinus CBVR**.
- Re-initializes the virtual display driver within 30 seconds.

### 2. Ultra-Link USB Connectivity
By bypassing standard 5GHz Wi-Fi, NCVR utilizes Android/iOS **USB Tethering** to create a high-speed data tunnel. This reduces the "Motion-to-Photon" latency to professional standards, eliminating motion sickness in fast-paced titles like *Assetto Corsa* or *VRChat*.

### 3. Dynamic Lens Profiling
Centralized `phone_profiles.json` provides tailored distortion coefficients for the [Feebz 2.0 Optics](https://www.amazon.com). Supports displays up to 2K resolution at 90Hz.

---

## 📂 Repository Structure
```text
NCVR-Core/
├── .github/                # GitHub Actions & Rulesets
├── Automation/             # The "Muscle" Tier
│   ├── NCVR_Switch.bat     # Master Switcher v1.0.0
│   └── curl.exe            # Network Transport Binary (Optional)
├── Dashboard/              # The "Frontend" Tier
│   ├── index.html          # PS4-Style XMB Dashboard
│   └── styles.css          # Neon-Nexus UI Theme
├── Resources/              # The "Data" Tier
│   ├── phone_profiles.json # Lens & Bitrate Calibration
│   └── nexus_chime.wav     # System Startup Audio
├── Code.gs                 # The "API" Tier (JavaScript Core)
├── package.json            # Versioning & npm Registry Metadata
└── session_log.txt         # Live Telemetry Snapshot
