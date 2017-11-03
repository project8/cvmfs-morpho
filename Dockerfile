FROM project8/cvmfs-dependencies-py:latest

ENV MORPHOBRANCH=release/1.2.5

RUN git clone https://github.com/project8/morpho.git /cvmfs/hep.pnnl.gov/project8/morpho/${MORPHOBRANCH} --recursive -b ${MORPHOBRANCH} --depth 1 && \
    rm -f /cvmfs/hep.pnnl.gov/project8/morpho/latest && \
    ln -s /cvmfs/hep.pnnl.gov/project8/morpho/${MORPHOBRANCH} /cvmfs/hep.pnnl.gov/project8/morpho/latest

ADD ./setup.sh /cvmfs/hep.pnnl.gov/project8/morpho/${MORPHOBRANCH}/setup.sh
ADD ./install.sh /cvmfs/hep.pnnl.gov/project8/morpho/${MORPHOBRANCH}/install.sh

## Installing morpho ##
RUN chmod +x /cvmfs/hep.pnnl.gov/project8/morpho/${MORPHOBRANCH}/install.sh && \
    sleep 1 && \
    /cvmfs/hep.pnnl.gov/project8/morpho/${MORPHOBRANCH}/install.sh
