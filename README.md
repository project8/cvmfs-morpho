# Project 8 CVMFS Morpho installation

This repository can be used in two ways:

1. To install on the actual CVMFS system, use the `run-cvmfs-install.sh` script
1. To use the docker mockup CVMFS system, use the Dockerfile

When updating the morpho build on GitHub, please make sure that both `run-cvmfs-install.sh` and `Dockerfile` get updated.  When a new official build is ready, tag it with the build name (the same as the build directory)

## Information

This repository provides the installation of morpho on the CVMFS system used on the PNNL HEP cluster.

It's based on the CVMFS-dependencies-py image (https://hub.docker.com/r/project8/cvmfs-dependencies-py).

Project 8 software is installed in the `/cvmfs/hep.pnnl.gov/project8` directory.  From there, installed python packages go in the `morpho` subdirectory.  For any images based on this image, their software should go in their own directories to avoid issues with directory names that change as builds are updated.  For example:

```
/cvmfs/hep.pnnl.gov/project8
   |
   +- dependencies

   |
   +- dependencies-py

   |
   +- katydid
   |
   +- morpho
   |     |
   |     +- latest --> v1.2.5
   |     |
   |     +- v1.2.5
   |           |
   |           +- AUTHORS, bin, Dockerfile, ... (morpho source code)
   |           |
   |           +- install.sh
   |           |
   |           +- setup.sh
   . . .
```

## Testing a release branch

1. Set the appropriate Morpho branch or tag in Dockerfile (environment variable `MORPHOBRANCH`):
1. Set the branch to `release/[version]`:
    1. Uncomment the `ENV MORPHOBRANCH=release/[version]` line
    1. Comment out the line that uses a tag, `ENV MORPHOBRANCH=v[version]`
1. If using a new version of the `cvmfs-dependencies-py` base image, update that in the `FROM` line in Dockerfile
1. Build the container locally
1. If the build works, go ahead with the Morpho release, but don't push these changes to Ladybug:master

## Updating Morpho with a new tagged release

1. Set the appropriate Morpho branch or tag in Dockerfile (environment variable `MORPHOBRANCH`):
1. Set the branch to the tag name, `v[version]`:
    1. Comment out the `ENV MORPHOBRANCH=v[version]` line
    1. Uncomment the line that uses a tag, `ENV MORPHOBRANCH=v[version]`
1. If using a new version of the `cvmfs-dependencies-py` base image, update that in the `FROM` line in Dockerfile
1. Build the container locally
1. If the build works, push these changes to Ladybug:master
1. On the Docker Hub page for the `project8/cvmfs-morpho` image, go to Build Settings
1. Trigger a rebuild of both containers (`latest` and same-as-tag)
1. Make sure that the Docker Hub build works
1. If the build works, notify the DIRAC team that Morpho needs to be pushed to CVMFS, and provide the Morpho tag name.
