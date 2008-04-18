# $Id$
# Maintainer: eric <eric@archlinux.org>
# Contributor: Jochem Kossen <j.kossen@home.nl>

pkgname=docker
pkgver=1.5
pkgrel=3
pkgdesc="Docker is a docking application (WindowMaker dock app) which acts as a system tray for KDE and GNOME2."
depends=('glibc' 'glib2' 'libx11')
source=(http://icculus.org/openbox/2/$pkgname/$pkgname-$pkgver.tar.gz)
url="http://icculus.org/openbox/2/docker/"

build() {
  cd $startdir/src/$pkgname-$pkgver
  /bin/mkdir -p $startdir/pkg/usr/bin
  /usr/bin/make || return 1
  /usr/bin/make PREFIX=$startdir/pkg/usr install
}
# vim: ts=2 sw=2 et ft=sh
