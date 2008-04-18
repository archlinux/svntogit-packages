# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: whisky <archlinux.cle(at)gmail.com>

pkgname=scim-chewing
pkgver=0.3.1
pkgrel=2
pkgdesc="SCIM Smart Chewing input method engine"
arch=(i686 x86_64)
url="http://chewing.csie.net/"
license="GPL"
depends=('scim>=1.4.7' 'libchewing>=0.3.0')
source=(http://chewing.csie.net/download/scim/$pkgname-$pkgver.tar.gz)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure   --prefix=/usr \
  		--disable-static
  make || return 1
  make DESTDIR=$startdir/pkg install
  find $startdir/pkg -name '*.la' -exec rm {} \;
}


