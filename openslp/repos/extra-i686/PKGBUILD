# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
pkgname=openslp
pkgver=1.2.1
pkgrel=1
arch=(i686 x86_64)
depends=('glibc' 'bash' 'openssl>=0.9.8b')
pkgdesc="Open-source implementation of Service Location Protocol"
options=('nolibtool')
source=(http://heanet.dl.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz rc.slpd)
url="http://www.openslp.org"
md5sums=('ff9999d1b44017281dd00ed2c4d32330' '4f6889a5944894b8be2c01404a9566d2')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install

  mkdir -p ${startdir}/pkg/etc/rc.d
  install -m755 ${startdir}/src/rc.slpd ${startdir}/pkg/etc/rc.d/slpd
}
