# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xorg-fonts-type1
pkgver=1.0.1
pkgrel=1
pkgdesc="X.org Type1 fonts"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=(xorg-fonts-encodings xorg-fonts-alias xorg-font-utils fontconfig)
install=xfonts.install
source=(${url}/releases/individual/font/font-adobe-utopia-type1-1.0.1.tar.bz2
        ${url}/releases/individual/font/font-bh-type1-1.0.0.tar.bz2
        ${url}/releases/individual/font/font-bitstream-type1-1.0.0.tar.bz2
        ${url}/releases/individual/font/font-ibm-type1-1.0.0.tar.bz2
        ${url}/releases/individual/font/font-xfree86-type1-1.0.0.tar.bz2)
md5sums=('aa7ff4bd20b961afda9c15d103b972a5' '46588b22678e440741d6220bc3945cbf'\
         '6610475e2e231242f8f2122a709c3695' '8e8733051371e2b51123376b49f5d3ea'\
         'e66f36a6d68203cc4cf7b56ebbb192dd')

build() {
  cd ${startdir}/src
  for dir in font-*-type1-1.0.0 font-*-type1-1.0.1; do
    pushd ${dir}
      ./configure --prefix=/usr \
                  --with-mapfiles=/usr/share/fonts/util \
		  --with-fontdir=/usr/share/fonts/Type1
      make || return 1
      make DESTDIR=${startdir}/pkg install || return 1
    popd
  done
  rm -f ${startdir}/pkg/usr/share/fonts/Type1/fonts.*
}

