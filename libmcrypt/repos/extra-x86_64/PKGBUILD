# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=libmcrypt
pkgver=2.5.8
pkgrel=1
pkgdesc="A library which provides a uniform interface to several symmetric encryption algorithms"
arch=(i686 x86_64)
license=('LGPL')
depends=('glibc')
options=('nolibtool')
source=(http://heanet.dl.sourceforge.net/mcrypt/${pkgname}-${pkgver}.tar.bz2)
url="http://mcrypt.sourceforge.net/"
md5sums=('c4f491dd411a09e9de3b8702ea6f73eb')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr 
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
