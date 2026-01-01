- Verified system is using cgroups v2 unified hierarchy

- Created a new cgroup directory
    - Observed resource control files automatically created

- Learned controllers must be enabled before use
    - Enabled cpu and memory controllers

- CPU-intensive process was throttled
    - Learned CPU limits are enforced via scheduler time slicing

- Process was OOM-killed when exceeding memory limit
    - OOM kill happened inside cgroup, not system-wide
