#!/bin/bash
## knock-knock
## created 2019.8.27
## author Tobias Fried <friedtm@gmail.com>

## Attach to display and unlock X session when connecting remotely

export DISPLAY=:0
sudo loginctl unlock-sessions
