# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xorg-xsm
pkgver=1.0.1
pkgrel=2
pkgdesc="X.Org X11 Session manager"
url="http://xorg.freedesktop.org/"
depends=(xorg-xauth libxaw)
makedepends=(pkgconfig xorg-util-macros netkit-rsh)
source=(${url}/releases/individual/app/xsm-1.0.1.tar.bz2
        ${url}/releases/individual/app/smproxy-1.0.2.tar.bz2
        ${url}/releases/individual/app/rstart-1.0.1.tar.bz2
	xsm-install-location.patch
	rstart-install-location.patch)
md5sums=(cce867ff7d0df9c0b9e682591779952c 31da204a0255ba8c6a65386e65dc1c90
         48bb7ad1fb9a4e43a8a702148dfb846e fc04230c885546323fdd0172708f0eed
         33402d9113db53bc00c69a9016358554)

build() {
  cd ${startdir}/src
  for i in *; do
    if [ -d "${i}" ]; then
      pushd "${i}"
      case "${i}" in
        xsm*)
	  patch -Np1 -i ${startdir}/src/xsm-install-location.patch
	  aclocal
	  automake
	  autoconf
	;;
	rstart*)
	  patch -Np1 -i ${startdir}/src/rstart-install-location.patch
	  aclocal
	  automake
	  autoconf
	;;
      esac
      ./configure --prefix=/usr --sysconfdir=/etc
      make || return 1
      make DESTDIR=${startdir}/pkg install || return 1
      popd
    fi
  done
}

