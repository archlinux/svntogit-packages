# $Id$
# Maintainer : Tobias Powalowski <tpowa@archlinux.org>

pkgname=oooqs2
pkgver=1.0
pkgrel=1
pkgdesc="OpenOffice.org Quickstarter is a small application that runs in the KDE SystemTray."
arch=(i686 x86_64)
url="http://segfaultskde.berlios.de/index.php?content=oooqs"
depends=('kdelibs' 'openoffice-base')
source=(http://download.berlios.de/segfaultskde/$pkgname-$pkgver.tar.gz oooqs2rc de-docbook.patch)
replaces='oooqs'

build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -Np0 -i ../de-docbook.patch || return 1
   ./configure --prefix=/opt/kde
   make || return 1
   make DESTDIR=$startdir/pkg/ install
   install -D -m 644 $startdir/src/oooqs2rc $startdir/pkg/opt/kde/share/config/oooqs2rc
 }
md5sums=('553fa1d327165965f4ad6e3d1165977d' '6688d5e7a676dc6807d5277a43f0813a'\
         'b2b01f524f0ad6054b5f5382a81d087f')
