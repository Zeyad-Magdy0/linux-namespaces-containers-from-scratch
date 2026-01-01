- Observed host mount table
    - Noted mount propagation flags

- Mount namespace initially shows same mounts as host
    - Realized mount namespace isolates changes, not initial view


- tmpfs mount visible only inside mount namespace
    - Confirmed basic mount isolation

- Root filesystem marked as shared
    - Learned that shared mounts propagate across namespaces

- Mount appeared on host due to shared propagation
    - Realized mount namespace alone is not sufficient


- Remounted / as private
    - Mounts no longer propagated to host
    - Understood why Docker enforces private mounts

