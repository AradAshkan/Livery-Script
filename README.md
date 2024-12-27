# Livery Command Script

## Description

This script allows players in GTA V to set the livery of their vehicles using a simple command. It checks whether the vehicle supports liveries and applies the desired livery if valid. The script is designed for use in **FiveM** servers.

## Features

- **Set Vehicle Livery**: Players can specify a livery number to apply to the vehicle they are inside or to the nearest vehicle in their direction.
- **Error Handling**: Provides clear feedback if the command is misused, a non-numeric livery number is entered, or the vehicle does not support liveries.
- **Seamless Integration**: Works with ESX framework for interacting with nearby vehicles.

## Requirements

- FiveM server
- ESX Framework (required for getting vehicles in the player's direction)

## Installation

1. Clone or download this repository.
2. Place the folder in your FiveM server's `resources` directory.
3. Add the resource to your server configuration file (`server.cfg`):
   ```plaintext
   ensure [Livery-Script]
