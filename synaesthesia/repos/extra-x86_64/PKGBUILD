# $Id: PKGBUILD,v 1.6 2006/12/03 02:27:35 damir Exp $
# Maintainer: eric <eric@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
#

pkgname=synaesthesia
pkgver=2.4
pkgrel=1
pkgdesc="Represents music graphically as coruscating field of fog and glowing lines"
arch=(i686 x86_64)
url="http://www.logarithmic.net/pfh/Synaesthesia"
depends=('sdl' 'esd' 'gcc' 'libsm')
source=(http://www.logarithmic.net/pfh-files/synaesthesia/$pkgname-$pkgver.tar.gz)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
