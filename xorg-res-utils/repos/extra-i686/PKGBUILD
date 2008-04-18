# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=xorg-res-utils
pkgver=1.0.3
pkgrel=2
pkgdesc="X.Org X11 resource utilities"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=('libxaw')
makedepends=('pkgconfig')
groups=('xorg')
source=(${url}/releases/individual/app/appres-1.0.1.tar.bz2
        ${url}/releases/individual/app/editres-1.0.3.tar.bz2
        ${url}/releases/individual/app/listres-1.0.1.tar.bz2
        ${url}/releases/individual/app/viewres-1.0.1.tar.bz2)
md5sums=('420e6cdf38bb771ec8b00228bf09e8ff' 'a25f931cc6c8d03daaed434f5db5df2d'\
         '827a1ac5adf9aadd0c13b54a897e297b' 'cdbed540daf7975b56000420c9aa5bf9')

build() {
  cd ${startdir}/src
  for i in *; do
    if [ -d "${i}" ]; then
      pushd "${i}"
      ./configure --prefix=/usr --disable-xprint
      make || return 1
      make DESTDIR=${startdir}/pkg install || return 1
      popd
    fi
  done
}
