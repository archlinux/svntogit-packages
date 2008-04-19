# $Id$
# Maintainer: Travis Willard <travis@archlinux.org>
# Contributor: amdviaman

pkgname=catalyst
pkgver=8.4
_kernel_version=2.6.25
pkgrel=1
pkgdesc="Proprietary AMD/ATI kernel drivers for Radeon brand cards. Stock kernel."
arch=('i686' 'x86_64')
url="http://www.ati.amd.com"
license=('custom') 
depends=("catalyst-utils>=${pkgver}" "kernel26>=${_kernel_version}" "kernel26<=${_kernel_version}.9999")
makedepends=()
replaces=('ati-fglrx' 'fglrx') # Yay rebranding
install=${pkgname}.install
source=(http://www2.ati.com/drivers/linux/ati-driver-installer-${pkgver/./-}-x86.x86_64.run compat-2.6.25.diff)
md5sums=('8fa23f45b4becc9721e67858e41ff85c'
         'b5eab9bcdbe05913ed263f3a3cd01a4f')
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

    # patch catalyst 8.4 to work with 2.6.25
    patch -p1 < $startdir/src/compat-2.6.25.diff

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

