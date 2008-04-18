# $Id$
# Maintainer: Paul Mattal <paul@mattal.com>
pkgname=itext
pkgver=2.0.7
pkgrel=1
pkgdesc="Java Library for creating and manipulating PDFs on the fly"
arch=(i686 x86_64)
url="http://itext.sourceforge.net"
license=('MPL' 'LGPL')
depends=(java-runtime)
conflicts=()
replaces=()
backup=()
install=
source=(http://superb-east.dl.sourceforge.net/sourceforge/$pkgname/iText-$pkgver.jar)
md5sums=('b6d5ee05a3f1ed507cf2a67486814618')

build() {
  cd $startdir/src || return 1
  install -D -m644 iText-$pkgver.jar \
  	$startdir/pkg/usr/share/java/$pkgname/$pkgname.jar || return 1
}
