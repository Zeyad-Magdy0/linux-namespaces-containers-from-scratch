## What we are building

[ netns A ]──vethA──┐
                    ├──[ bridge ]──host
[ netns B ]──vethB──┘


## Creating Multiple Network Namespaces

Two independent network namespaces were created to simulate multiple containers requiring direct network communication.

## Linux Bridge as a Virtual Switch

A Linux bridge was created to act as a Layer-2 switch, enabling packet forwarding between multiple network namespaces.

## Container-to-Container Communication

Containers connected to the same Linux bridge can communicate directly using Layer-2 switching. ARP is used to resolve MAC addresses, and no NAT or routing is required for intra-bridge traffic.

## Docker Bridge Networking Model

Docker’s default bridge network mirrors this setup. Each container is connected to a shared Linux bridge via a veth pair, allowing direct container-to-container communication while using NAT only for external access.

## Why Kubernetes Avoids Linux Bridges

Kubernetes prefers flat Layer-3 networking provided by CNI plugins. Avoiding bridges and NAT allows Pods to communicate directly using routable IPs, simplifying service discovery and scaling across nodes.

## Conclusion

Linux bridges provide Layer-2 connectivity between network namespaces, enabling direct container-to-container communication without NAT. This model underpins Docker’s default bridge networking and highlights the distinction between connectivity and isolation in container networking design.
