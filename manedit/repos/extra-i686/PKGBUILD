# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=manedit
pkgver=1.1.1
pkgrel=1
pkgdesc="An editor specifically tailored for UNIX manual pages"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.battlefieldlinux.com/wolfpack/ManEdit/"
depends=('gcc-libs' 'bzip2' 'zlib' 'gtk')
source=(http://www.battlefieldlinux.com/wolfpack/packages/$pkgname-$pkgver.tar.bz2)
md5sums=('6def89c1fd425dc057606c2346cc5e5b')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure Linux --prefix=/usr -v --enable="arch-$CARCH"
  make all || return 1
  make PREFIX=$startdir/pkg/usr install
  # move manpage to FHS location
  mv $startdir/pkg/usr/man $startdir/pkg/usr/share/man
}
