# $Id$
# Contributor: Roman Kreisel <roman.kreisel@epost.de>
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=kdebindings
pkgver=3.5.8
kdever=3.5.8 # if minor 0, then without .0
pkgrel=2
pkgdesc="KDE Bindings."
arch=(i686 x86_64)
url="http://www.kde.org"
license=('GPL')
groups=('kde')
makedepends=('jdk' 'gtk' 'pkgconfig')
depends=('kdelibs>=3.5.8' 'ruby' 'qscintilla-qt3')

# for easier build, just uncomment the mirror you want to use
  mirror="ftp.solnet.ch/mirror/KDE"         # updated every 2 hours, very fast for Europe
# mirror="ftp.kde.org/pub/kde/"             # main server
# mirror="ibiblio.org/pub/mirrors/kde/"     # ibiblio mirror
options=(!makeflags)
source=(ftp://$mirror/stable/$kdever/src/$pkgname-$pkgver.tar.bz2)

build() {
  # Source the QT and KDE profile
  [ "$QTDIR" = "" ] && source /etc/profile.d/qt3.sh 
  [ "$KDEDIR" = "" ] && source /etc/profile.d/kde.sh
  # start building
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/opt/kde --disable-debug --disable-dependency-tracking \
  --enable-gcc-hidden-visibility DO_NOT_COMPILE="python"
  #        --enable-final # remove this if you build with < 1512mb ram.
  # python packages are seperated from kdebindings
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1    
  rm -rf $startdir/pkg/usr/lib/perl5/*/$CARCH-linux/perllocal.pod
  rm -rf $startdir/pkg/usr/lib/perl5/*/$CARCH-linux-thread-multi/perllocal.pod
}
md5sums=('4325d22ac70d3945609bd952c19e793b')
