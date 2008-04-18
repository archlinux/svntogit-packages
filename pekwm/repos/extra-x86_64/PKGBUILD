# $Id$
# Maintainer: Kevin Piche <kevin@archlinux.org>
# Contributor: Eddie Lozon <almostlucky@attbi.com>

pkgname=pekwm
pkgver=0.1.6
pkgrel=1
pkgdesc="A small, fast, functional, and flexible window manager"
arch=(i686 x86_64)
url="http://pekwm.org/"
source=(http://pekwm.org/files/$pkgname-$pkgver.tar.bz2 pekwm.desktop)
depends=('libjpeg' 'libpng' 'libxft' 'libxinerama' 'libxpm' 'libxrandr')
license=(GPL)
md5sums=('551358cbe15cfe7be3a7f614c49c1d00'
         '5a78fc6653fbb0b7282ecf7f1f81e2c5')

build() {
  cd $startdir/src/$pkgname-$pkgver
	
  # Default settings:
  #    --enable-shape --disable-xinerama --enable-menus \
  #    --enable-harbour --disable-pcre --disable-debug  \
  #    --enable-xft --enable-image-xpm --enable-image-jpeg \
  #    --enable-image-png --enable-xrandr
  ./configure --prefix=/usr --sysconfdir=/etc --enable-xinerama

  /usr/bin/make || return 1
  /usr/bin/make DESTDIR=$startdir/pkg install
  install -D -m644 $startdir/$pkgname.desktop \
                   $startdir/pkg/etc/X11/sessions/$pkgname.desktop
}
# vim: ts=2 sw=2 et ft=sh
