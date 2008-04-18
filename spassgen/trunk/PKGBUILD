# $Id$
# Maintainer : Tobias Powalowski <tpowa@archlinux.org>

pkgname=spassgen
pkgver=1.5
pkgrel=5
pkgdesc="A small program that generates passwords"
arch=(i686 x86_64)
url="http://spassgen.sourceforge.net/"
depends=('qt3')
source=(http://mesh.dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2)

build() {
  cd $startdir/src/$pkgname
  . /etc/profile.d/qt3.sh
   qmake -project spassgen.pro
   qmake
   make || return 1
   mkdir -p $startdir/pkg/opt/kde/{bin,share/icons/crystalsvg}
   cp spassgen $startdir/pkg/opt/kde/bin
   cd icons
   cp -r * $startdir/pkg/opt/kde/share/icons/crystalsvg
 }
