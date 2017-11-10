# define what dependencies and what version of morpho to look for
export P8DEPMORPHOBUILD=build-2017-10-18
export MORPHOBRANCH=v1.2.5

# source dependencies
source /cvmfs/hep.pnnl.gov/project8/dependencies-morpho/${P8DEPMORPHOBUILD}/setup.sh 

export P8MORPHOBASEDIR=${P8BASEDIR}/morpho/${MORPHOBRANCH}
export PATH=${P8MORPHOBASEDIR}/bin:${PATH}
export PYTHONPATH=${P8MORPHOBASEDIR}/lib/python2.7/site-packages:${PYTHONPATH} 
