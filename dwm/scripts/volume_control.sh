#!/bin/sh

case "$1" in
  U|u|[U,u]p)
    amixer -qM set Master 5%+ umute
    ;;
  D|d|[D,d]own|[D,d]o)
    amixer -qM set Master 5%- umute
    ;;
  M|m|[M,m]u|[M,m]ute)
    amixer set Master toggle
    ;;
esac
