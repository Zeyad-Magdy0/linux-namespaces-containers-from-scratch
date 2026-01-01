## cgroups v2 Unified Hierarchy

cgroups v2 use a single unified hierarchy where controllers are enabled top-down. Resource limits are enforced by the kernel scheduler and memory manager, ensuring consistent and predictable behavior across subsystems.

## CPU Limiting with cgroups v2

CPU limits in cgroups v2 are enforced by restricting scheduler runtime rather than pinning cores. This ensures fair scheduling while preventing a single workload from monopolizing CPU resources.

## Memory Limiting and OOM Kill

Memory limits in cgroups v2 are strict. When a process exceeds its allocated memory, the kernel triggers an OOM kill within the cgroup, protecting the rest of the system from resource exhaustion.

## Namespaces vs cgroups

Namespaces isolate visibility and identity, while cgroups control resource consumption. Containers require both: namespaces to provide isolation and cgroups to ensure fair and safe resource usage.

## How Containers Use cgroups

Docker and Kubernetes rely on cgroups to enforce CPU and memory limits defined by users. These limits are translated into cgroup configurations, allowing the kernel to guarantee resource fairness and node stability.

## Conclusion

cgroups v2 provide deterministic and enforceable resource control, ensuring workloads cannot exceed allocated CPU and memory limits. While namespaces isolate what a process can see, cgroups define how much it can consume, making them essential for safe multi-tenant container environments.
