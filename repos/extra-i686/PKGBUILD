# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Leslie P. Polzer <leslie.polzer@gmx.net>
pkgname=xcompmgr
pkgver=1.1.1
pkgrel=2
pkgdesc="Composite Window-effects manager for X.org"
url="http://www.freedesktop.org/Software/xapps"
depends=('libxcomposite' 'libxdamage' 'libxrender')
conflicts=('xapps')
replaces=('xapps')
source=(http://freedesktop.org/xapps/release/$pkgname-$pkgver.tar.bz2)
md5sums=('5c7b7e1c0360fec4b185cf575cf3fa0a')
force=y

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}

