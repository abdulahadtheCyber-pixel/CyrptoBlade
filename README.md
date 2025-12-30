# CryptoBlade 🔪 - Advanced Encoding & Hashing Toolkit

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Platform](https://img.shields.io/badge/platform-Linux%20%7C%20macOS%20%7C%20BSD-green.svg)
![Language](https://img.shields.io/badge/language-Bash-orange.svg)

![CryptoBlade Screenshot](screenshot.PNG)

**CryptoBlade** is a professional-grade Bash toolkit for penetration testers, security researchers, and developers. Features Base64 encoding/decoding, SHA256/MD5 hashing, file operations, and batch processing with an intuitive sword-themed interface.

## 🚀 Features

| Feature | Description |
|---------|-------------|
| 🔄 **Base64** | Encode/Decode text & files |
| 🔐 **SHA256** | Secure hashing for text/files |
| ⚡ **MD5** | Fast hashing for legacy compatibility |
| 📁 **File Ops** | Encode/decode/compare files |
| ⚙️ **Batch** | Process entire directories |
| 🎨 **UI** | Color-coded, ASCII sword banner |

## 📋 Prerequisites

```bash
# Debian/Ubuntu
sudo apt update && sudo apt install coreutils -y

# Arch Linux
sudo pacman -S coreutils

# macOS / kali
# Already included by default
```
## 🛠️ Installation

Method 1: Git Clone
```bash
git clone https://github.com/YOURUSERNAME/CryptoBlade.git
cd CryptoBlade
chmod +x cryptoblade.sh
./cryptoblade.sh
```
## ⚠️ Security Notes
SHA256 recommended over MD5 for security
Base64 is encoding, NOT encryption
Use file hashing for integrity verification
Batch operations create .b64 files automatically
## 🤝 Contributing
Fork the repo
Create feature branch (git checkout -b feature/amazing-feature)
Commit changes (git commit -am 'Add amazing feature')
Push (git push origin feature/amazing-feature)
Open Pull Request
## 📝 License
This project is licensed under the MIT License - see LICENSE [blocked] for details.
