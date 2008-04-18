# $Id$
# Maintainer: Jason Chu <jason@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>

pkgname=gift
pkgver=0.11.8.1
pkgrel=3
pkgdesc="A bridge between P2P protocols and front-ends."
depends=('libvorbis' 'libtool' 'perl')
source=(http://dl.sourceforge.net/sourceforge/gift/$pkgname-$pkgver.tar.bz2)
md5sums=('1c70477af403af142359d07ee4a03348')
url="http://gift.sourceforge.net"

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
