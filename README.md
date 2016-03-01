# GAP Docker container

We have a prebuilt Docker image at https://registry.hub.docker.com/u/gapsystem/gap-container/.

If you install Docker, you may run GAP from this container interactively as follows:

```
$ sudo docker run --rm -i -t gapsystem/gap-container
gap@4e17t888823a:~$ gap
 *********   GAP, Version 4.7.7 of 13-Feb-2015 (free software, GPL)
 *  GAP  *   http://www.gap-system.org
 *********   Architecture: x86_64-unknown-linux-gnu-gcc-default64
 Libs used:  gmp, readline
 Loading the library and packages ...
 Components: trans 1.0, prim 2.1, small* 1.0, id* 1.0
 Packages:   GAPDoc 1.5.1
 Try '?help' for help. See also  '?copyright' and  '?authors'
gap> 
```

This GAP Docker container provides only the core GAP system and the GAPDoc package
which is needed by GAP. Inside the container, GAP is installed in `/home/gap/inst/gap4r8/`.

This container may be used, for example, in automated tests of different configurations 
of GAP packages by installing them in the `pkg` subdirectory. An example of a Travis build
which checks whether this container has been built successfully and then runs some GAP 
experiment is provided in https://github.com/gap-system/gap-docker-travis.

Work in progress is to extend this container to build another one, which will provide as 
many GAP packages as possible from the latest GAP release.
