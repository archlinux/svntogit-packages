# $Id$
# Contributor: Paul Mattal <paul@mattal.com>
# Maintainer: Paul Mattal <paul@archlinux.org>
pkgname=nuvexport
pkgver=20070211
relnum=0.4
pkgrel=1
pkgdesc="Export for MythTV nuv files to other formats (DVD/SVCD/DivX,etc.)"
arch=(i686 x86_64)
url="http://forevermore.net/files/nuvexport"
license=""
depends=(perl perl-dbi 'ffmpeg>=20060920' perl-dbd-mysql perl-date-manip)
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://forevermore.net/files/nuvexport/$pkgname-$relnum-0.$pkgver.svn.tar.bz2 $pkgname-ipod-disable.patch)
md5sums=('9520427459fe37fc04d8e556fde5d317' 'acd2dad9987e68359ead8b0be5e5797c')

build() {
  cd $startdir/src/$pkgname-$relnum

  sed -i "s|prefix=/usr/local|prefix=$startdir/pkg/usr|g" Makefile || return 1
  sed -i "s|/usr/bin/install|/bin/install|g" Makefile || return 1
  sed -i "s|sysconfdir=/etc|sysconfdir=$startdir/pkg/etc|g" Makefile || return 1

  mkdir $startdir/pkg/usr || return 1
  make install || return 1
  sed -i "s|/tmp/fifodir|/var/tmp/fifodir|g" $startdir/pkg/usr/share/nuvexport/export/*.pm || return 1
}
