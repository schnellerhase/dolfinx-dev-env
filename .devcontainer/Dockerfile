FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y \
    catch2 \
    clangd \
    cmake \
    cmake-curses-gui \
    g++ \
    git \
    libboost-dev \
    libboost-timer-dev \
    libhdf5-mpi-dev \
    libopenblas-dev \
    libparmetis-dev \
    libpugixml-dev \
    libspdlog-dev \
    mpi-default-dev \
    ninja-build \
    pkg-config \
    python3 \
    python3-pip \
    python3-venv

ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN python3 -m pip install mpi4py nanobind scikit-build-core[pyproject] --upgrade

# For now the projects ufl, basix and ffcx are treated as strict dependencies and are not part of the dev env in that sense
#  -> that should be adapted in the future
RUN python3 -m pip install git+https://github.com/FEniCS/ufl.git
RUN python3 -m pip install git+https://github.com/FEniCS/basix.git
RUN python3 -m pip install git+https://github.com/FEniCS/ffcx.git
