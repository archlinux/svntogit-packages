# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=kdeedu
pkgver=3.5.9
kdever=3.5.9
pkgrel=1
url="http://www.kde.org"
arch=(i686 x86_64)
pkgdesc="Educational programs for KDE."
license=('GPL')
groups=('kde')
makedepends=('facile')
depends=('kdelibs>=3.5.9')
makedepends=('pkgconfig')

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
  ./configure --prefix=/opt/kde --disable-debug --disable-dependecy-tracking \
  --disable-kig-python-scripting --enable-gcc-hidden-visibility --enable-final
  #        --enable-final # remove this if you build with < 512mb ram.
  make OCAMLLIB=/usr/lib/ocaml || return 1
  make DESTDIR=$startdir/pkg install || return 1
  rm -rf $startdir/pkg/bin
}
md5sums=('cbdabe916ce6fa300f8dab972c5cb4a4')
