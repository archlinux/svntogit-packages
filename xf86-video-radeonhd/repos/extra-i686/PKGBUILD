# $Id$
# Maintainer:  <juergen@archlinux.org>
pkgname=xf86-video-radeonhd
pkgver=1.2.1
pkgrel=1
pkgdesc="Experimental Radeon HD video driver for r500 and r600 ATI cards"
arch=(i686 x86_64)
url="http://wiki.x.org/wiki/radeonhd"
license=('custom')
depends=('glibc')
makedepends=('pkgconfig' 'xorg-server' 'diffutils')
options=('!libtool')
conflicts=('xf86-video-radeonhd-git')
replaces=('xf86-video-radeonhd-git')
groups=('xorg-video-drivers')
source=(ftp://ftp.freedesktop.org/pub/individual/driver/$pkgname-$pkgver.tar.bz2)
md5sums=('9db15e1f1f891f514ca72dd9a3cc360a')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --build=${CHOST} --host=${CHOST}
  make DESTDIR=${startdir}/pkg install || return 1
  install -m644 -D ${startdir}/src/${pkgname}-${pkgver}/COPYING \
                   ${startdir}/pkg/usr/share/licenses/${pkgname}/LICENSE || return 1
}
