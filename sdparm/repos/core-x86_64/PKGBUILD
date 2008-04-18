# $Id$
# Maintainer: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: grimi@poczta.fm

pkgname=sdparm
pkgver=1.02
pkgrel=2
pkgdesc="An utility similar to hdparm but for SCSI devices"
arch=('i686' 'x86_64')
url="http://sg.torque.net/sg/sdparm.html"
groups=('base')
license=('BSD')
depends=('glibc')
source=("http://sg.torque.net/sg/p/$pkgname-$pkgver.tgz")
md5sums=('cc6de6fdba91f382d00b9b8a09dd14f2')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
  install -Dm644 COPYING $startdir/pkg/usr/share/licenses/sdparm/COPYING
}
