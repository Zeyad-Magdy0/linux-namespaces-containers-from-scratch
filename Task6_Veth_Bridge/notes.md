- Created two separate network namespaces to simulate two containers

- Created a Linux bridge to act as a virtual switch

- Created veth pairs for each network namespace

- Attached host ends of veth pairs to the Linux bridge

- Moved namespace ends of veth pairs into their respective namespaces

- Assigned IPs in same subnet
    - No routing or NAT configured

- Containers communicated without NAT
    - ARP used to resolve peer MAC addresses
