# On Host
    # Create two network namespaces
    sudo ip netns add ns1
    sudo ip netns add ns2

    # Create Linux bridge
    sudo ip link add br0 type bridge
    sudo ip link set br0 up

    # Create veth pairs
    sudo ip link add veth1-host type veth peer name veth1-ns
    sudo ip link add veth2-host type veth peer name veth2-ns

    # Attach host veth ends to bridge and bring them up
    sudo ip link set veth1-host master br0
    sudo ip link set veth2-host master br0
    sudo ip link set veth1-host up
    sudo ip link set veth2-host up

#  Create 2 network namespaces
    sudo unshare --net bash

    # Move one end of veth pair into namespace
    sudo ip link set veth1-ns netns ns1
    sudo ip link set veth2-ns netns ns2

    # Configure ns1
    sudo ip netns exec ns1 ip link set lo up
    sudo ip netns exec ns1 ip link set veth1-ns up
    sudo ip netns exec ns1 ip addr add 10.0.0.2/24 dev veth1-ns

    # Configure ns2
    sudo ip netns exec ns2 ip link set lo up
    sudo ip netns exec ns2 ip link set veth2-ns up
    sudo ip netns exec ns2 ip addr add 10.0.0.3/24 dev veth2-ns

    # Test Connectivity 
        # From ns1
        sudo ip netns exec ns1 ping -c 2 10.0.0.3

        # From ns2
        sudo ip netns exec ns2 ping -c 2 10.0.0.3
