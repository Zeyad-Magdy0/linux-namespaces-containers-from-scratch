## Creating a Mount Namespace

I created a new mount namespace using `unshare`. Initially, the mount table appeared identical to the host. This demonstrates that mount namespaces isolate mount operations, not the initial filesystem view.

## Mount Isolation

Mounts created inside a mount namespace are not visible on the host. This confirms that mount namespaces isolate filesystem mount operations between namespaces.

## Mount Propagation Pitfall

Even inside a mount namespace, mount events can propagate to the host if the underlying mount is marked as shared. This demonstrates that mount namespaces alone do not guarantee isolation.

## Mount Propagation Control

By remounting the root filesystem as private, mount events stopped propagating to the host. This is why container runtimes explicitly change mount propagation settings before setting up container filesystems.

## Why Kubernetes Cares About Mount Propagation

Kubernetes uses mount propagation to safely expose host volumes to Pods. Shared and slave propagation modes allow controlled visibility of mounts between host and container, enabling features such as volume plugins and CSI drivers without compromising isolation.

## Conclusion

Mount namespaces isolate mount operations, not filesystems themselves.
While each namespace has its own mount table, mount propagation rules determine whether mount events are shared, received, or blocked between namespaces.

Understanding shared, private, and slave propagation is critical to preventing filesystem leaks and explains why container runtimes explicitly remount / as private and why Kubernetes relies on controlled propagation for volume management.