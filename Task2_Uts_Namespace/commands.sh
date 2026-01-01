
#Enter PID namespace
sudo unshare --uts bash

# Check hostname
hostname

# Change hostname inside UTS namespace
hostname uts-container
hostname

# Combine PID and UTS namespaces
sudo unshare --pid --uts --fork --mount-proc bash
hostname uts-pid-demo
ps aux
