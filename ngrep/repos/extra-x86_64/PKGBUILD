# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=ngrep
pkgver=1.45
pkgrel=4
pkgdesc="A grep-like utility that allows you to search for network packets on an interface"
arch=('i686' 'x86_64')
url="http://ngrep.sourceforge.net/"
license=('custom')
depends=('libpcap>=0.9.8')
source=(http://downloads.sourceforge.net/sourceforge/ngrep/ngrep-$pkgver.tar.bz2)
md5sums=('bc8150331601f3b869549c94866b4f1c')
sha1sums=('f26090a6ac607db66df99c6fa9aef74968f3330f')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  mkdir -p $startdir/pkg/usr/{bin,man/man8}
  make DESTDIR=$startdir/pkg install
  install -D -m644 LICENSE.txt ${startdir}/pkg/usr/share/licenses/${pkgname}/LICENSE.txt
}
