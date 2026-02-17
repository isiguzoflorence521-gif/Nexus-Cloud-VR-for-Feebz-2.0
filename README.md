🌌 Nexus Cloud VR (NCVR)
The Cloud‑Native Virtual Console for Feebz VR
Nexus Cloud VR (NCVR) is a DIY, automated cloud‑gaming ecosystem that transforms any Feebz VR 2.0 headset and smartphone into a powerful PC‑VR device by orchestrating Shadow PC through a Google Apps Script command center. It eliminates manual driver setup and focuses on seamless, console‑like automation.
 [git-scm.com]

🎮 The “Nexus” Experience
NCVR delivers a streamlined VR pipeline:

Console‑style automation — Inspired by systems like The Playroom, NCVR removes setup hassles. [git-scm.com]
Chromebook Command Center — Control all VR operations through a Google Apps Script dashboard. [git-scm.com]
Protocol Hot‑Swapping — Switch instantly between iVRy, VRidge, and Trinus VR drivers. [git-scm.com]
Ultra‑Link Stability — Optimized for USB tethering to reduce latency vs Wi‑Fi. [git-scm.com]
Live Telemetry — NCVR logs real‑time performance metrics into Logs/session_log.txt. [git-scm.com]


🧰 Tech Stack

























LayerTechnologyBackend / AutomationGoogle Apps Script (Code.gs) [git-scm.com]Local AutomationWindows Batch (NCVR_Switch.bat) + curl bridge [git-scm.com]EnvironmentVS Code on ChromeOS (Dell 3100), Shadow PC cloud VM [git-scm.com]HardwareFeebz VR 2.0 headset + smartphone [git-scm.com]

📂 Repository Structure
NCVR/
 ├─ Automation/
 │   ├─ NCVR_Switch.bat      ← Driver‑switching “brain”
 │   └─ curl.exe              ← Network bridge binary
 ├─ Resources/
 │   └─ phone_profiles.json   ← Lens + bitrate configs
 ├─ Logs/
 │   └─ session_log.txt       ← Live telemetry output
 └─ Code.gs                    ← Google Apps Script backend

 [git-scm.com]

🚀 Quickstart (5 Minutes)
1. Requirements

Shadow PC (Windows 10/11)
One mobile VR driver installed on Windows & phone:

iVRy, VRidge, or Trinus (NCVR supports hot‑swapping) [git-scm.com]


Feebz VR 2.0 headset
USB Tethering recommended for lowest latency
Google account (for deploying the Apps Script backend)


2. Deploy the Apps Script Backend

Open Code.gs in Google Apps Script.
Click Deploy → New deployment → Web app.
Set “Anyone with the link” or “Your Google Account” as allowed.
Copy the deployment URL — you will paste this into the switcher.


3. Prepare NCVR on Windows

Download or clone this repository on Shadow PC.
Place all VR drivers where your PATH or batch script can reach them.
(Recommended) Replace the bundled curl.exe with an official version:
PowerShellInvoke-WebRequest https://curl.se/windows/dl-8.7.1_3/curl-8.7.1_3-win64-mingw.zip -OutFile curl.zipGet-FileHash curl.zip -Algorithm SHA256# Compare checksum, extract to Tools\curl\Show more lines


(Shipping curl.exe inside repos is discouraged—download from the official source instead.)

4. Run NCVR
BATNCVR_Switch.bat --driver=vridge --tether=usb --script-url="YOUR_SCRIPT_URL"Show more lines

Replace vridge with ivry or trinus as needed.
If using Wi‑Fi, remove --tether or replace with your network method.


5. Verify Your Session

Put your phone into the Feebz VR headset.
Connect USB tether (recommended).
Wait for the switcher to initialize.
Tail your log:

BATtype Logs\session_log.txtShow more lines
You should see live data appear — NCVR logs system health & driver transitions.
 [git-scm.com]

📘 Configuration Guide
Phone Profiles (phone_profiles.json)
Each profile defines lens spacing, bitrate, FOV, and other optimization values.
Example:
JSON{  "device": "Generic Android",  "lens_spacing_mm": 64,  "recommended_bitrate": 35,  "decoder": "hardware"}Show more lines
Add as many profiles as needed for different phones.

📊 Telemetry (session_log.txt)
NCVR captures:

Driver loaded
Tethering method
Latency snapshots
Hot‑swap switch events
Session errors & warnings

Use this to troubleshoot performance issues.

🛠 Building & Development
Recommended Improvements (PRs welcome!)

Replace curl.exe with a secure installer or first‑run downloader
Add CI for linting Apps Script & batch
Add more phone presets
Add driver auto‑detection
Create onboarding screenshots or GIFs


📦 Releases
Latest release:
v1.0.0 — The Genesis Build (Cloud‑Native Console)
Published Feb 17, 2026
 [git-scm.com]

🤝 Contributing
Contributions are welcome!
Future issues may include:

New driver integrations
Improved telemetry formatting
Chromebook dashboard enhancements
Better profile auto‑selection


📜 License
This project is licensed under the MIT License.
