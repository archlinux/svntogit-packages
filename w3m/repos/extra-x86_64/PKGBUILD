# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
pkgname=w3m
pkgver=0.5.2
pkgrel=2
pkgdesc="A pager/text-based WWW browser"
arch=(i686 x86_64)
license=('custom')
depends=('openssl>=0.9.8e' 'gc>=7.0' 'ncurses' 'zlib')
source=(http://downloads.sourceforge.net/sourceforge/w3m/$pkgname-$pkgver.tar.gz)
md5sums=('ba06992d3207666ed1bf2dcf7c72bf58')
url="http://w3m.sourceforge.net/"

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --libexecdir=/usr/lib --enable-ansi-color --disable-mouse --disable-w3mmailer --with-imagelib=no --with-termlib=ncurses
  make || return 1
  make DESTDIR=${startdir}/pkg install
  install -Dm644 $startdir/src/$pkgname-$pkgver/doc/README $startdir/pkg/usr/share/licenses/$pkgname/README
}
