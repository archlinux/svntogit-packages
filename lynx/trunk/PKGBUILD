# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
pkgname=lynx
pkgver=2.8.6
pkgrel=1
pkgdesc="A text browser for the World Wide Web"
url="http://lynx.isc.org/"
arch=(i686 x86_64)
license=('GPL')
depends=('ncurses' 'openssl')
source=(http://lynx.isc.org/release/${pkgname}${pkgver}.tar.gz)
url="http://lynx.isc.org"
backup=('etc/lynx.cfg')
md5sums=('2158041a3fdb5d094831da2c82cfcaba')

build() {
  cd $startdir/src/${pkgname}2-8-6
  ./configure --prefix=/usr --sysconfdir=/etc --with-ssl --enable-nls
  make || return 1
  make DESTDIR=$startdir/pkg install
}
