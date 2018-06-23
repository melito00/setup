#!/bin/sh

echo "Start initial setup script."

mkdir -p $HOME/.ssh
chmod 700 $HOME/.ssh
touch $HOME/.ssh/authorized_keys
chmod 600 $HOME/.ssh/authorized_keys
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILvgLS/XmSm93+8b8o7GGmbQkKq9wouOul6qksDiV0tV" >> $HOME/.ssh/authorized_keys

