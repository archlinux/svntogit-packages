# $Id$
# Maintainer: damir <damir@archlinux.org>

pkgname=pth
pkgver=2.0.7
pkgrel=1
pkgdesc="The GNU Portable Threads."
arch=(i686)
url="http://www.gnu.org/software/pth"
depends=(glibc)
options=(NOLIBTOOL)
source=(ftp://ftp.gnu.org/gnu/pth/${pkgname}-${pkgver}.tar.gz)
md5sums=(9cb4a25331a4c4db866a31cbe507c793)

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
