# clean-docker
remove old containers and images.

Tested on OSX El Capitan 10.11.6 Docker version 1.12.1-rc1

This script goes through and removes the docker containers that have already exited, and then removes the <none> images that look like

```
REPOSITORY                     TAG                 IMAGE ID            CREATED             SIZE
<none>                         <none>              a49388aafbd3        2 hours ago         591.2 MB
<none>                         <none>              309d03f1cf26        2 hours ago         465.7 MB
<none>                         <none>              a6d7d1f920fe        2 hours ago         591.2 MB
<none>                         <none>              9e55a69d255c        2 hours ago         591.2 MB
```

for debugging purposes it will print out whether the operation was successful

```
[OK] Remove image 5db75ae390ed
```

or if it failed.

```
[ERROR] Remove image f9a1927cd6a2 - Error response from daemon: conflict: unable to delete f9a1927cd6a2 (cannot be forced) - image is being used by running container 2c23f0f00607
```
