#Observe host network interfaces and routing tables

ip addr
ip route

# Enter network namespace
sudo unshare --net bash

# Bring up loopback
ip link set lo up
ip addr


# Inside Namepsace

ping -c 1 8.8.8.8   # Fails, Network unreachable

# Create veth pair
sudo ip link add veth-host type veth peer name veth-ns  # on host-machine

# Move one end into namespace
sudo ip link set veth-ns netns <PID> #inside net container namespace, PID belongs to the process running inside the namespace




# Assign IPs
    # On host
        sudo ip addr add 10.200.1.1/24 dev veth-host
        sudo ip link set veth-host up

    # Inside namespace
        ip addr add 10.200.1.2/24 dev veth-ns
        ip link set veth-ns up

# Internet still not working

    ip route # No default route

    # Add route
        ip route add default via 10.200.1.1

# On Host 
    # Enable IP forwarding
    sudo sysctl -w net.ipv4.ip_forward=1

    # Enable NAT
    sudo iptables -t nat -A POSTROUTING \
    -s 10.200.1.0/24 ! -o veth-host -j MASQUERADE

# Pinging to test
    ping -c 8.8.8.8 # Now network works



