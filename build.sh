#!/bin/bash
set -e
VER=${1:-$(rpm -q --qf '%{version}-%{release}' kernel-core)}  # e.g. 6.12.0-11.el10
mkdir -p ~/rpmbuild/SOURCES ~/rpmbuild/SPECS repo
curl -L https://dl.rockylinux.org/pub/rocky/10/BaseOS/aarch64/os/Packages/k/kernel-$VER.src.rpm -o kernel.src.rpm
rpm -i kernel.src.rpm
cd ~/rpmbuild/SPECS
patch -p0 < ~/rocky-10-rpi-mmc-builder/mmc.patch
rpmbuild -bb --target aarch64 kernel-rpi-mmc.spec
cp ~/rpmbuild/RPMS/aarch64/kernel-rpi-mmc-modules-*.rpm ~/rocky-10-rpi-mmc-builder/repo/
cd ~/rocky-10-rpi-mmc-builder
createrepo_c repo/
gpg --detach-sign --armor repo/repodata/repomd.xml
