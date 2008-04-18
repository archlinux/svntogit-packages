# $Id$
# Maintainer: eric <eric@archlinux.org>
# Contributor: orelien <orelien@chez.com>

pkgname=figlet
pkgver=2.2.2
pkgrel=1
pkgdesc="FIGlet is a program for making large letters out of ordinary text"
depends=('glibc')
source=(ftp://ftp.figlet.org/pub/figlet/program/unix/$pkgname`echo $pkgver | sed 's/\.//g'`.tar.gz)
url="http://www.figlet.org/"
md5sums=('9fcf4f1651b8e6d3f56f1ef665285b2e')

build() {
  cd $startdir/src/$pkgname`echo $pkgver | sed 's/\.//g'`
  make DEFAULTFONTDIR=/usr/share/figlet/fonts all || return 1
  mkdir -p $startdir/pkg/usr/{bin,man/man6,share/figlet/fonts}
  make install \
    DESTDIR=$startdir/pkg/usr/bin \
    MANDIR=$startdir/pkg/usr/man/man6 \
    DEFAULTFONTDIR=$startdir/pkg/usr/share/figlet/fonts
  chmod 755 $startdir/pkg/usr/bin/{figlist,showfigfonts}
}
