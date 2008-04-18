# $Id$
# Maintainer: Aaron Griffin <aaron@archlinux.org>

pkgname=xine-ui
pkgver=0.99.5
pkgrel=2
pkgdesc="A free video player for Unix"
arch=(i686 x86_64)
license=('GPL')
depends=(xine-lib 'curl>=7.16.2' libxtst libxinerama libxv libpng libxft libsm libxxf86vm)
makedepends=(lirc)
url="http://xinehq.de/"
source=(http://downloads.sourceforge.net/sourceforge/xine/$pkgname-$pkgver.tar.gz)
install=xine.install
md5sums=('e643cd1fcad4d98a5ae4eb877ce5087b')
options=(!emptydirs)

build() {
  cd $startdir/src/$pkgname-$pkgver
  
  #add missing constant (defined in xine.h from xine-lib cvs)
  echo '#define XINE_MSG_AUDIO_OUT_UNAVAILABLE 11' >> src/xitk/common.h
  ./configure --prefix=/usr --with-curses --with-x --enable-lirc --without-aalib
  make || return 1
  make DESTDIR=$startdir/pkg install
  mkdir -p $startdir/pkg/usr/share/applications
  echo "Categories=Application;AudioVideo;" >> $startdir/pkg/usr/share/xine/desktop/xine.desktop
  mv $startdir/pkg/usr/share/xine/desktop/xine.desktop $startdir/pkg/usr/share/applications
}
