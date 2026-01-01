- Order of operations mattered; incorrect ordering caused failures
- pivot_root required mount namespace and private propagation
- cgroups had to be configured before moving process
- Final result behaved like a minimal container runtime


- After pivot_root, many commands were missing
    - Realized minimal rootfs contains only explicitly copied binaries
    - Understood why containers include busybox or coreutils
    - cgroup filesystem must be mounted inside container to manage cgroups


- Minimal rootfs caused missing commands
    - Added BusyBox to provide essential userspace tools
    - Mounted proc, sysfs, and cgroup2 inside container
    - Corrected ordering of pivot_root and cgroup assignment
    - BusyBox was not present by default on CentOS Stream 9
    - Installed BusyBox explicitly to provide minimal userspace
    - Learned that containers must ship their own userland tools

- Host binaries live in distro-specific paths
    - Copying individual binaries requires chasing shared libraries
    - Installed BusyBox to provide a minimal, self-contained userland
    - Understood why container images bundle utilities explicitly

- BusyBox is not available in default CentOS Stream 9 repos
    - Learned enterprise distros avoid BusyBox by default
    - Understood why container images ship prebuilt userland
    - Adopted Alpine BusyBox for a clean minimal rootfs





