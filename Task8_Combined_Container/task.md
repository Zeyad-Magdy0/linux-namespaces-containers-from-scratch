## High-Level Flow

- Create cgroup + set limits
- Create namespaces (PID, UTS, mount, net)
- Configure mount propagation
- pivot_root into rootfs
- Configure hostname
- Configure networking
- Move process into cgroup
- Exec the target process

## Building a Minimal Container

This task combines Linux namespaces and cgroups into a single workflow that launches an isolated process. The container is constructed by explicitly creating isolation boundaries for process IDs, system identity, filesystem, networking, and resource usage.

The order of operations is critical: cgroups must be created before process execution, mount propagation must be restricted before pivoting the root filesystem, and network configuration must occur inside the target namespace. This mirrors how real container runtimes such as runc construct containers.

## Conclusion

A container is not a special kernel object, but a carefully constructed process. By combining namespaces for isolation and cgroups for resource control, a fully functional container can be built using only standard Linux primitives. Container runtimes exist to automate this process safely and repeatably.
