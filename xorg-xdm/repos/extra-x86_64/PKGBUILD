# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=xorg-xdm
pkgver=1.1.6
pkgrel=1
pkgdesc="X Display Manager"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=('pam' 'libxaw' 'libxinerama' 'xorg-server-utils' 'libxft')
makedepends=('pkgconfig')
backup=(etc/X11/xdm/Xaccess etc/X11/xdm/Xresources etc/X11/xdm/Xservers etc/X11/xdm/xdm-config etc/pam.d/xdm)
options=('!libtool')
source=(${url}/releases/individual/app/xdm-${pkgver}.tar.bz2
	xdm.pam)

build() {
  cd ${startdir}/src/xdm-${pkgver}
  ./configure --prefix=/usr \
              --disable-static \
	      --disable-xprint \
	      --with-xdmconfigdir=/etc/X11/xdm \
	      --with-xdmscriptdir=/etc/X11/xdm \
	      --with-pixmapdir=/usr/share/xdm/pixmaps
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  mkdir -p ${startdir}/pkg/etc/pam.d
  install -m644 ${startdir}/src/xdm.pam ${startdir}/pkg/etc/pam.d/xdm

  #Get rid of /usr/X11R6
  cd ${startdir}/pkg/etc/X11/xdm
  sed -i -e 's/\/X11R6//g' *
}

md5sums=('c89f8bc74fda4d19e5f374f59c88810f'
         '419d6289ba6f851135f5c70c0e3cbec4')
