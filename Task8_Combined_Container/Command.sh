#!/bin/bash
#
# Host preparation for Task 8 - Combined Container
# This file documents all commands executed on the HOST
# before running run.sh
#

set -e

echo "[+] Preparing minimal root filesystem"

# -------------------------------------------------
# 1. Create rootfs directories
# -------------------------------------------------
sudo mkdir -p /tmp/rootfs/{bin,proc,sys,lib,lib64}

# -------------------------------------------------
# 2. Obtain BusyBox 
# -------------------------------------------------
# NOTE:
# CentOS Stream 9 does NOT ship busybox by default.
# BusyBox is extracted from an Alpine container.
# Docker Must be installed on your machine.

echo "[+] Extracting BusyBox from Alpine container"

docker run --rm alpine cat /bin/busybox > /tmp/rootfs/bin/busybox
sudo chmod +x /tmp/rootfs/bin/busybox

# -------------------------------------------------
# 3. Create BusyBox applets
# -------------------------------------------------
echo "[+] Creating BusyBox applets"

cd /tmp/rootfs/bin

sudo ln -sf busybox sh
sudo ln -sf busybox mount
sudo ln -sf busybox umount
sudo ln -sf busybox ip
sudo ln -sf busybox hostname
sudo ln -sf busybox ls
sudo ln -sf busybox ps
sudo ln -sf busybox rmdir

# -------------------------------------------------
# 4. Verify rootfs
# -------------------------------------------------
echo "[+] Verifying rootfs binaries"

ls -l /tmp/rootfs/bin

echo "[+] Root filesystem prepared successfully"
