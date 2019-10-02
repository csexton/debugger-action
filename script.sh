#!/bin/bash

set -e

# Install tmate on macOS or Ubuntu
echo Setting up tmate...
if [ -x "$(command -v brew)" ]; then
  brew install tmate
fi
if [ -x "$(command -v apt-get)" ]; then
  sudo apt-get install -y tmate openssh-client
fi

# Generate ssh key if needed
[ -e ~/.ssh/id_rsa ] || ssh-keygen -t rsa -f ~/.ssh/id_rsa -q -N ""

# Run deamonized tmate
echo Running tmate...
tmate -S /tmp/tmate.sock new-session -d
tmate -S /tmp/tmate.sock wait tmate-ready

# Print connection info
echo To connect to this session copy-n-paste the following into a terminal:
tmate -S /tmp/tmate.sock display -p '#{tmate_ssh}'

# Wait for connection to close or timeout in 15 min
timeout=$((15*60))
while [ -S /tmp/tmate.sock ]; do
  sleep 1
  timeout=$(($timeout-1))
  [ $timeout -gt 0 ] || exit 1
done
