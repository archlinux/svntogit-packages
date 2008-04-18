# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
# Committer: Judd Vinet <jvinet@zeroflux.org>
pkgname=lesstifextensions
pkgver=9.0.9
pkgrel=3
pkgdesc="Extensions for lesstif"
depends=('lesstif')
source=(ftp://ftp.hungry.com/pub/hungry/lesstif/srcdist/LessTifExtensions-$pkgver.tar.gz)
md5sums=('865194144aa96c3a077d7807aab8f6aa')

build() {
  cd $startdir/src/LessTifExtensions-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  rm -rf $startdir/pkg/usr/LessTif
  find $startdir/pkg -name '*.la' -exec rm {} \;
}
