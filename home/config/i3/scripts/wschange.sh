#!/usr/bin/env bash

choices=$(echo "$1" | tr ',' '\n')

i3-msg workspace "$(echo "$choices" | dmenu -i)"

