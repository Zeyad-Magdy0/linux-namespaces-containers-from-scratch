# linux-namespaces-lab  
### How Containers Work (From Scratch)

This project is a hands-on, from-scratch exploration of **how Linux containers actually work**, without Docker or Kubernetes.

The goal is not to *use* containers, but to **build one manually** using Linux kernel primitives:
- namespaces
- cgroups v2
- virtual networking
- filesystem isolation

By the end of this lab, a minimal container runtime is implemented using only standard Linux tools.

---

## Why This Project Exists

Most people learn containers by memorizing Docker commands.

This project answers deeper questions:

- What *is* a container at the kernel level?
- Why does PID 1 matter?
- How does container networking actually work?
- What problem does Docker really solve?
- Where do namespaces end and cgroups begin?

The result is a mental model where Docker becomes a **convenience**, not a black box.

---

## Project Structure

Each directory represents **one focused lab**, building toward a complete container runtime.

linux-namespaces-lab/
│
├── README.md
│
├── 01-pid-namespace/
│ ├── task.md
│ ├── commands.sh
│ └── notes.md
│
├── 02-uts-namespace/
│
├── 03-mount-namespace/
│
├── 04-rootfs/
│
├── 05-network-namespace/
│
├── 06-veth-bridge/
│
├── 07-cgroups/
│
├── 08-combined-container/
│
└── 09-comparison-with-docker/


This lab is intended for Linux, DevOps, and systems engineers who want to understand container internals beyond Docker usage.

## Prerequisites

- Linux system (root access required)
- Basic familiarity with Linux CLI
- Curiosity about systems internals


## Learning Outcomes

By completing this lab, you will understand:
- How Linux namespaces isolate processes, filesystems, and networking
- Why PID 1 behavior is critical inside containers
- How cgroups control resource usage
- How container networking works without Docker
- How Docker maps to underlying kernel primitives
