# $Id: PKGBUILD,v 1.16 2006/11/14 23:54:35 simo Exp $
# Maintainer: simo <simo@archlinux.org>
# Contributor: Eric Johnson <eric@coding-zone.com>
#

pkgname=archstats
pkgver=4.2
pkgrel=1
pkgdesc="Collect/upload system hardware/software info for ArchStats Project"
arch=(i686 x86_64)
url="http://archlinux.org/~simo/archstats"
backup=(etc/archstats/archstats.conf)
makedepends=('mhash' 'curl' 'zlib')
source=(http://archlinux.org/~simo/archstats/archstats/$pkgname-$pkgver.tar.bz2)
md5sums=('9eed0b39e789ed756bb0317572086c3e')

build() {
  cd $startdir/src/$pkgname-$pkgver
  sed -i "s/VERSION     = $pkgver/VERSION     = $pkgver-$CARCH/g" Makefile
  /usr/bin/make || return 1
  /usr/bin/make DESTDIR=$startdir/pkg install
}
# vim: ts=2 sw=2 et ft=sh
