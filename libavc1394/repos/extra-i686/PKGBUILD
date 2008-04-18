# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Robert Emil Berge <robert@rebi.no>

pkgname=libavc1394
pkgver=0.5.3
pkgrel=1
pkgdesc="A library to control A/V devices using the 1394ta AV/C commands."
arch=("i686" "x86_64")
depends=('libraw1394')
source=(http://dl.sourceforge.net/sourceforge/libavc1394/$pkgname\-$pkgver.tar.gz)
url="http://sourceforge.net/projects/libavc1394/"

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  find $startdir/pkg -name '*.la' -exec rm {} \;
}

