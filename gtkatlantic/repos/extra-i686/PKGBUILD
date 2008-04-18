# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Kritoke <typeolinux@yahoo.com>

pkgname=gtkatlantic
pkgver=0.4.2
pkgrel=1
pkgdesc="Monopoly board game client for the monopd server."
depends=('gtk2' 'libxml2' 'libpng')
url="http://gtkatlantic.gradator.net/"
#source=(http://dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
source=(http://gtkatlantic.gradator.net/downloads/v0.4/$pkgname-$pkgver.tar.gz)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}

