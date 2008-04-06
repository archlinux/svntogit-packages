# $Id: PKGBUILD,v 1.8 2007/10/02 20:14:34 tom Exp $
# Maintainer: Tom K <tom@archlinux.org>

pkgname=frostwire
pkgver=4.13.3
pkgrel=1
pkgdesc="an absolutely free Gnutella P2P application, with added bittorrent support"
depends=('jre')
source=(http://www3.frostwire.com/frostwire/69421145/frostwire-$pkgver.noarch.tar.gz
	icons.tar.gz frostwire)
url="http://www.frostwire.com"
license="GPL"

build() {
  mkdir -p $startdir/pkg/usr/share/frostwire
  cp -r $startdir/src/frostwire-$pkgver.noarch/* $startdir/pkg/usr/share/frostwire
  cp -r $startdir/src/icons $startdir/pkg/usr/share
  install -Dm755 $startdir/src/frostwire $startdir/pkg/usr/bin/frostwire
  install -D $startdir/src/frostwire-$pkgver.noarch/frostwire.desktop \
  $startdir/pkg/usr/share/applications/frostwire.desktop
  install -D $startdir/src/icons/hicolor/16x16/apps/frostwire.png \
  $startdir/pkg/usr/share/pixmaps/frostwire.png
  # Remove .svn dirs & OSX script
  rm -rf $startdir/pkg/usr/share/frostwire/{runFrostwireOSX.sh,root/{.svn,magnet10/.svn}}
}
arch=('i686')
md5sums=('1c1ace91d6587dda86f063d965a2b6fe'
         'dbea03ff4e35cc6c190976282682c2cf'
         '88647e1dbbd3a86472739546b7107949')
