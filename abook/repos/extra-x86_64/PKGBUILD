# $Id$
# Maintainer: damir <damir@archlinux.org>
pkgname=abook
pkgver=0.5.6
pkgrel=1
pkgdesc="A text-based addressbook designed to use with mutt mail client."
arch=(i686 x86_64)
url="http://abook.sourceforge.net"
depends=('readline')
source=(http://switch.dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}

