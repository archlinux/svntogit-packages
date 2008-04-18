# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=lft
pkgver=3.0
pkgrel=3
pkgdesc="A layer four traceroute implementing numerous other features"
arch=(i686 x86_64)
license=('custom')
url="http://oppleman.com/lft/"
depends=('glibc' 'libpcap>=0.9.8')
source=(http://pwhois.org/dl/index.who?file=${pkgname}-${pkgver}.tar.gz)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  /usr/bin/make || return 1
  /usr/bin/make prefix=$startdir/pkg/usr install

  install -D -m644 $startdir/src/$pkgname-$pkgver/COPYING \
    ${startdir}/pkg/usr/share/licenses/${pkgname}/license
}

md5sums=('678c61164c16da77090c43720676c531')
sha1sums=('4221e1487916e34604b2835e83e869eb8aae0454')
