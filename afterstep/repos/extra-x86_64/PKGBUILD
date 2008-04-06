# $Id: PKGBUILD,v 1.8 2007/09/11 06:57:41 eric Exp $
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: DaNiMoTh <jjdanimoth@gmail.com>
pkgname=afterstep
pkgver=2.2.7
pkgrel=1
pkgdesc="A Window Manager based on NextStep Interface"
arch=(i686 x86_64)
url="http://www.afterstep.org"
license=('GPL')
depends=('gtk2' 'libpng' 'libtiff' 'readline' 'freetype2' 'libsm' \
         'librsvg')
makedepends=('pkgconfig' 'libxt')
source=(http://dl.sourceforge.net/sourceforge/afterstep/AfterStep-${pkgver}.tar.bz2)
md5sums=('0a6018f7afd8aa7ac1555e9ff3944e3a')

build() {
  cd $startdir/src/AfterStep-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  install -D -m644 AfterStep.desktop $startdir/pkg/etc/X11/sessions/AfterStep.desktop
}
