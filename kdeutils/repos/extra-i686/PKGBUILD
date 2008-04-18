# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=kdeutils
pkgver=3.5.9
kdever=3.5.9 # if minor 0, then without .0
pkgrel=1
pkgdesc="KDE General Utilities."
arch=(i686 x86_64)
url="http://www.kde.org"
license=('GPL')
groups=('kde')
depends=('kdelibs>=3.5.9' 'libxss' 'libxtst' 'python>=2.5' 'gmp' 'net-snmp>=5.4' 'mtools' 'dosfstools' 'tpctl' 'zip' 'unzip' 'unrar')

# for easier build, just uncomment the mirror you want to use
  mirror="ftp.solnet.ch/mirror/KDE"         # updated every 2 hours, very fast for Europe
# mirror="ftp.kde.org/pub/kde/"             # main server
# mirror="ibiblio.org/pub/mirrors/kde/"     # ibiblio mirror

source=(ftp://$mirror/stable/$kdever/src/$pkgname-$pkgver.tar.bz2 xmms-dynamic.patch klaptopdaemon.patch)

build() {
  # Source the QT and KDE profile
  [ "$QTDIR" = "" ] && source /etc/profile.d/qt3.sh 
  [ "$KDEDIR" = "" ] && source /etc/profile.d/kde.sh
  cd $startdir/src/$pkgname-$pkgver/superkaramba/src
  patch -Np0 -i ../../../xmms-dynamic.patch || return 1
  # start building
  cd $startdir/src/$pkgname-$pkgver
  patch -Np1 -i ../klaptopdaemon.patch || return 1
  make -f admin/Makefile.common
  ./configure --prefix=/opt/kde --disable-debug --disable-dependency-tracking \
  --enable-gcc-hidden-visibility --enable-final DO_NOT_COMPILE="ksim"
  #        --enable-final # remove this if you build with < 512mb ram.
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
md5sums=('dbe5ddff57141f27778601df5571e182'
         'b076e916c251d26384d53cffafa10afa'
         'a4bb82591964e74c2e7c754e70ffa998')
