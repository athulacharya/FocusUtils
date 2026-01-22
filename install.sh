#!/bin/bash
set -e

swift build -c release
sudo cp .build/release/mvmouse /usr/local/bin/
sudo chmod +x /usr/local/bin/mvmouse
