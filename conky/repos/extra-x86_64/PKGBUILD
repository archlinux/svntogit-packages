# $Id$
# Maintainer: James Rayner <james@archlinux.org>
# Contributor: MrGreen <mrgreen.linuxuser@gmail.com>

pkgname=conky
pkgver=1.5.1
pkgrel=1
pkgdesc="Conky is an advanced, highly configurable system monitor for X based on torsmo"
arch=(i686 x86_64)
url="http://conky.sourceforge.net/"
license=('custom')
replaces=('torsmo')
depends=('libxext' 'libxml2' 'curl' 'wireless_tools' 'libxft' 'glib2' 'libxdamage')
source=(http://optusnet.dl.sourceforge.net/sourceforge/conky/$pkgname-$pkgver.tar.bz2)
md5sums=('afc121a67e4405cb44b7738be79946ac')
build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --enable-xft --enable-mpd --enable-double-buffer \
  --enable-proc-uptime --enable-seti --enable-wlan --enable-rss 
  make || return 1
  make DESTDIR=$startdir/pkg install
  mkdir -p $startdir/pkg/etc/xdg/
  mv $startdir/pkg/usr/etc/conky/ $startdir/pkg/etc/xdg/
  rmdir $startdir/pkg/usr/etc
  install -D -m644 COPYING $startdir/pkg/usr/share/licenses/$pkgname/COPYING
}

