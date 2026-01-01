
#Enter PID namespace
sudo unshare --pid --fork --mount-proc bash

#verify namespace
exho $$
ps aux

# Test PID 1 signal handling
kill -TERM 1


# Spawn child process
sleep 5 &
ps -o pid,ppid,state,cmd



sleep 1 &
wait
ps -o pid,ppid,state,cmd
