# $Id$
# Maintainer : Tobias Powalowski <tpowa@archlinux.org>

pkgname=kradio
pkgver=0.3.0
pkgrel=4
pkgdesc="KRadio is a comfortable KDE radio application"
url="http://kradio.sourceforge.net/"
depends=('lame' 'kdelibs' 'libsndfile' 'lirc-utils')
source=(http://www.kawo1.rwth-aachen.de/~witte/kradio/download/kradio-snapshot_2005_12_04.tar.gz)

build() {
  cd $startdir/src/kradio-snapshot_2005_12_04
   ./configure --prefix=/opt/kde
   make || return 1
   make DESTDIR=$startdir/pkg install
 }

md5sums=('c6fe6f497ee3b7468ae54f029c80de48')
