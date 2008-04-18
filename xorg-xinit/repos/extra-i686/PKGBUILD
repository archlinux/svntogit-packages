# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=xorg-xinit
pkgver=1.0.7
pkgrel=3
pkgdesc="X.Org initialisation program "
arch=(i686 x86_64)
license=('GPL')
url="http://xorg.freedesktop.org/"
depends=(libx11 xorg-xauth)
makedepends=(pkgconfig)
backup=(etc/skel/.xinitrc etc/skel/.xsession etc/X11/xinit/xserverrc etc/X11/xinit/xinitrc)
groups=('xorg')
source=(${url}/releases/individual/app/xinit-${pkgver}.tar.bz2 \
        xinitrc xsession xserverrc)
options=(!emptydirs)

build() {
  cd ${startdir}/src/xinit-${pkgver}
  ./configure --prefix=/usr
  make XINITDIR=/etc/X11/xinit || return 1
  make XINITDIR=/etc/X11/xinit DESTDIR=${startdir}/pkg install || return 1

  mkdir -p ${startdir}/pkg/etc/skel/
  install -D -m755 ${startdir}/src/xinitrc ${startdir}/pkg/etc/skel/.xinitrc
  install -D -m755 ${startdir}/src/xsession ${startdir}/pkg/etc/skel/.xsession
  install -m755 ${startdir}/src/xserverrc ${startdir}/pkg/etc/X11/xinit/xserverrc
}
md5sums=('8b882d9e2deed9d85469a3beaec566a3'
         'f165d9a52284ef8cd4c8a129463a2b49'
         '7873d97db30d6c279ed37e3559e7c59d'
         'bb550d3b9a2d2b6cbe6e2667a3a7cd03')
