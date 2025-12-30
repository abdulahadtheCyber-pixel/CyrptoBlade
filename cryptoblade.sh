#!/bin/bash

# CryptoBlade - Encoding/Decoding Tool
# Author: HackerAI
# Usage: ./cryptoblade.sh

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Sword ASCII Art Banner
echo -e "${BLUE}"
echo "          /| __________________________"
echo "    O|===|* >__________________________>"
echo "          \|"
echo "  ╔═══════════════════════════════════════╗"
echo "  ║   CRYPTOBLADE CREATED BY ANDUL AHAD   ║"
echo "  ║        Encoding & Decoding Tool       ║"
echo "  ╚═══════════════════════════════════════╝"
echo -e "${NC}"

echo -e "${CYAN}"
echo "=================================================="
echo "        Advanced Crypto Operations"
echo "           Authorized Pentest Tool"
echo "=================================================="
echo -e "${NC}"

# Function to display menu
show_menu() {
    echo ""
    echo -e "${PURPLE}[CRYPTOBLADE MENU]${NC}"
    echo -e "${YELLOW}1. Base64 Encode${NC}"
    echo -e "${YELLOW}2. Base64 Decode${NC}"
    echo -e "${YELLOW}3. SHA256 Hash${NC}"
    echo -e "${YELLOW}4. MD5 Hash${NC}"
    echo -e "${YELLOW}5. File Operations${NC}"
    echo -e "${YELLOW}6. Batch Processing${NC}"
    echo -e "${YELLOW}7. Exit${NC}"
    echo ""
}

# Function for Base64 encoding
base64_encode() {
    echo -e "${CYAN}[BASE64 ENCODE]${NC}"
    read -p "Enter text to encode: " input
    if [ -z "$input" ]; then
        echo -e "${RED}[ERROR] No input provided${NC}"
        return
    fi
    encoded=$(echo -n "$input" | base64)
    echo -e "${GREEN}[ENCODED]${NC}: $encoded"
    echo -e "${YELLOW}[COPY]${NC}: echo '$encoded' | base64 --decode"
}

# Function for Base64 decoding
base64_decode() {
    echo -e "${CYAN}[BASE64 DECODE]${NC}"
    read -p "Enter Base64 to decode: " input
    if [ -z "$input" ]; then
        echo -e "${RED}[ERROR] No input provided${NC}"
        return
    fi
    decoded=$(echo "$input" | base64 --decode 2>/dev/null)
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}[DECODED]${NC}: $decoded"
    else
        echo -e "${RED}[ERROR] Invalid Base64 input${NC}"
    fi
}

# Function for SHA256 hashing
sha256_hash() {
    echo -e "${CYAN}[SHA256 HASH]${NC}"
    echo -e "${YELLOW}1. Hash text${NC}"
    echo -e "${YELLOW}2. Hash file${NC}"
    read -p "Choose option (1-2): " option
    
    case $option in
        1)
            read -p "Enter text to hash: " input
            if [ -z "$input" ]; then
                echo -e "${RED}[ERROR] No input provided${NC}"
                return
            fi
            hash=$(echo -n "$input" | sha256sum | awk '{print $1}')
            echo -e "${GREEN}[SHA256]${NC}: $hash"
            ;;
        2)
            read -p "Enter file path: " filepath
            if [ -z "$filepath" ] || [ ! -f "$filepath" ]; then
                echo -e "${RED}[ERROR] File not found${NC}"
                return
            fi
            hash=$(sha256sum "$filepath" | awk '{print $1}')
            echo -e "${GREEN}[SHA256]${NC}: $hash"
            echo -e "${YELLOW}[FILE]${NC}: $filepath"
            ;;
        *)
            echo -e "${RED}[ERROR] Invalid option${NC}"
            ;;
    esac
}

# Function for MD5 hashing
md5_hash() {
    echo -e "${CYAN}[MD5 HASH]${NC}"
    echo -e "${YELLOW}1. Hash text${NC}"
    echo -e "${YELLOW}2. Hash file${NC}"
    read -p "Choose option (1-2): " option
    
    case $option in
        1)
            read -p "Enter text to hash: " input
            if [ -z "$input" ]; then
                echo -e "${RED}[ERROR] No input provided${NC}"
                return
            fi
            hash=$(echo -n "$input" | md5sum | awk '{print $1}')
            echo -e "${GREEN}[MD5]${NC}: $hash"
            ;;
        2)
            read -p "Enter file path: " filepath
            if [ -z "$filepath" ] || [ ! -f "$filepath" ]; then
                echo -e "${RED}[ERROR] File not found${NC}"
                return
            fi
            hash=$(md5sum "$filepath" | awk '{print $1}')
            echo -e "${GREEN}[MD5]${NC}: $hash"
            echo -e "${YELLOW}[FILE]${NC}: $filepath"
            ;;
        *)
            echo -e "${RED}[ERROR] Invalid option${NC}"
            ;;
    esac
}

# Function for file operations
file_operations() {
    echo -e "${CYAN}[FILE OPERATIONS]${NC}"
    echo -e "${YELLOW}1. Encode file to Base64${NC}"
    echo -e "${YELLOW}2. Decode Base64 file${NC}"
    echo -e "${YELLOW}3. Compare file hashes${NC}"
    read -p "Choose option (1-3): " option
    
    case $option in
        1)
            read -p "Enter file to encode: " filepath
            if [ -z "$filepath" ] || [ ! -f "$filepath" ]; then
                echo -e "${RED}[ERROR] File not found${NC}"
                return
            fi
            echo -e "${YELLOW}[ENCODING]${NC}: $filepath"
            base64 "$filepath" > "${filepath}.b64"
            echo -e "${GREEN}[SAVED]${NC}: ${filepath}.b64"
            ;;
        2)
            read -p "Enter Base64 file to decode: " filepath
            if [ -z "$filepath" ] || [ ! -f "$filepath" ]; then
                echo -e "${RED}[ERROR] File not found${NC}"
                return
            fi
            echo -e "${YELLOW}[DECODING]${NC}: $filepath"
            base64 --decode "$filepath" > "${filepath}.decoded"
            echo -e "${GREEN}[SAVED]${NC}: ${filepath}.decoded"
            ;;
        3)
            read -p "Enter first file: " file1
            read -p "Enter second file: " file2
            if [ ! -f "$file1" ] || [ ! -f "$file2" ]; then
                echo -e "${RED}[ERROR] One or both files not found${NC}"
                return
            fi
            hash1=$(sha256sum "$file1" | awk '{print $1}')
            hash2=$(sha256sum "$file2" | awk '{print $1}')
            echo -e "${YELLOW}[FILE 1 SHA256]${NC}: $hash1"
            echo -e "${YELLOW}[FILE 2 SHA256]${NC}: $hash2"
            if [ "$hash1" = "$hash2" ]; then
                echo -e "${GREEN}[MATCH]${NC}: Files are identical"
            else
                echo -e "${RED}[DIFFERENT]${NC}: Files are different"
            fi
            ;;
        *)
            echo -e "${RED}[ERROR] Invalid option${NC}"
            ;;
    esac
}

# Function for batch processing
batch_processing() {
    echo -e "${CYAN}[BATCH PROCESSING]${NC}"
    echo -e "${YELLOW}1. Hash all files in directory${NC}"
    echo -e "${YELLOW}2. Encode multiple files${NC}"
    read -p "Choose option (1-2): " option
    
    case $option in
        1)
            read -p "Enter directory path: " dirpath
            if [ -z "$dirpath" ] || [ ! -d "$dirpath" ]; then
                echo -e "${RED}[ERROR] Directory not found${NC}"
                return
            fi
            echo -e "${YELLOW}[HASHING FILES IN]${NC}: $dirpath"
            echo ""
            for file in "$dirpath"/*; do
                if [ -f "$file" ]; then
                    filename=$(basename "$file")
                    sha256=$(sha256sum "$file" | awk '{print $1}')
                    md5=$(md5sum "$file" | awk '{print $1}')
                    echo -e "${GREEN}[FILE]${NC}: $filename"
                    echo -e "${BLUE}[SHA256]${NC}: $sha256"
                    echo -e "${PURPLE}[MD5]${NC}: $md5"
                    echo "---"
                fi
            done
            ;;
        2)
            read -p "Enter directory path: " dirpath
            if [ -z "$dirpath" ] || [ ! -d "$dirpath" ]; then
                echo -e "${RED}[ERROR] Directory not found${NC}"
                return
            fi
            echo -e "${YELLOW}[ENCODING FILES IN]${NC}: $dirpath"
            for file in "$dirpath"/*; do
                if [ -f "$file" ]; then
                    filename=$(basename "$file")
                    base64 "$file" > "${file}.b64"
                    echo -e "${GREEN}[ENCODED]${NC}: $filename → ${filename}.b64"
                fi
            done
            ;;
        *)
            echo -e "${RED}[ERROR] Invalid option${NC}"
            ;;
    esac
}

# Main program loop
while true; do
    show_menu
    read -p "Select operation (1-7): " choice
    
    case $choice in
        1) base64_encode ;;
        2) base64_decode ;;
        3) sha256_hash ;;
        4) md5_hash ;;
        5) file_operations ;;
        6) batch_processing ;;
        7)
            echo -e "${GREEN}"
            echo "=================================================="
            echo "        CryptoBlade - Mission Complete"
            echo "=================================================="
            echo -e "${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}[ERROR] Invalid selection${NC}"
            ;;
    esac
    
    echo ""
    read -p "Press Enter to continue..."
    clear
    # Show banner again
    echo -e "${BLUE}"
    echo "          /| ________________"
    echo "    O|===|* >________________>"
    echo "          \|"
    echo "  ╔═══════════════════════════════════════╗"
    echo "  ║              CRYPTOBLADE              ║"
    echo "  ║        Encoding & Decoding Tool       ║"
    echo "  ╚═══════════════════════════════════════╝"
    echo -e "${NC}"
    echo -e "${CYAN}"
    echo "=================================================="
    echo "            Created By ABDUL AHAD"
    echo "           Authorized Pentest Tool"
    echo "=================================================="
    echo -e "${NC}"
done
