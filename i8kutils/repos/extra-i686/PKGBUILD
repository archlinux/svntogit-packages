# $Id$
# Maintainer: eric <eric@archlinux.org>
# Contributor: Eric Johnson <eric@coding-zone.com>
#

pkgname=i8kutils
pkgver=1.25
pkgrel=1
pkgdesc="Dell Inspiron/Latitude kernel driver and utilities"
url="http://people.debian.org/~dz/i8k/"
depends=('glibc')
source=(http://people.debian.org/~dz/i8k/$pkgname\_$pkgver.tar.gz)
md5sums=('50c03dde689c5709406118a7c6c120db')

build() {
  cd $startdir/src/$pkgname-$pkgver
  /usr/bin/make || return 1

  # no configure script, and Makefile has /usr hardcoded
  #
  /bin/install -D -m755 i8kctl $startdir/pkg/usr/bin/i8kctl
  /bin/install -D -m755 i8kbuttons $startdir/pkg/usr/bin/i8kbuttons
  /bin/install -D -m755 i8kbuttons $startdir/pkg/usr/bin/i8kbuttons
  /bin/install -D -m644 i8kbuttons.1 $startdir/pkg/usr/man/man1/i8kbuttons.1
  /bin/install -D -m644 i8kctl.1 $startdir/pkg/usr/man/man1/i8kctl.1
  /bin/ln -fs ./i8kctl $startdir/pkg/usr/bin/i8kfan
}
# vim: ts=2 sw=2 et ft=sh
