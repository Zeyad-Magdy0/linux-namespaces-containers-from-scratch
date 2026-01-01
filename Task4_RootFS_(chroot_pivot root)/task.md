## chroot: What It Really Does

`chroot` changes the apparent root directory for a process but does not provide real isolation. It does not prevent access to the host filesystem when run as root and does not isolate mount points or processes.

## pivot_root: How Containers Really Change Root

`pivot_root` replaces the current root filesystem and relocates the old root to a temporary directory. Once the old root is unmounted, the process can no longer access the host filesystem. This provides real filesystem isolation.

## Why Docker Uses pivot_root

Docker and OCI runtimes use `pivot_root` because it provides true filesystem isolation. Unlike `chroot`, it detaches the old root completely, preventing escape and ensuring the container sees only its intended filesystem.

## Conclusion

Changing the root filesystem requires more than path redirection.
chroot only alters path resolution and provides no real isolation, while pivot_root replaces the root filesystem at the mount level and fully detaches the old root.

This distinction is why container runtimes use pivot_root inside a mount namespace to guarantee filesystem isolation and prevent escape, making it a foundational primitive for secure containers.    