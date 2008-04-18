# $Id$
# Maintainer: Kevin Piche <kevin@archlinux.org>
# Contributor: K. Piche <kpiche@rogers.com>

pkgname=lde
pkgver=2.6.1
pkgrel=2
pkgdesc="A disk editor for linux"
arch=(i686 x86_64)
license=('GPL')
url="http://lde.sourceforge.net/"
source=(http://dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
depends=('gpm')

build() {
  cd $startdir/src/$pkgname
  ./configure --prefix=/usr
  sed -e 's/daylight/daylight2/g' -i src/swiped/cnews/getdate.y
  sed -e 's@/sbin@${prefix}/sbin@g' -i Makefile
  make || return 1
  make prefix=$startdir/pkg/usr mandir=$startdir/pkg/usr/share/man/man8 \
       INSTALL='install -Dc' install
}
