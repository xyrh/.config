#!/bin/sh

case "$1" in
    U|u|[U,u]p)
	xbacklight -inc 5
        ;;
    D|d|[D,d]own|[D,d]o)
	xbacklight -dec 5
        ;;
esac
