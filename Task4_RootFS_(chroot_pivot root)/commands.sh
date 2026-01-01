# Check root host filesystem

ls /
mount grep " / "

# Create minimal root filesystem
mkdir -p /tmp/rootfs/{bin,lib,lib64}

# Copy bash
cp /bin/bash /tmp/rootfs/bin/

# Copy required libraries
cp /lib64/libtinfo.so.* /tmp/rootfs/lib64/
cp /lib64/libdl.so.* /tmp/rootfs/lib64/
cp /lib64/libc.so.* /tmp/rootfs/lib64/
cp /lib64/ld-linux-x86-64.so.* /tmp/rootfs/lib64/


# Chroot 
sudo chroot /tmp/rootfs /bin/bash

# Pivot root
    # Enter mount namespace
    sudo unshare --mount bash

    # Prevent propagation
    mount --make-rprivate /

    # Bind mount new root
    mount --bind /tmp/rootfs /tmp/rootfs

    # Switch root
    cd /tmp/rootfs
    pivot_root . old_root

    # Remove old root
    umount -l /old_root
    rmdir /old_root

