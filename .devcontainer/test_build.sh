set -e 

git clone https://github.com/FEniCS/dolfinx.git --depth 1
cd dolfinx/cpp
cmake . -GNinja
ninja
rm -rf dolfinx