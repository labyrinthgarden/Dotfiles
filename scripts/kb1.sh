#!/bin/bash
current_layout=$(setxkbmap -query | grep layout | awk '{print $2}')
echo "$current_layout"