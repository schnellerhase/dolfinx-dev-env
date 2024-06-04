FROM ubuntu:24.04

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

# TODO: make this injectable to Dockerfile
WORKDIR /
RUN git clone https://github.com/schnellerhase/dolfinx.git

# build cpp/
RUN mkdir /dolfinx/cpp/build
WORKDIR /dolfinx/cpp/build
RUN cmake .. -GNinja -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
RUN ninja install

# install python/
WORKDIR /dolfinx/python
RUN python -m pip install .


# ----- CONTENTS OF dolfinx.conf ----
# Common Unix variables
RUN export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
RUN export PATH=/usr/local/bin:$PATH
RUN export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
RUN export CMAKE_PREFIX_PATH=/usr/local/lib/cmake:$CMAKE_PREFIX_PATH

# Special macOS variables
RUN export DYLD_FRAMEWORK_PATH=/opt/local/Library/Frameworks:$DYLD_FRAMEWORK_PATH
# -----------------------------------
