# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=xorg-font-utils
pkgver=1.0.3
pkgrel=3
pkgdesc="X.Org font utilities"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=('libxfont' 'libfontenc' 'xproto')
makedepends=('pkgconfig')
replaces=('font-util')
provides=('font-util')
conflicts=('font-util')
install=xorg-font-utils.install
source=(${url}/releases/individual/app/bdftopcf-1.0.1.tar.bz2
        ${url}/releases/individual/app/fonttosfnt-1.0.3.tar.bz2
        ${url}/releases/individual/app/mkfontdir-1.0.3.tar.bz2
        ${url}/releases/individual/app/mkfontscale-1.0.3.tar.bz2
        ${url}/releases/individual/font/font-util-1.0.1.tar.bz2
	http://people.redhat.com/yshao/ttmkfdir2.20021109.tar.bz2
	ttmkfdir.patch)

build() {
  cd ${startdir}/src

  for i in *; do
    if [ -d "${i}" ]; then
      pushd "${i}"
        if [ "${i}" = "ttmkfdir2" ]; then
	  patch -Np0 -i ${startdir}/src/ttmkfdir.patch || return 1
	  make || return 1
	  mkdir -p ${startdir}/pkg/usr/bin
	  install -m755 ttmkfdir ${startdir}/pkg/usr/bin/ || return 1
	else
	  ./configure --prefix=/usr --with-mapdir=/usr/share/fonts/util
          make || return 1
          make DESTDIR=${startdir}/pkg install || return 1
	fi
      popd
    fi
  done
}
md5sums=('9685fab33d39954ab8a0d22e0969d5a4'
         'b0ebd86029571239b9d7b0c61191b591'
         '4d0f89a23f77e22f1671a77bf0898955'
         '1d608771aca9695b828cec1e34178fd1'
         'b81535f78fe05732931f02841e5ca37b'
         '79e0401393c9728865aa73bb2bd68dd4'
         '099278628ad63631e872bc5590bade74')
