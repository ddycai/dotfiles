#!/bin/bash
ask() {
  read -p "$1 [y/n] " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    return 0
  fi
  return 1
}
hey=true

if ask "Would you like to go?"; then
  echo "Sure :)"
  hey=true
else
  echo "OK :)"
  hey=false
fi

if [ "$hey" == "true" ]; then
  echo "Hey!"
else
  echo "Uh..."
fi
