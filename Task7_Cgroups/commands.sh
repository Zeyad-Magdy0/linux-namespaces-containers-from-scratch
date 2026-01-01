# Verify cgroups v2

mount | grep cgroup

# Create cgroup
cd /sys/fs/cgroup
sudo mkdir lab-cgroup

# Enable controllers
echo "+cpu +memory" | sudo tee /sys/fs/cgroup/cgroup.subtree_control

# Limit CPU to 20%
echo "20000 100000" | sudo tee /sys/fs/cgroup/lab-cgroup/cpu.max

# Move process to cgroup
echo <PID> | sudo tee lab-cgroup/cgroup.procs

# Limit Memory to 100 MB 
echo $((100 * 1024 * 1024)) | sudo tee lab-cgroup/memory.max
#Test
python3 -c 'a = "x" * (200 * 1024 * 1024); input()' # Process is OOM Killed
