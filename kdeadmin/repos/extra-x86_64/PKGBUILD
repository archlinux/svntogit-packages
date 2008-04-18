# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=kdeadmin
pkgver=3.5.9
kdever=3.5.9 # if minor 0, then without .0
pkgrel=1
pkgdesc="KDE Administration Programs."
arch=(i686 x86_64)
url="http://www.kde.org"
license=('GPL')

groups=('kde')
depends=('kdelibs>=3.5.9')
makedepends=('pkgconfig' 'lilo')

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
  ./configure --prefix=/opt/kde \
  --with-pam=yes --with-shadow --without-rpm --disable-debug --disable-dependency-tracking \
  --enable-gcc-hidden-visibility --enable-final DO_NOT_COMPILE="ksysv kpackage"
  #       --enable-final # remove this if you build with < 512mb ram.
  # DO_NOT_COMPILE="kuser"
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
md5sums=('e6607ea27b332616d20f4564656cb885')
