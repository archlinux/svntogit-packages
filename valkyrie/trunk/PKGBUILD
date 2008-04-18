# $Id$
# Maintainer : Aaron Griffin <aaron@archlinux.org>

pkgname=valkyrie
pkgver=1.2.0
pkgrel=2
pkgdesc="an open-source graphical user interface for the valgrind 3.X line"
arch=(i686 x86_64)
url="http://www.open-works.co.uk/projects/valkyrie.html"
depends=(valgrind qt3)
source=(http://valgrind.org/downloads/$pkgname-$pkgver.tar.bz2)
md5sums=('231982dc7063593f15ed2f93b85d0b2e')
options=('keepdocs')

build()
{
  . /etc/profile.d/qt3.sh
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr 
  sed -i "s|#define VK_DOC_PATH.*|#define VK_DOC_PATH \"/share/doc/\"|g" config.h
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
  mkdir -p $startdir/pkg/usr/share
  mv $startdir/pkg/usr/doc $startdir/pkg/usr/share
}
