FROM dolfinx/dolfinx:nightly

RUN apt-get update 
RUN apt-get install -y \
    clangd \
    cmake-curses-gui \
    libspdlog-dev

# For now the projects ufl, basix and ffcx are treated as strict dependencies and are not part of the dev env in that sense
#  -> that should be adapted in the future
RUN python3 -m pip install git+https://github.com/FEniCS/ufl.git --break-system-packages
RUN python3 -m pip install git+https://github.com/FEniCS/basix.git --break-system-packages
RUN python3 -m pip install git+https://github.com/FEniCS/ffcx.git --break-system-packages
