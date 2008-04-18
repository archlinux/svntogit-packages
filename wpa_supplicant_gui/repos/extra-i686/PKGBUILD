# $Id$
pkgname=wpa_supplicant_gui
pkgver=0.5.10
pkgrel=1
pkgdesc="A qt frontend to wpa_supplicant"
arch=('i686' 'x86_64')
depends=('qt>=4' 'wpa_supplicant=0.5.10')
license="GPL"
url="http://hostap.epitest.fi/wpa_supplicant"
source=(http://hostap.epitest.fi/releases/wpa_supplicant-$pkgver.tar.gz) 
md5sums=('9e7b99da67c47d81121368c6d580d069')

build() {
  cd $startdir/src/wpa_supplicant-$pkgver
  # gui
  cd wpa_gui-qt4
  qmake -makefile
  make || return 1
  install -D -m755 wpa_gui $startdir/pkg/usr/sbin/wpa_gui
}
