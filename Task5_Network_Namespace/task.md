## Network Namespace Has No Network by Default

When a new network namespace is created, it starts with only a loopback interface. No external network connectivity exists until interfaces, IP addresses, and routes are explicitly configured.

## Routing Requires NAT for External Access

Even with a default route, packets cannot reach external networks without Network Address Translation (NAT) on the host. This is why container runtimes must configure iptables rules.

## How Docker Bridge Networking Works

Docker creates a bridge interface on the host, connects containers using veth pairs, assigns IP addresses from a private subnet, sets up routing, and configures NAT rules using iptables to enable external connectivity.

## Why Kubernetes Pod IPs Are Routable

Kubernetes assigns each Pod a unique IP that is routable within the cluster. Unlike Docker bridge networking, Kubernetes relies on CNI plugins to provide flat networking without NAT between Pods, enabling direct Pod-to-Pod communication.

## Conclusion

Network namespaces isolate the entire network stack, not just interfaces.
A newly created namespace has no connectivity by default, requiring explicit configuration of interfaces, IP addressing, routing, and NAT to enable communication.

This demonstrates that container networking is an orchestration of Linux primitives—network namespaces, veth pairs, bridges, and iptables—and explains how Docker automates these steps and why Kubernetes adopts a different, flat networking model.