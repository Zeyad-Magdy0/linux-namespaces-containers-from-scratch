## Creating a UTS Namespace

I created a new UTS namespace using `unshare`. Initially, the hostname remained unchanged, demonstrating that the namespace provides isolation boundaries but does not automatically alter system identifiers.

## Hostname Isolation

After modifying the hostname inside the UTS namespace, the host system’s hostname remained unchanged. This confirms that the UTS namespace isolates system identifiers such as hostname and domain name.


## Why Docker Uses Container ID as Hostname

Docker assigns a container’s unique ID as its hostname to avoid collisions and simplify debugging. This makes it easy to correlate logs, network traffic, and running containers without requiring manual hostname management.


## Why Kubernetes Pods Share a Hostname

In Kubernetes, all containers within a Pod share the same UTS namespace. This enforces the Pod abstraction by making containers appear as a single logical unit with a shared identity, enabling reliable localhost communication and consistent process discovery.

## Combining UTS and PID Namespaces

By combining UTS and PID namespaces, I demonstrated how container runtimes incrementally isolate system identity and process management. This mirrors how Docker and Kubernetes construct container environments.

## Conclusion

UTS namespaces isolate system identity, not networking or name resolution.
They allow a process to have an independent hostname and domain name, while DNS resolution remains a separate concern handled by the filesystem and network stack.

This separation explains why containers can safely share hostnames initially, why Docker explicitly sets container hostnames, and why Kubernetes enforces a shared hostname at the Pod level while delegating service discovery to DNS.