# $Id$
# Maintainer: eric <eric@archlinux.org>
# Contributor: Ben <ben@benmazer.net>

pkgname=dosbox
pkgver=0.72
pkgrel=3
pkgdesc="An emulator with builtin DOS for running DOS Games"
arch=(i686 x86_64)
url="http://dosbox.sourceforge.net/"
license=('GPL')
depends=('sdl_net' 'sdl_sound' 'libgl' 'libpng' 'alsa-lib' 'libgl')
source=(http://heanet.dl.sourceforge.net/sourceforge/dosbox/$pkgname-$pkgver.tar.gz)


build()
{
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc/dosbox
  make || return 1
  make prefix=$startdir/pkg/usr install
}
# vim: ts=2 sw=2 et ft=sh

md5sums=('262939cc28966c1f9b07c2bc472b699f')
