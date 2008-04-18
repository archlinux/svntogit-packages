# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
pkgname=cvs
pkgver=1.11.22
pkgrel=6
pkgdesc="Concurrent Versions System - a source control system"
arch=(i686 x86_64)
license=('GPL')
depends=('heimdal>=1.0.1')
source=(ftp://ftp.gnu.org/non-gnu/cvs/source/stable/1.11.22/$pkgname-$pkgver.tar.bz2 \
        cvs-1.11.22-free.patch)
url="http://ximbiot.com/cvs/wiki/index.php"
md5sums=('f24043a640509aff1aa28871dd345762'
         'e1cc96a621de316dd719322c424a8334')

build() {
  cd $startdir/src/$pkgname-$pkgver
  unset EDITOR VISUAL
  patch -p1 -i $startdir/src/cvs-1.11.22-free.patch || return 1
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
