#!/usr/bin/env bash

# === Color & Style Variables ===
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# === Banner ===
echo -e "${CYAN}${BOLD}🚀 Starting Transparent Theme Ulauncher Installer...${NC}"
echo

# === Ulauncher Check ===
if [ ! -d "$HOME/.config/ulauncher" ]; then
    echo -e "${RED}✗ Ulauncher is not installed.${NC}"
    echo -e "${YELLOW}💡 Please install it first.${NC}"
    exit 1
fi

echo -e "${GREEN}✓ Ulauncher directory found.${NC}"

# === Prepare user-themes Directory ===
TARGET_DIR="$HOME/.config/ulauncher/user-themes"
mkdir -p "$TARGET_DIR"

# === Determine Script Directory ===
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# === Install Themes ===
# Nama folder disesuaikan dengan isi repo kamu
THEMES=("ulauncher-theme-trans-light" "ulauncher-theme-trans-dark")

for theme in "${THEMES[@]}"; do
    SOURCE="$SCRIPT_DIR/$theme"
    DEST="$TARGET_DIR/$theme"

    if [ -d "$SOURCE" ]; then
        # Hapus versi lama jika ada
        [ -d "$DEST" ] && rm -rf "$DEST"
        
        echo -e "${CYAN}📦 Installing ${theme}...${NC}"
        cp -r "$SOURCE" "$TARGET_DIR/"
        echo -e "${GREEN}✓ ${theme} installed.${NC}"
    else
        echo -e "${RED}⚠️  Source folder ${theme} not found. Skipping.${NC}"
    fi
done

echo
echo -e "${GREEN}${BOLD}🎉 All set! Open Ulauncher Preferences > Appearance to select your new theme.${NC}"