# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
pkgname=kernel-headers
pkgver=2.6.24.3
_basever=2.6.24
pkgrel=1
pkgdesc="Kernel headers sanitized for use in userspace"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnu.org/software/libc"
groups=('base')
source=(ftp://ftp.kernel.org/pub/linux/kernel/v2.6/linux-${_basever}.tar.bz2
	http://www.kernel.org/pub/linux/kernel/v2.6/patch-${pkgver}.bz2
	if_addrlabel.h.patch)
md5sums=('3f23ad4b69d0a552042d1ed0f4399857'
         '4c42be33a7d98f280588c9d28478cdfd'
	 '1f27d84eeb9857c462af1bd3f966d71f')

build() {
  cd ${startdir}/src/linux-${_basever}
  patch -Np1 -i ${startdir}/src/patch-${pkgver} || return 1
  patch -Np1 -R -i ${startdir}/src/if_addrlabel.h.patch || return 1

  make mrproper
  make headers_check || return 1
  make INSTALL_HDR_PATH=${startdir}/pkg/usr headers_install
}
