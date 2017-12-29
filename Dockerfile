FROM tensorflow/tensorflow:latest-devel-gpu-py3

LABEL maintainer "John Bjorn Nelson <jbn@falsifiable.com>"

RUN apt-get -y update 

WORKDIR /tmp

###############################################################################
# Python 3.5
###############################################################################

# ENV CONDA_INSTALLER Anaconda3-4.2.0-Linux-x86_64.sh

# RUN apt-get -y install curl && \
#     curl -O https://repo.continuum.io/archive/${CONDA_INSTALLER} && \
#     bash ${CONDA_INSTALLER} -b -p /opt/conda && \
#     rm ${CONDA_INSTALLER}

###############################################################################
# R
###############################################################################

# RUN apt-get -y install r-base 

###############################################################################
# Julia
###############################################################################

# ENV JULIA_INSTALLER julia-0.6.1-linux-x86_64

# RUN curl -O https://julialang-s3.julialang.org/bin/linux/x64/0.6/${JULIA_INSTALLER}.tar.gz && \
#     mkdir ${JULIA_INSTALLER} && \
#     tar -xf ${JULIA_INSTALLER}.tar.gz -C ${JULIA_INSTALLER} --strip-components=1 && \
#     mv ${JULIA_INSTALLER} /opt/julia && \
#     ln -s /opt/julia/bin/julia /usr/local/bin/julia && \
#     rm ${JULIA_INSTALLER}.tar.gz

###############################################################################
# Customizations
###############################################################################

ENV PATH /opt/conda/bin:${PATH}

COPY requirements.txt /tmp/requirements.txt

RUN apt-get install -y libjpeg-dev && \
    pip install --upgrade pip && \
    pip install --upgrade --ignore-installed -r requirements.txt

# COPY install_packages.R /tmp/install_packages.R

# RUN apt-get install -y curl openssl openssl

# RUN echo 'options(repos = c(CRAN = "http://cran.rstudio.com"))' > ~/.Rprofile && \
#     Rscript install_packages.R

EXPOSE 8888

WORKDIR /workspace
