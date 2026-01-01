#!/bin/bash
set -e

# =========================
# Configuration
# =========================
ROOTFS=/tmp/rootfs
CGROUP_NAME=container-demo
HOSTNAME=mini-container
MEM_LIMIT=$((100 * 1024 * 1024))   # 100 MB
CPU_MAX="20000 100000"             # 20% CPU

echo "[+] Creating cgroup"
cd /sys/fs/cgroup

# Enable controllers (safe if already enabled)
echo "+cpu +memory" > cgroup.subtree_control || true

mkdir -p "$CGROUP_NAME"
echo "$CPU_MAX" > "$CGROUP_NAME/cpu.max"
echo "$MEM_LIMIT" > "$CGROUP_NAME/memory.max"

echo "[+] Launching container process"

unshare \
  --pid \
  --uts \
  --mount \
  --net \
  --fork \
  --mount-proc \
  sh -c '

    echo "[+] Inside container namespaces"

    # -------------------------
    # Identity (UTS)
    # -------------------------
    hostname '"$HOSTNAME"'

    # -------------------------
    # Mount safety
    # -------------------------
    mount --make-rprivate /

    # -------------------------
    # Required virtual filesystems
    # -------------------------
    mkdir -p /proc /sys /sys/fs/cgroup
    mount -t proc proc /proc
    mount -t sysfs sysfs /sys
    mount -t cgroup2 none /sys/fs/cgroup

    # -------------------------
    # Move process into cgroup
    # -------------------------
    echo $$ > /sys/fs/cgroup/'"$CGROUP_NAME"'/cgroup.procs

    # -------------------------
    # Switch root filesystem
    # -------------------------
    mount --bind '"$ROOTFS"' '"$ROOTFS"'
    cd '"$ROOTFS"'

    mkdir -p old_root
    pivot_root . old_root
    umount -l /old_root
    rmdir /old_root

    # -------------------------
    # Network (loopback only)
    # -------------------------
    ip link set lo up

    echo "[+] Container started successfully"
    exec /bin/bash
  '
