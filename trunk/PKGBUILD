# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=telepathy-qt
pkgver=0.14.1.2031
pkgrel=1
pkgdesc="A set of convenience libraries to easily integrate VoIP in qt"
url="http://tapioca-voip.sourceforge.net/wiki/index.php/Tapioca"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('qt>=4.3.2')
# svn snapshot: https://tapioca-voip.svn.sourceforge.net/svnroot/tapioca-voip
source=(ftp://ftp.archlinux.org/other/telepathy-qt/telepathy-qt-2031.tar.bz2)
#http://heanet.dl.sourceforge.net/sourceforge/tapioca-voip/$pkgname-$pkgver.tar.gz)
options=(!libtool)

build() {
  # start building
  cd $startdir/src/
  mkdir build 
  cd build
  cmake ../$pkgname -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release

  make VERBOSE=1 || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
md5sums=('ffca0cc6c21ff90d37082cf06a4ebd7a')
