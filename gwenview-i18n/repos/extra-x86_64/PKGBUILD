# $Id$
# Maintainer: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Johannes Lauer <grosser.schlumpf@gmx.de>
pkgname=gwenview-i18n
pkgver=1.4.2
pkgrel=1
pkgdesc="Language files for gwenview"
arch=('i686' 'x86_64')
url='http://gwenview.sourceforge.net'
license=('GPL')
depends=('gwenview')
source=("http://downloads.sourceforge.net/sourceforge/gwenview/${pkgname}-${pkgver}.tar.bz2")
md5sums=('68be7ede4c3a17e1c3f807e14143c967')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/opt/kde --enable-final || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
