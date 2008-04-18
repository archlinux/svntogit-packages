# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=eject
pkgver=2.1.5
pkgrel=3
pkgdesc="Eject is a program for ejecting removable media under software control"
arch=(i686 x86_64)
source=(http://www.pobox.com/~tranter/$pkgname-$pkgver.tar.gz eject-2.1.5-handle-spaces.patch)
url="http://ca.geocities.com/jefftranter@rogers.com/eject.html"
md5sums=('b96a6d4263122f1711db12701d79f738' '595b97c3bd56fd41e3b01b07885f81dc')

build() {
  cd $startdir/src/$pkgname
  patch -Np0 -i ../eject-2.1.5-handle-spaces.patch || return 1
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
