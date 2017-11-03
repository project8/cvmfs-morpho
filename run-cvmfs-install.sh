# FROM project8/cvmfs-dependencies:latest

export P8DEPPYBUILD=build-2017-10-18
export MORPHOBRANCH=v1.2.5

# get the location of this script
export SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# make the dependencies build directory
mkdir -p /cvmfs/hep.pnnl.gov/project8/morpho/${MORPHOBRANCH}
git clone https://github.com/project8/morpho.git /cvmfs/hep.pnnl.gov/project8/morpho/${MORPHOBRANCH} --recursive -b ${MORPHOBRANCH} --depth 1
rm -f /cvmfs/hep.pnnl.gov/project8/morpho/latest 
ln -s /cvmfs/hep.pnnl.gov/project8/morpho/${MORPHOBRANCH} /cvmfs/hep.pnnl.gov/project8/morpho/latest

cp ./setup.sh /cvmfs/hep.pnnl.gov/project8/morpho/${MORPHOBRANCH}/setup.sh
cp ./install.sh /cvmfs/hep.pnnl.gov/project8/morpho/${MORPHOBRANCH}/install.sh

source /cvmfs/hep.pnnl.gov/project8/morpho/${MORPHOBRANCH}/setup.sh
chmod +x /cvmfs/hep.pnnl.gov/project8/morpho/${MORPHOBRANCH}/install.sh
/cvmfs/hep.pnnl.gov/project8/morpho/${MORPHOBRANCH}/install.sh
