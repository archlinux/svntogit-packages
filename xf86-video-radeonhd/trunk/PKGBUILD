# $Id$
# Maintainer:  <juergen@archlinux.org>
pkgname=xf86-video-radeonhd
pkgver=1.1.0
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

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --build=${CHOST} --host=${CHOST}
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  install -m644 -D ${startdir}/src/${pkgname}-${pkgver}/COPYING \
                   ${startdir}/pkg/usr/share/licenses/${pkgname}/LICENSE || return 1
}
md5sums=('ec31f738afd18da374e032e23ad08e21')
