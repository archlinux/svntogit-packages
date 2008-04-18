# $Id$
# Maintainer: damir <damir@archlinux.org>

_enginename=xine
_origname=amarok
pkgname=${_origname}-engine-${_enginename}
pkgver=1.4.8
pkgrel=1
pkgdesc="${_enginename} engine for amaroK"
arch=('i686' 'x86_64')
url="http://amarok.kde.org/"
license=('GPL')
depends=('xine-lib>=1.1.3' 'kdelibs>=3.5.7' 'taglib>=1.4' 'tunepimp>=0.5.3' 'libxrender')
makedepends=('pkgconfig' 'ruby')
provides=('amarok-engine')
source=("ftp://ftp.solnet.ch/mirror/KDE/stable/amarok/${pkgver}/src/${_origname}-${pkgver}.tar.bz2")

build() {
  export MAKEFLAGS="-j1"
  [ -z "${QTDIR}" ] && . /etc/profile.d/qt.sh
  [ -z "${KDEDIR}" ] && . /etc/profile.d/kde.sh
  cd ${startdir}/src/${_origname}-${pkgver}
  ./configure --prefix=/opt/kde --with-gnu-ld --disable-debug --enable-debug=no
  cd amarok/src || return 1
  make || return 1
  cd engine/${_enginename} || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}

md5sums=('7f65c4a8f3f0ff9042a5b5dd21b36cc8')
