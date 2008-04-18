# $Id$
# Maintainer: Aaron Griffin <aaron@archlinux.org>
# Contributor: Jochem Kossen <j.kossen@home.nl>

pkgname=fluxconf
pkgver=0.9.9
pkgrel=1
pkgdesc="Configuration utility for the Fluxbox windowmanager"
arch=(i686 x86_64)
depends=('gtk2')
source=(http://devaux.fabien.free.fr/flux/$pkgname-$pkgver.tar.gz)
url="http://devaux.fabien.free.fr/flux/"
md5sums=('ac37b12410daa06128f8eb29163a741d')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  /usr/bin/make || return 1
  /usr/bin/make prefix=$startdir/pkg/usr install
  cd $startdir/pkg/usr/bin
  /bin/ln -sf $pkgname fluxbare
  /bin/ln -sf $pkgname fluxkeys
  /bin/ln -sf $pkgname fluxmenu
}
