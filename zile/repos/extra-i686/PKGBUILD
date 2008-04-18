# $Id$
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: Kevin Piche <kevin@archlinux.org>

pkgname=zile
pkgver=2.2.56
pkgrel=1
pkgdesc="A small, fast, and powerful Emacs clone"
arch=(i686 x86_64)
url="http://zile.sourceforge.net/"
makedepends=('texinfo')
depends=('ncurses')
license=('GPL')
source=(http://dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('22e072e895e793928cdaac74068d91aa')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
