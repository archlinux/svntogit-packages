# $Id$
#Maintainer: Alexander Baldeck <alexander@archlinux.org>
#Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xorg-xfwp
pkgver=1.0.1
pkgrel=2
pkgdesc="X FireWall Proxy"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=('libxt' 'xorg-server-utils')
makedepends=('pkgconfig' 'xproxymngproto')
source=(${url}/releases/individual/app/xfwp-1.0.1.tar.bz2
        ${url}/releases/individual/app/proxymngr-1.0.1.tar.bz2
        ${url}/releases/individual/app/xfindproxy-1.0.1.tar.bz2)

build() {
  cd ${startdir}/src
  for i in *; do
    if [ -d "${i}" ]; then
      pushd "${i}"
      ./configure --prefix=/usr
      make || return 1
      make DESTDIR=${startdir}/pkg install || return 1
      popd
    fi
  done
}
