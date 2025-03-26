#!/bin/bash

# Get the current volume percentage using amixer
volume=$(amixer sget Master | grep -oE '[0-9]{1,3}%')
echo ": $volume"
