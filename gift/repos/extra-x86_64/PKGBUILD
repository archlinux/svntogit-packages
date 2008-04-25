# $Id$
# Maintainer: Kevin <kevin@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>

pkgname=gift
pkgver=0.11.8.1
pkgrel=4
pkgdesc="A bridge between P2P protocols and front-ends."
arch=(i686 x86_64)
license=('GPL')
depends=('libvorbis' 'libtool>=2.2' 'perl')
source=(http://dl.sourceforge.net/sourceforge/gift/$pkgname-$pkgver.tar.bz2)
md5sums=('1c70477af403af142359d07ee4a03348')
url="http://gift.sourceforge.net"

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --mandir=/usr/share/man
  make || return 1
  make DESTDIR=$startdir/pkg install
}
