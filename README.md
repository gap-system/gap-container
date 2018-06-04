# Docker container for the core GAP system

The Docker container for the core GAP system is available at DockerHub here:
https://registry.hub.docker.com/u/gapsystem/gap-container/

This GAP Docker container provides only the core GAP system and several packages
which are needed by GAP (GAPDoc, PrimGrp, SmallGrp, TransGrp). It may be used,
for example, in automated tests of different configurations of GAP packages by
installing them in the `pkg` subdirectory of `/home/gap/inst/gap-4.X.Y/`. As 
an demo, it is used at https://github.com/gap-system/gap-docker-travis to run
a simple calculation.

If you install Docker, you may run GAP in this container interactively. As you
see from the output below, it does not have a number of packages included in
the official GAP distribution. If you need to use the full GAP Docker container
which provide as many GAP packages as possible from the latest GAP release, you
have to use https://hub.docker.com/r/gapsystem/gap-docker/ - see its README.md
file for further instructions.

```
$ docker run --rm -i -t gapsystem/gap-container
gap@8d43e9eb23de:~$ gap
 *********   GAP 4.9.1 of 05-May-2018
 *  GAP  *   https://www.gap-system.org
 *********   Architecture: x86_64-pc-linux-gnu-default64
 Configuration:  gmp 6.1.0, readline
 Loading the library and packages ...
#I  autpgrp package is not available. Check that the name is correct
#I  and it is present in one of the GAP root directories (see '??RootPaths')
#I  alnuth package is not available. Check that the name is correct
#I  and it is present in one of the GAP root directories (see '??RootPaths')
#I  crisp package is not available. Check that the name is correct
#I  and it is present in one of the GAP root directories (see '??RootPaths')
#I  ctbllib package is not available. Check that the name is correct
#I  and it is present in one of the GAP root directories (see '??RootPaths')
#I  factint package is not available. Check that the name is correct
#I  and it is present in one of the GAP root directories (see '??RootPaths')
#I  fga package is not available. Check that the name is correct
#I  and it is present in one of the GAP root directories (see '??RootPaths')
#I  irredsol package is not available. Check that the name is correct
#I  and it is present in one of the GAP root directories (see '??RootPaths')
#I  laguna package is not available. Check that the name is correct
#I  and it is present in one of the GAP root directories (see '??RootPaths')
#I  polenta package is not available. Check that the name is correct
#I  and it is present in one of the GAP root directories (see '??RootPaths')
#I  polycyclic package is not available. Check that the name is correct
#I  and it is present in one of the GAP root directories (see '??RootPaths')
#I  resclasses package is not available. Check that the name is correct
#I  and it is present in one of the GAP root directories (see '??RootPaths')
#I  sophus package is not available. Check that the name is correct
#I  and it is present in one of the GAP root directories (see '??RootPaths')
#I  tomlib package is not available. Check that the name is correct
#I  and it is present in one of the GAP root directories (see '??RootPaths')
 Packages:   GAPDoc 1.6.1, PrimGrp 3.3.1, SmallGrp 1.3, TransGrp 2.0.2
 Try '??help' for help. See also '?copyright', '?cite' and '?authors'
gap> 
```