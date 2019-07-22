#!/bin/bash
# Script to install my favorite themes and icons.

sudo add-apt-repository ppa:oranchelo/oranchelo-icon-theme
sudo apt update && sudo apt upgrade -y
sudo apt install oranchelo-icon-theme

sudo add-apt-repository ppa:snwh/pulp
sudo apt update && sudo apt upgrade -y
sudo apt install paper-icon-theme

sudo add-apt-repository ppa:papirus/papirus
sudo apt update && sudo apt upgrade -y
sudo apt install materia-gtk-theme

