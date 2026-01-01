- Verified host root filesystem
    - Confirmed / is backed by host disk


- Built minimal rootfs manually
    - Learned that binaries require shared libraries

- chroot changed filesystem view
    - Processes still visible from host
    - Able to escape chroot as root

- pivot_root required mount namespace
    - Old root was still accessible until unmounted
    - After unmount, host filesystem fully detached
