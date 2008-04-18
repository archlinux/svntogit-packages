# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
pkgname=strace
pkgver=4.5.16
pkgrel=1
pkgdesc="A useful diagnositic, instructional, and debugging tool"
arch=(i686 x86_64)
license=(CUSTOM)
url="http://www.liacs.nl/~wichert/strace/"
depends=('glibc')
source=(http://heanet.dl.sourceforge.net/sourceforge/strace/strace-$pkgver.tar.bz2)
md5sums=('77f66d09aa82981bb6d65fa19a2c1ba9')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  install -Dm644 COPYRIGHT ${startdir}/pkg/usr/share/licenses/strace/COPYRIGHT
}
