# $Id$
# Maintainer: simo <simo@archlinux.org>
# Contributor: Nikos Kouremenos <kourem@gmail.com>
pkgname=gajim
pkgver=0.11.4
pkgrel=3
pkgdesc="Jabber client written in PyGTK"
arch=(i686 x86_64)
url="http://www.gajim.org/"
license=('GPL')
depends=('gtkspell' 'sqlite3' 'dnsutils' 'pygtk' 'libxss' 'python>=2.5')
makedepends=('gettext' 'perlxml' 'dbus')
install=gajim.install
options=(!libtool)
source=(http://www.gajim.org/downloads/gajim-$pkgver.tar.gz 9283.diff)
md5sums=('ddcd445c82299535cad12401d877f7cc'
         '4f6b939e4fa3038ed62ceab4b52a40fa')

build() {
  cd $startdir/src/gajim-$pkgver
  
  # this will be included in gajim 0.12
  patch -p1 < $startdir/src/9283.diff
  
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
