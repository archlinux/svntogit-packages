# $Id$
# Maintainer; Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=xf86-input-keyboard
pkgver=1.2.2
pkgrel=2
pkgdesc="X.Org keyboard input driver"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=('glibc')
makedepends=('pkgconfig' 'xorg-server>=1.4')
options=('!libtool')
groups=('xorg' 'xorg-input-drivers')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2 \
        new-server.patch)

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  #patch -Np1 -i ${startdir}/src/new-server.patch || return 1
  #autoreconf -v --install
  ./configure --prefix=/usr \
              --build=${CHOST} --host=${CHOST}
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
md5sums=('ab3122921f6359c54e250879288ffd47'
         '6040fd1c6e8ec70184b2fc2e3d6a070c')
