#!/bin/bash


export P8MORPHODIR=/cvmfs/hep.pnnl.gov/project8/morpho/${MORPHOBRANCH}

source /cvmfs/hep.pnnl.gov/project8/dependencies-py/latest/setup.sh
source ${P8MORPHODIR}/setup.sh


echo "Environment variables after installing python:"
env
echo `which python`
echo `python -V`

echo `gcc --version`
echo `python --version`

echo `which cc`
echo `which g++`
echo `which ld`

echo "LD_LIBRARY_PATH: $LD_LIBRARY_PATH"
echo "LIBRARY_PATH: $LIBRARY_PATH"
echo "LIBDIR: $LIBDIR"
echo "PYTHONPATH: $PYTHONPATH"
echo "Library search path:"
echo `ldconfig -v 2>/dev/null | grep -v ^$'\t'`

cd ${P8MORPHODIR}
pip install .[all]

# Testing if morpho is working
cd examples
morpho -c morpho_test/scripts/morpho_linear_fit.yaml 

