# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=kdeartwork
pkgver=3.5.9
kdever=3.5.9 # if minor 0, then without .0
pkgrel=1.1
pkgdesc="Additional artwork for KDE."
arch=(i686 x86_64)
url="http://www.kde.org"
license=('GPL')
groups=('kde')
makedepends=('xscreensaver' 'glut')
depends=('kdebase>=3.5.9')
makedepends=('pkgconfig')

  mirror="ftp.solnet.ch/mirror/KDE"         # updated every 2 hours, very fast for Europe
# mirror="ftp.kde.org/pub/kde/"             # main server
# mirror="ibiblio.org/pub/mirrors/kde/"     # ibiblio mirror

source=(ftp://$mirror/stable/$kdever/src/$pkgname-$pkgver.tar.bz2 kdeclassic.patch)

build() {
  # Source the QT and KDE profile
  [ "$QTDIR" = "" ] && source /etc/profile.d/qt3.sh 
  [ "$KDEDIR" = "" ] && source /etc/profile.d/kde.sh
  cd $startdir/src/$pkgname-$pkgver
  # fix kdeclassic theme
  patch -Np0 -i ../kdeclassic.patch || return 1
  sed -i -e 's=lib/xscreensaver/flame=libexec/xscreensaver/flame=g' configure
  ./configure --prefix=/opt/kde --disable-debug --disable-dependency-tracking --with-dpms \
  --enable-gcc-hidden-visibility --enable-final
  #        --enable-final # remove this if you build with < 512mb ram.
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
md5sums=('ec526eba38421fd3b143682b8d683c86'
         '70d3467b9ba3913ac20c340a6c0a071e')
