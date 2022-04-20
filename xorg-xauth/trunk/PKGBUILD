# Maintainer: Andreas Radke <andyrtr@archlinux.org>

pkgname=xorg-xauth
pkgver=1.1.2
pkgrel=1
pkgdesc="X.Org authorization settings program"
arch=(x86_64)
license=('custom')
url="https://xorg.freedesktop.org/"
depends=('libxmu')
makedepends=('xorg-util-macros')
groups=('xorg-apps' 'xorg')
source=(${url}/releases/individual/app/xauth-${pkgver}.tar.xz{,.sig})
sha512sums=('ac23fcd166b45abf7b030994ff3332c9906023dc1ddfa9b9d3000e6a914dc5e0213c4a2aa409cb3ddb93e1f9f4f6374376109241a95ef8c36af842de1f6f76e8'
            'SKIP')
validpgpkeys=('3BB639E56F861FA2E86505690FDD682D974CA72A') # Matt Turner <mattst88@gmail.com>
#validpgpkeys+=('995ED5C8A6138EB0961F18474C09DD83CAAA50B2') # "Adam Jackson <ajax@nwnk.net>"
#validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # "Alan Coopersmith <alan.coopersmith@oracle.com>"

build() {
  cd xauth-${pkgver}
  ./configure --prefix=/usr
  make
}

check() {
  cd xauth-${pkgver}
  make check
}

package() {
  cd xauth-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
