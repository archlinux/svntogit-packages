# $Id$
# Contributor: Kritoke <kritoke@gamebox.net>
# Maintainer: damir <damir@archlinux.org>

pkgname=libcapsinetwork
pkgver=0.3.0
pkgrel=1
pkgdesc="A network library for C++ server daemons aimed at easy development of server daemons."
depends=('glibc')
url="http://www.robertjohnkaper.com/software/atlantik/download.html"
source=(http://www.robertjohnkaper.com/downloads/atlantik/libcapsinetwork-$pkgver.tar.gz)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  find $startdir/pkg -name '*.la' -exec rm {} \;
}
