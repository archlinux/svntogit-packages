# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-video-fbdev
pkgver=0.3.1
pkgrel=4
pkgdesc="X.org framebuffer video driver"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=('glibc')
makedepends=('pkgconfig' 'xorg-server>=1.1.1')
groups=('xorg-video-drivers')
options=('nolibtool')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2)
md5sums=('9ae810c6c6c3c9713a67866fe794d4ff')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --build=${CHOST} --host=${CHOST}
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
