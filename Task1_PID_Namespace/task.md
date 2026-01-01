## Creating a PID Namespace

I created a new PID namespace using `unshare`. Inside the namespace, the shell became PID 1 and only a limited set of processes were visible. This demonstrates that PID namespaces do not create new processes, but instead provide a new PID view of existing processes.

## Why PID 1 Is Special

When a process runs as PID 1, the kernel applies special rules. By default, PID 1 ignores SIGTERM and SIGINT to prevent accidental system shutdown. Inside a PID namespace, the first process inherits this behavior, which explains why containers require careful PID 1 handling.

## Process Parenting Inside PID Namespace

All processes created inside the namespace are parented to PID 1. This mirrors the behavior of a real system init process and places responsibility for child management on the container's first process.

## Zombie Reaping Responsibility

PID 1 is responsible for reaping orphaned child processes. If it fails to do so, zombie processes accumulate. In containers, this can exhaust the process table and cause failures even though the application itself appears healthy.


## Why Containers Need an Init System

When an application runs as PID 1 inside a container, it inherits init responsibilities such as signal handling and zombie reaping. Most applications are not designed for this role. Tools like `tini`, `dumb-init`, or Docker's `--init` flag provide a minimal init process that forwards signals and reaps children correctly.

## Conclusion

PID namespaces isolate process identity and authority, not just numbering, ensuring processes can only manage and interact with processes inside their own hierarchy.