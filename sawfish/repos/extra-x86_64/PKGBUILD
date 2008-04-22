# $Id$
# Maintainer: Aaron Griffin <aaron@archlinux.org> 

pkgname=sawfish
pkgver=1.3.3
pkgrel=1
pkgdesc="An alternate window manager for GNOME"
url="http://sawmill.sourceforge.net/"
arch=(i686 x86_64)
license=('GPL')
depends=('librep' 'esd' 'gtk2' 'rep-gtk' 'libsm' 'gmp')
source=(http://downloads.sourceforge.net/sourceforge/sawmill/sawfish-$pkgver.tar.gz
        no-info.patch)
options=(!libtool)
md5sums=('456724c79ddb0b78d03d45dcaffa4103'
         '48be9727db805d8c9f3e9410b7ba638e')

build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -Np1 -i $startdir/src/no-info.patch || return 1
  ./autogen.sh
  ./configure --prefix=/usr --enable-capplet
  make -j1 || return 1
  make DESTDIR=$startdir/pkg install

  mkdir -p $startdir/pkg/etc/X11/sessions/
  cp $startdir/pkg/usr/share/gnome/wm-properties/Sawfish.desktop \
      $startdir/pkg/etc/X11/sessions/
}
