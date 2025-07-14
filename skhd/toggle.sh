#!/bin/bash

STATE=$(sketchybar --query bar | jq -r '.hidden')

if [ "$STATE" = "on" ]; then
  sketchybar --bar hidden=off
else
  sketchybar --bar hidden=on
fi
