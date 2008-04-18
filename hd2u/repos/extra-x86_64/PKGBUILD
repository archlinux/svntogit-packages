# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=hd2u
pkgver=1.0.1
pkgrel=1
pkgdesc="dos2unix is filter used to convert plain texts from DOS (CR/LF) format to UNIX format (CR) and vice versa."
arch=("i686" "x86_64")
url="http://www.megaloman.com/~hany/software/hd2u/"
depends=(popt)
source=(http://www.megaloman.com/~hany/_data/hd2u/$pkgname-$pkgver.tgz)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
