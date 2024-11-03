#!/bin/bash

# Alacritty files to copy
alacritty_files=(
    "alacritty.toml"
    "alacritty.toml.backup"
    "catppuccin-frappe.toml"
    "catppuccin-mocha.toml"
)

# Create directories if they don't exist
mkdir -p alacritty
mkdir -p tmux

# Copy specific Alacritty files
echo "Copying Alacritty files..."
for file in "${alacritty_files[@]}"; do
    if [ -f "$HOME/.config/alacritty/$file" ]; then
        echo "Copying $file..."
        cp "$HOME/.config/alacritty/$file" "./alacritty/"
    else
        echo "Warning: $file not found in ~/.config/alacritty/"
    fi
done

# Copy tmux.conf
echo "Copying tmux.conf..."
if [ -f "$HOME/.config/tmux/tmux.conf" ]; then
    cp "$HOME/.config/tmux/tmux.conf" "./tmux/"
else
    echo "Warning: tmux.conf not found in ~/.config/tmux/"
fi

# Copy entire nvim directory
echo "Copying nvim directory..."
if [ -d "$HOME/.config/nvim" ]; then
    cp -r "$HOME/.config/nvim" .
else
    echo "Warning: nvim directory not found in ~/.config/"
fi

# Copy starship.toml and .zshrc
echo "Copying starship.toml and .zshrc..."
[ -f "$HOME/.config/starship.toml" ] && cp "$HOME/.config/starship.toml" . || echo "Warning: starship.toml not found"
[ -f "$HOME/.zshrc" ] && cp "$HOME/.zshrc" . || echo "Warning: .zshrc not found"

echo "Copy complete!"
