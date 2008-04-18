# $Id$
# Maintainer: eric <eric@archlinux.org>
# Contributor: Eric Johnson <eric@coding-zone.com>

pkgname=i8kmon
pkgver=1.25
pkgrel=3
pkgdesc="Tk script for i8kutils and Dell Inspiron/Latitude notebooks"
url="http://people.debian.org/~dz/i8k/"
depends=('i8kutils' 'tk')
backup=(etc/i8kutils/i8kmon.conf)
source=(http://people.debian.org/~dz/i8k/i8kutils_$pkgver.tar.gz i8kmon)
md5sums=('50c03dde689c5709406118a7c6c120db' 'a9e6594b4f2b31e03875adfbc405b393')

build() {
  cd $startdir/src/i8kutils-$pkgver

  # conform to Arch Linux guidelines
	#
  /bin/sed -i 's|/etc/i8kmon|/etc/i8kutils/i8kmon.conf|g' i8kmon.1
  /bin/sed -i 's|/etc/i8kmon|/etc/i8kutils/i8kmon.conf|g' i8kmon

  # no configure script, and Makefile has /usr hardcoded
	#
  /bin/install -D -m755 i8kmon $startdir/pkg/usr/bin/i8kmon
  /bin/install -D -m644 i8kmon.conf $startdir/pkg/etc/i8kutils/i8kmon.conf
  /bin/install -D -m644 i8kmon.1 $startdir/pkg/usr/man/man1/i8kmon.1

  # install daemon script.
  /bin/install -D -m755 ../i8kmon $startdir/pkg/etc/rc.d/i8kmon

}
# vim: ts=2 sw=2 et ft=sh
