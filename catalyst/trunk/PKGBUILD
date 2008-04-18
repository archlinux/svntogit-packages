# $Id$
# Maintainer: Travis Willard <travis@archlinux.org>
# Contributor: amdviaman

pkgname=catalyst
pkgver=8.3
_kernel_version=2.6.24
pkgrel=2
pkgdesc="Proprietary AMD/ATI kernel drivers for Radeon brand cards. Stock kernel."
arch=('i686' 'x86_64')
url="http://www.ati.amd.com"
license=('custom') 
depends=("catalyst-utils>=${pkgver}" "kernel26>=${_kernel_version}.3-4" "kernel26<=${_kernel_version}.9999")
makedepends=()
replaces=('ati-fglrx' 'fglrx') # Yay rebranding
install=${pkgname}.install
source=(http://www2.ati.com/drivers/linux/ati-driver-installer-${pkgver/./-}-x86.x86_64.run)
md5sums=('42d8b1581a61c1945196dd5ed47519b8')

_kernver=${_kernel_version}-ARCH

build() {
    cd $startdir/src

    [ "$CARCH" = "i686" ] && _arch="x86"
    [ "$CARCH" = "x86_64" ] && _arch="x86_64"

    /bin/sh ./ati-driver-installer-${pkgver/./-}-x86.x86_64.run --extract archive_files

    cp $startdir/src/archive_files/arch/${_arch}/* $startdir/src/ -r 
    cp $startdir/src/archive_files/common/* $startdir/src/ -r 

    if [ "$CARCH" == "x86_64" ]; then
      cp $startdir/src/archive_files/x710_64a/* $startdir/src/ -r
    else
      cp $startdir/src/archive_files/x710/* $startdir/src/ -r
    fi
    cd $startdir/src
    cd $startdir/src/lib/modules/fglrx/build_mod/

    # Build the kernel module
    cp 2.6.x/Makefile .
    make -C /lib/modules/${_kernver}/build SUBDIRS="`pwd`" modules || return 1

    # Install the kernel module
    install -m 644 -D $startdir/src/lib/modules/fglrx/build_mod/fglrx.ko \
        $startdir/pkg/lib/modules/${_kernver}/video/fglrx.ko

    sed -i -e "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" $startdir/$install

    # install licenses
    install -m 0644 -D $startdir/src/archive_files/ATI_LICENSE.TXT \
                     $startdir/pkg/usr/share/licenses/${pkgname}/AMD_ATI_LICENSE.TXT

}

