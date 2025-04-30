#!/bin/sh

CONFIG_DIR="$HOME/.dotfiles"
REPO_URL="https://github.com/jerezjustin/nixos-config"

# Clone the repository if it doesn't exist
if [ ! -d "$CONFIG_DIR" ]; then
    echo "Cloning the repository into $CONFIG_DIR..."
    nix-shell -p git --command "git clone $REPO_URL $CONFIG_DIR"
else
    echo "Repository already exists at $CONFIG_DIR. Skipping cloning."
fi

sudo nixos-generate-config --show-hardware-config > $CONFIG_DIR/modules/system/hardware-configuration.nix

# Promt the user for personal information
read -p "Enter your full name: " NAME
read -p "Enter your username: " USERNAME
read -p "Enter your email: " EMAIL
DOTFILES_DIR="$HOME/.dotfiles"

# Update the flake.nix file with the user input
sed -i "s|^\(\s*\)name = .*|\1name = \"$NAME\";|" "$CONFIG_DIR/flake.nix"
sed -i "s|^\(\s*\)username = .*|\1username = \"$USERNAME\";|" "$CONFIG_DIR/flake.nix"
sed -i "s|^\(\s*\)email = .*|\1email = \"$EMAIL\";|" "$CONFIG_DIR/flake.nix"
sed -i "s|^\(\s*\)dotfilesDir = .*|\1dotfilesDir = \"$DOTFILES_DIR\";|" "$CONFIG_DIR/flake.nix"

# Open the .env file to further configure the system
echo "Opening flake file for review..."
nano "$CONFIG_DIR/flake.nix"

# Build the configuration
sudo nixos-rebuild switch --flake "$CONFIG_DIR#system"

echo "Installation completed!"
