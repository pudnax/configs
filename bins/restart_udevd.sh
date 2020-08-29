#! /usr/bin/bash

sudo systemctl stop systemd-udevd systemd-udevd-kernel.socket systemd-udevd-control.socket
sudo systemctl start systemd-udevd systemd-udevd-kernel.socket systemd-udevd-control.socket

