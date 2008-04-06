# $Id: PKGBUILD,v 1.19 2008/03/21 17:13:00 tpowa Exp $
# Maintainer: Tom K <tom@archlinux.org>

pkgname=truecrypt
pkgver=4.3a
pkgrel=13
pkgdesc="Free open-source disk encryption software - module for kernel26"
arch=('i686' 'x86_64')
depends=('truecrypt-utils' 'kernel26>=2.6.24.3-4' 'kernel26<=2.6.25-0')
source=(http://www.truecrypt.org/downloads/truecrypt-$pkgver-source-code.tar.gz kernel-2.6.23.patch kernel-2.6.24.patch)
md5sums=('8f2536eae16e6044a22b2a82c7003357')
url="http://www.truecrypt.org/"
install=truecrypt.install
license=('custom')
#options=('force')

_kernver=2.6.24-ARCH

build() {
  cd $startdir/src/truecrypt-$pkgver-source-code/Linux/Kernel
  patch -Np0 -i $startdir/src/kernel-2.6.23.patch || return 1
  patch -Np0 -i $startdir/src/kernel-2.6.24.patch || return 1
  make KERNEL_SRC=/lib/modules/$_kernver/build || return 1
  install -Dm600 ../Kernel/truecrypt.ko $startdir/pkg/lib/modules/$_kernver/extra/truecrypt.ko

  # Update kernel version in .install script
  sed -i -e "s/KERNEL_VERSION=.*/KERNEL_VERSION=$_kernver/g" $startdir/truecrypt.install
}
