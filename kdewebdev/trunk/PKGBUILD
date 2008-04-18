# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

provides=('quanta')
replaces=('quanta')
pkgname=kdewebdev
pkgver=3.5.9
kdever=3.5.9 # if minor 0, then without .0
pkgrel=1
pkgdesc="A web development tool for the K Desktop Environment."
arch=(i686 x86_64)
url="http://kdewebdev.org/"
license=('GPL')
depends=('kdelibs>=3.5.9' 'kdesdk>=3.5.9' 'pcre' 'libxml2>=2.6.0' 'libxslt>=1.0.18' 'tidyhtml') 

# for easier build, just uncomment the mirror you want to use
  mirror="ftp.solnet.ch/mirror/KDE"         # updated every 2 hours, very fast for Europe
# mirror="ftp.kde.org/pub/kde/"             # main server
# mirror="ibiblio.org/pub/mirrors/kde/"     # ibiblio mirror

source=(ftp://$mirror/stable/$kdever/src/$pkgname-$pkgver.tar.bz2)
options=(!makeflags)

build() {
  # Source the QT and KDE profile
  [ "$QTDIR" = "" ] && source /etc/profile.d/qt3.sh 
  [ "$KDEDIR" = "" ] && source /etc/profile.d/kde.sh
  # start building
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/opt/kde --disable-debug --disable-dependency-tracking \
  --enable-final
  # --enable-gcc-hidden-visibility disabled it breaks compile!
  # --enable-final # remove this if you build with < 512mb ram.
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
md5sums=('e95d1fbb698ec76966abfa5bdf96bd5e')
