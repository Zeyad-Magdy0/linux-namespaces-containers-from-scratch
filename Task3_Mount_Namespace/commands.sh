mount | head -n 10
findmnt -o TARGET,PROPAGATION | head -n 10


# Enter mount namespace
sudo unshare --mount bash

# View mounts
mount | head -n 10


# Create isolated mount
mkdir /mnt/ns-test
mount -t tmpfs tmpfs /mnt/ns-test
mount | grep ns-test

#Check root propagation mode in root and container
# / : shared in root
# / : private in container
findmnt -o TARGET,PROPAGATION /



#Inside namespace to change mode 
mount --make-rprivate /
findmnt -o TARGET,PROPAGATION /

#Private test / No leakage

mkdir /mnt/private-test
mount -t tmpfs tmpfs /mnt/private-test
mount | grep private-test

