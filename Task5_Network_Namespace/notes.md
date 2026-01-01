- Observed host network interfaces and routing table

- Network namespace initially had only loopback
    - Loopback interface was down by default

- Network namespace completely isolated from host networking

- Created veth pair
    - One interface remained on host, the other moved into namespace

- Assigned IP addresses to both ends of veth pair
    - Verified host ↔ namespace connectivity

- Added a default route
    - Still cannot access the internet, Why
    - packets cannot reach external networks without Network Address Translation (NAT) on the host.

- Internet access worked only after NAT was enabled
    - Understood Docker bridge behavior
