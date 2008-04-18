# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
pkgname=xf86-video-amd
pkgver=2.7.7.6
pkgrel=1
pkgdesc="X.org AMD/Geode LX & NX video driver"
# there is no 64bit geode yet!
arch=(i686)
url="http://xorg.freedesktop.org/"
makedepends=('pkgconfig' 'xorg-server>=1.4')
options=('!libtool')
license=('custom:amd')
groups=('xorg-video-drivers')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2)

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --build=${CHOST} --host=${CHOST} \
	      --enable-visibility
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1

  install -D -m644 ${startdir}/src/${pkgname}-${pkgver}/COPYING \
                   ${startdir}/pkg/usr/share/licenses/${pkgname}/COPYING
}
md5sums=('e839cc4552032b7bd44beb72e575980f')
