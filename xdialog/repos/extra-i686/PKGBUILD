# $Id$
# Maintainer: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=xdialog
pkgver=2.3.1
pkgrel=1
pkgdesc="A drop-in replacement for the 'dialog' or 'cdialog' programs"
arch=(i686 x86_64)
depends=('gtk')
license=('GPL')
source=(http://thgodef.nerim.net/xdialog/Xdialog-$pkgver.tar.bz2)
md5sums=('0671f8353717513bf1f0ebc80e9710f6')
url="http://xdialog.dyns.net/"

build() {
  cd $startdir/src/Xdialog-$pkgver
  ./configure --prefix=/usr

  # Fix bugs in automake - see Xdialog.spec
  #
  /bin/sed -i -e "s:RANLIB = @RANLIB@:RANLIB = /usr/bin/ranlib:" lib/Makefile
  /bin/sed -i -e "s;XGETTEXT = :;XGETTEXT = /usr/bin/xgettext;" po/Makefile

  make || return 1
  make prefix=$startdir/pkg/usr install
}
# vim: ts=2 sw=2 et ft=sh
