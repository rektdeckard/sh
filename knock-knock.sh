#!/bin/bash
# knock-knock
# Attach to display and unlock X session when connecting remotely
# by Tobias Fried <friedtm@gmail.com>
# created 2019.8.27

export DISPLAY=:0
sudo loginctl unlock-sessions
