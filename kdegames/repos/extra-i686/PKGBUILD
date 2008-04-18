# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=kdegames
pkgver=3.5.9
kdever=3.5.9 # if minor 0, then without .0
pkgrel=1
pkgdesc="Games for KDE."
arch=(i686 x86_64)
url="http://www.kde.org"
license=('GPL')
groups=('kde')
depends=('kdelibs>=3.5.9')

# for easier build, just uncomment the mirror you want to use
  mirror="ftp.solnet.ch/mirror/KDE"         # updated every 2 hours, very fast for Europe
# mirror="ftp.kde.org/pub/kde/"             # main server
# mirror="ibiblio.org/pub/mirrors/kde/"     # ibiblio mirror

source=(ftp://$mirror/stable/$kdever/src/$pkgname-$pkgver.tar.bz2)

build() {
  # Source the QT and KDE profile
  [ "$QTDIR" = "" ] && source /etc/profile.d/qt3.sh 
  [ "$KDEDIR" = "" ] && source /etc/profile.d/kde.sh
  # start building
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/opt/kde --disable-debug --disable-dependency-tracker \
  --enable-gcc-hidden-visibility --enable-final
  #        --enable-final # remove this if you build with < 512mb ram.
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
md5sums=('472385f21a692270fb5643d7617c7ff3')
