# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Lucien Immink <l.immink@student.fnt.hvu.nl>

# NOTE: pacman -Rd kdebindings before compilation.

pkgname=krusader
pkgver=1.80.0
pkgrel=1
pkgdesc="Alternative file manager for KDE resembling Midnight Commander"
arch=(i686 x86_64)
depends=(kdebase)
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz)
url="http://krusader.sourceforge.net/"

build() {
  [ -z "${QTDIR}" ] && . /etc/profile.d/qt.sh
  [ -z "${KDEDIR}" ] && . /etc/profile.d/kde.sh
  cd ${startdir}/src/${pkgname}-${pkgver}
  #Don't install stuff in weird locations
  #sed -i -e 's/^rcdir = $(DESTDIR)/rcdir = /' krusader/Makefile* || return 1
  ./configure --prefix=/opt/kde
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
md5sums=('32bfaf4de7ca62e0f612357f4aa065a9')
