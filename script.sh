#!/bin/bash

set -e

echo Setting up tmate
if [ -x "$(command -v brew)" ]; then
  brew install tmate
fi

if [ -x "$(command -v apt-get)" ]; then
  sudo apt-get install -y tmate openssh-client
fi

[ -e ~/.ssh/id_rsa ] || ssh-keygen -t rsa -f ~/.ssh/id_rsa -q -N ""


echo Running tmate
tmate -S /tmp/tmate.sock new-session -d
tmate -S /tmp/tmate.sock wait tmate-ready
tmate -S /tmp/tmate.sock display -p '#{tmate_ssh}'

while [ -S /tmp/tmate.sock ]; do
  echo -ne "."
  sleep 1
done


