# Project 8 CVMFS Morpho installation

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
    1. Comment out the `ENV MORPHOBRANCH=release/[version]` line
    1. Uncomment the line that uses a tag, `ENV MORPHOBRANCH=v[version]`
1. If using a new version of the `cvmfs-dependencies-py` base image, update that in the `FROM` line in Dockerfile
1. Build the container locally
1. If the build works, push these changes to Ladybug:master
1. On the Docker Hub page for the `project8/cvmfs-morpho` image, go to Build Settings
1. Trigger a rebuild of both containers (`latest` and same-as-tag)
1. Make sure that the Docker Hub build works
1. If the build works, notify the DIRAC team that Morpho needs to be pushed to CVMFS, and provide the Morpho tag name.
