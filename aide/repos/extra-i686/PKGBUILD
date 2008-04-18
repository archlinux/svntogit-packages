# $Id$
# Maintainer: gregor <gregor@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
#
# homepage:   http://www.cs.tut.fi/~rammer/aide.html
# build deps: libgcrypt mhash
pkgname=aide
pkgver=0.13.1
pkgrel=1
pkgdesc="AIDE (Advanced Intrusion Detection Environment) is a file integrity checker"
arch=('i686' 'x86_64')
url="http://www.cs.tut.fi/~rammer/aide.html"
license=('GPL' 'custom')
makedepends=('mhash') # no deps, it's statically linked but needed for compile
source=(http://dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz
        aide.conf.default)
md5sums=('27978cc6bca4f0fbf3f6f5a1b330661c' '22e702e54006384d7ef8a5e46a29e758')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR=$startdir/pkg install

  install -D -m644 $startdir/src/aide.conf.default \
  $startdir/pkg/etc/aide.conf.archlinux
  install -D -m644 doc/aide.conf $startdir/pkg/etc/aide.conf.demo

  # Install license - GPL + modified artistic license
  install -D -m644 $startdir/src/$pkgname-$pkgver/LICENSE-snprintf.txt \
                   $startdir/pkg/usr/share/licenses/$pkgname/LICENSE-snprintf.txt
}
