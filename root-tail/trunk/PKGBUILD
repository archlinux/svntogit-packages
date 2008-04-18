# $Id$
# Maintainer: eric <eric@archlinux.org>
# Contributor:  John Sowiak <john@archlinux.org>

pkgname=root-tail
pkgver=1.2
pkgrel=2
pkgdesc="Displays logfiles in different colours on your root-window"
url="http://www.goof.com/pcg/marc/root-tail.html"
depends=('libxext')
makedepends=('imake')
source=(http://www.goof.com/pcg/marc/data/$pkgname-$pkgver.tar.gz)
md5sums=('5a4b3c4c7ab3bed1f4575e9688aac5de')

build() {
  cd $startdir/src/$pkgname-$pkgver
  /usr/bin/xmkmf -a
  /usr/bin/make || return 1
  /bin/sed -i "s|BINDIR = /usr/X11R6/bin|BINDIR = /usr/bin|" Makefile
  /bin/sed -i "s|MANPATH = /usr/X11R6/man|MANPATH = /usr/man|" Makefile
  /usr/bin/make DESTDIR=$startdir/pkg install || return 1
  /usr/bin/make DESTDIR=$startdir/pkg install.man || return 1
  /bin/rm $startdir/pkg/usr/X11R6/ -rfv
}
# vim: ts=2 sw=2 et ft=sh
