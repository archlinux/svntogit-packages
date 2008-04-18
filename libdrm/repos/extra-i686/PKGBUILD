# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libdrm
pkgver=2.3.0
pkgrel=1
pkgdesc="Userspace interface to kernel DRM services"
arch=(i686 x86_64)
depends=('glibc')
options=('nolibtool')
url="http://dri.freedesktop.org/"
source=(http://dri.freedesktop.org/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('01a1e1ee0268a2403db42fa630036ab2')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
