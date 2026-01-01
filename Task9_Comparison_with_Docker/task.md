## Containers: Kernel vs Docker

Linux containers are not a Docker feature. They are constructed from kernel primitives such as namespaces and cgroups. Docker is a higher-level system that automates the safe, repeatable creation, execution, and management of containers.

## Feature Comparison

| Feature | Manual Runtime (This Project) | Docker |
|------|-------------------------------|--------|
| PID Namespace | Created via unshare | Created automatically |
| UTS Namespace | Manual hostname setup | Container ID as hostname |
| Mount Namespace | Manual + pivot_root | Automated |
| Root Filesystem | Hand-built rootfs | Image layers |
| Network Namespace | Manual setup | Automatic |
| veth + Bridge | Manual wiring | docker0 bridge |
| DNS | Manual / none | Built-in DNS |
| cgroups v2 | Manual limits | Automatic |
| Init process | Shell as PID 1 | tini / containerd-shim |
| Lifecycle | Process lifetime | Managed |
| Restart | Manual | Built-in |
| Logging | None | Built-in |
| Security defaults | None | Seccomp / AppArmor |

## What Docker Automates

Docker automates the repetitive, error-prone steps required to create containers. This includes namespace creation, cgroup configuration, filesystem preparation, networking, DNS setup, and lifecycle management. Without Docker, these steps must be executed manually and in the correct order.

## What Docker Adds That the Kernel Does Not

The Linux kernel provides isolation primitives, but it does not provide image distribution, versioning, reproducibility, or orchestration. Docker introduces image layers, registries, metadata, defaults, and user-friendly workflows on top of kernel features.

## Why PID 1 Matters (tie back to Task 1)

In the manual runtime, networking was configured explicitly using network namespaces and loopback interfaces. Docker abstracts this complexity by creating veth pairs, attaching them to a bridge, configuring NAT, and providing DNS resolution automatically.

## Networking: Docker vs Manual

Cgroups enforce resource limits regardless of Docker. Docker configures CPU and memory limits automatically based on user input, while the manual runtime requires explicit manipulation of cgroup filesystem entries.

## cgroups: Manual vs Automatic

This project demonstrates that containers are not a Docker invention, but a composition of Linux kernel features. Docker exists to make containers usable at scale by automating filesystem construction, resource control, networking, security defaults, and lifecycle management. Understanding containers at the kernel level makes Docker a convenience rather than a black box.

## Conclusion

This project demonstrates that containers are not a Docker invention, but a composition of Linux kernel features. Docker exists to make containers usable at scale by automating filesystem construction, resource control, networking, security defaults, and lifecycle management. Understanding containers at the kernel level makes Docker a convenience rather than a black box.
