# 📱 FBLA Connect+

**An app to bridge communication between students, schools, and FBLA chapters.**  
Created using **Godot 3.0** and **GDScript**  
👤 Developed by: Brian Wang

---

## 📖 Overview

**FBLA Connect+** is a desktop/mobile app built to simplify and centralize access to high school and FBLA-related updates. By combining useful school and club features into one place, it improves engagement and accessibility for students.

The app was built with **Godot 3.0**, a lightweight and open-source game engine using **GDScript**. It was created to demonstrate technical skill and solve a real problem in student information access.

---

## 🎯 Purpose & Problem Solving

### 📌 Why FBLA Connect+?

School websites and FBLA chapter pages often:
- Lack immediate scheduling visibility
- Are hard to navigate or outdated
- Require users to check multiple sources

**FBLA Connect+** addresses these problems by:
- Providing real-time updates in-app
- Embedding school and FBLA information
- Enabling dynamic UI for events and announcements

---

## 🌟 Key Features

- 🗓️ Embedded FBLA and school calendars  
- 🔔 Push-style dynamic updates (scraped and parsed)  
- 🧑‍🏫 Teacher contact integration (scrapes contact data)  
- 📡 HTTP request-based syncing from school/Future Business Leaders websites  
- 🎨 Built-in UI with custom GIMP-designed assets  
- 🔄 More features planned via live collaboration with official FBLA developers

---

## 💻 Tech Stack

| Component     | Details                         |
|---------------|----------------------------------|
| Engine        | Godot 3.0                        |
| Language      | GDScript                         |
| Networking    | HTTP requests, POST data scraping |
| UI/UX         | First-time UI made in Godot + GIMP |
| Data Sources  | ERHS Calendar (sub-branch), FBLA team site (under development) |

---

## 🛠️ Installation Guide

### 📥 Prerequisites

- **Godot Engine 3.0**: [Download here](https://godotengine.org/download/archive)
- Windows/Mac/Linux system or Android phone (if exported)

---

### 📦 Installation Steps (Godot Project)

#### 1. Clone or Download the Project

```bash
git clone https://github.com/yourusername/fbla-connect-plus.git
cd fbla-connect-plus
```

2. Open in Godot
   - Launch Godot 3.0
   - Click "Import"
   - Select project.godot file inside project folder
   - Click "Edit" to open project
3. Run the App (F5 in the editor)

--- 

### 📱 (Optional) Export to Desktop or Android
To Export:
1. Go to Project > Export
2. Select your target platform (e.g., Windows Desktop or Android)
3. Set up export templates if prompted
4. Click "Export Project" to generate the executable or APK (Note: iPhones may require XCode or some apple game engine code rewrite)

---

### 📎 Credits
Developer: Brian Wang

UI Design: Brian Wang via GIMP

School Website Source: ERHS Subsite

Engine: Godot Engine
