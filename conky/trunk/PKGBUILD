# $Id$
# Maintainer: James Rayner <james@archlinux.org>
# Contributor: MrGreen <mrgreen.linuxuser@gmail.com>

pkgname=conky
pkgver=1.4.9
pkgrel=1
pkgdesc="Conky is an advanced, highly configurable system monitor for X based on torsmo"
arch=(i686 x86_64)
url="http://conky.sourceforge.net/"
license=('custom')
replaces=('torsmo')
depends=('libxext' 'libxml2' 'curl' 'wireless_tools' 'libxft' 'glib2' 'libxdamage')
source=(http://optusnet.dl.sourceforge.net/sourceforge/conky/$pkgname-$pkgver.tar.bz2)
build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --enable-xft --enable-mpd --enable-double-buffer \
  --enable-proc-uptime --enable-seti --enable-wlan --enable-rss 
  make || return 1
  make DESTDIR=$startdir/pkg install
  install -D -m644 doc/conkyrc.sample $startdir/pkg/etc/xdg/conky/conkyrc.sample
  install -D -m644 COPYING $startdir/pkg/usr/share/licenses/$pkgname/COPYING
}



md5sums=('42d966fce5aa5c5a326575ec214bff07')
