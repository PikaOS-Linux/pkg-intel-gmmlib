#! /bin/bash

DEBIAN_FRONTEND=noninteractive

# Clone Upstream
git clone https://github.com/intel/gmmlib ./intel-gmmlib -b intel-gmmlib-22.3.12
cp -rvf ./debian ./intel-gmmlib/
cd ./intel-gmmlib/

# Get build deps
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
