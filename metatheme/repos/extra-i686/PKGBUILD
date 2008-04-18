# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=metatheme
pkgver=0.0.6
pkgrel=2
pkgdesc="a thin layer between QT+GTK2 toolkits and theme engines, creating unified API by which each theme engine can draw"
url="http://metatheme.advel.cz/"
license="gpl"
depends=('kdelibs' 'gtk2')
makedepends=('j2sdk')
source=($url/download/$pkgname-$pkgver.tar.bz2)
install=$pkgname.install

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  sed -i '543,545s/^/# /' toolkits/java/Makefile # disable broken swing default metatheme config (arch is not having a swing.properties file per default)
  make DESTDIR=$startdir/pkg install || return 1
  find $startdir/pkg -name '*.la' -exec rm {} \;
}
