# $Id$
# Maintainer: Thomas Baechler <thomas@archlinux.org>

pkgname=codecs
pkgver=20071007
pkgrel=1
pkgdesc="Non-linux native codec pack. (Win32, Real9, QuickTime)"
arch=(i686 x86_64)
# The codec packages are different
# only the 32 bit package needs legacy libstdc++
[ "$CARCH" = "i686" ] && depends=('libstdc++5')
[ "$CARCH" = "x86_64" ] && depends=('gcc-libs')
options=('!strip')
url="http://www.mplayerhq.hu/homepage/design7/codecs.html"

md5sums=('4ea9c2dbd0945c83af1a8d0dd363993c')
_arch=""
if [ "${CARCH}" = "x86_64" ]; then
  _arch="-amd64"
  md5sums=('8e1ceeec51469f5baac65e56fac709e8')
fi
source=(http://www.mplayerhq.hu/MPlayer/releases/codecs/essential${_arch}-${pkgver}.tar.bz2)

build() {
  mkdir -p ${startdir}/pkg/usr/lib/${pkgname}
  cd ${startdir}/pkg/usr/
  #ln -s ../lib/${pkgname} lib/win32
  install -m755 ${startdir}/src/essential${_arch}-${pkgver}/* ${startdir}/pkg/usr/lib/${pkgname}
  rm ${startdir}/pkg/usr/lib/${pkgname}/README
}
