# define what dependencies and what version of morpho to look for
export P8DEPMORPHOBUILD=build-2017-10-18
export MORPHOBRANCH=v1.2.5

# get the location of this script
export SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# make the dependencies build directory
mkdir -p /cvmfs/hep.pnnl.gov/project8/morpho/${MORPHOBRANCH}
git clone https://github.com/project8/morpho.git /cvmfs/hep.pnnl.gov/project8/morpho/${MORPHOBRANCH} --recursive -b ${MORPHOBRANCH} --depth 1

cp ./setup.sh /cvmfs/hep.pnnl.gov/project8/morpho/${MORPHOBRANCH}/setup.sh
cp ./install.sh /cvmfs/hep.pnnl.gov/project8/morpho/${MORPHOBRANCH}/install.sh

source /cvmfs/hep.pnnl.gov/project8/morpho/${MORPHOBRANCH}/setup.sh
chmod +x /cvmfs/hep.pnnl.gov/project8/morpho/${MORPHOBRANCH}/install.sh
/cvmfs/hep.pnnl.gov/project8/morpho/${MORPHOBRANCH}/install.sh
