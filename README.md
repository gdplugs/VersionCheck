[![Godot Version](https://img.shields.io/badge/Godot-4.x-green.svg)](https://shields.io/)

# Version Checker
A small plugin that checks if a newer version of the godot alpha is available. 

# 🧪 Installation

1. [Download for Godot 4.x](https://github.com/gdplugs/VersionCheck/archive/refs/heads/main.zip)
2. Unpack the `version_check` folder into your `/addons` folder within the Godot project
3. Enable this addon within the Godot settings: `Project > Project Settings > Plugins`

# 📚 Getting started
![example](example.png)

The plugin does some very simple steps:

    * Checks the releases website
    * Parse the table for the releases
    * Checks if your installed version is the newest one

### 🗒️ Note:
I have no knowledge how the future distribution of the editor will be handled. If there will be a "beta" subfolder in the future or if the alphas will be archived...
So this plugin will break at some point in the future. 