- Without --fork, bash remained in host PID namespace
    - without fork the bash was started but it cannot talk to the terminal , cannot allocate resouces and is non-functional
    - A process cannot change it's own PID, that's why we have to use fork so that a child process spawns in the isola ted environment and gets assigned PID 1 
    - The process spawning from the fork, getting the PID 1, acts as an Init process for this created namespace

- Without ---mount-proc, ps showed host PIds

- Inside namespace, bash became PID 1

- Sending SIGTERM to PID 1 had no effect
    - Learned that the kernel treats PID 1 specially

- Child process had PPID = 1
    - Confirmed shell is acting as init

- Observed zombie process when child exited
    - Realized PID 1 must reap children explicitly
