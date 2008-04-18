# $Id$
# Maintainer: tobias <tobias@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

pkgname=sharpconstruct
_srcver=0.12-rc3
pkgver=$(echo ${_srcver} | sed s/-//)
pkgrel=1
pkgdesc="A real-time modeller for 3D sculpt models"
arch=(i686 x86_64)
url="http://sharp3d.sourceforge.net/"
depends=('gtkglextmm' 'libglademm' 'gtkglext')
source=(http://dl.sourceforge.net/sourceforge/sharp3d/${pkgname}-${_srcver}.tar.bz2)
md5sums=('59ef5f2579cdf820b3cfe6641cf744ce')

build() {
  cd ${startdir}/src/${pkgname}-0.12
 # build
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
