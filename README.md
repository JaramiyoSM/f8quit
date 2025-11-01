# 💡 JaraServices — f8quit

**Player Disconnect Display System (QBCore / Qbox)**

A simple yet elegant script that displays a **3D floating text notification** at the position where a player disconnects — useful for staff teams, RP immersion, or debugging disconnect reasons.

> 💜 Developed by **Jaramiyo** — [JaraServices.com](https://www.jaraservices.com)

---

## ✨ Features

* 📍 3D floating text where the player disconnected
* 🕒 Visible for 5 minutes
* 🎨 Styled using GTA color codes (`~r~`, `~y~`, `~b~`, etc.)
* 🧠 Automatic reason detection:

  * “Exiting”, “Disconnect”, “Crash”, or generic “Desconectado”
* 🔧 Lightweight and optimized
* 🧩 Includes test command `/testdisconnect`

---

## ✅ Requirements

* **FiveM (FXServer)**
* **QBCore** or **Qbox**

> 🟢 Compatible with any framework that exports `qb-core`.
> For Qbox, change in `server.lua`:
>
> ```lua
> local QBCore = exports['qb-core']:GetCoreObject()
> -- to:
> -- local QBCore = exports['qbx-core']:GetCoreObject()
> ```

---

## 📦 Installation

1. Drop the folder into your server’s resources:

   ```
   resources/[jaraservices]/f8quit
   ```

2. Add it to your `server.cfg`:

   ```cfg
   ensure f8quit
   ```

3. Restart your server — done! ✅

---

## 🧩 How It Works

When a player disconnects:

* The server captures their name, ID, and position.
* It detects the reason (`disconnect`, `crash`, or manual).
* A 3D message appears at the coordinates of disconnection for **5 minutes**.

Example message:

```
Jugador [3] John Doe ha dejado el servidor
RAZÓN: Crash
```

---

## ⚙️ File Structure

```
f8quit/
├── client.lua     # Draws 3D text and handles visibility
├── server.lua     # Handles disconnect events and triggers messages
└── fxmanifest.lua # Resource metadata
```

**fxmanifest.lua example:**

```lua
fx_version 'cerulean'
game 'gta5'

author 'Jaramiyo - JaraServices.com'
description 'Shows 3D text where a player disconnects (f8quit)'
version '1.0.0'

server_script 'server.lua'
client_script 'client.lua'
```

---

## 🧠 Notes

* Text fades only by time (not distance).
* Visible range: **15 meters**.
* Adjustable duration in client.lua (`5 * 60 * 1000` = 5 minutes).

---

## 📜 License

**MIT License** — Free to use and modify.
Please keep credits to **JaraServices**.
© JaraServices — All rights reserved.

---

## 💬 Support & Links

🌐 **Website:** [https://www.jaraservices.com/](https://www.jaraservices.com/)
💬 **Discord:** [https://discord.gg/KKqZkg8HJY](https://discord.gg/KKqZkg8HJY)

> Free release by **JaraServices** — optimized and professional FiveM development.
