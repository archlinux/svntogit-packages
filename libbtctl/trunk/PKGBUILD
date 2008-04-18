# $Id$
# Maintainer: Roman Kyrylych <roman@archlinux.org>

pkgname=libbtctl
pkgver=0.10.0
pkgrel=1.1
pkgdesc="GObject wrapper for Bluetooth functionality."
arch=('i686' 'x86_64')
url="http://www.usefulinc.com/software/gnome-bluetooth/"
license=('GPL')
depends=('glib2>=2.14.1' 'openobex>=1.3')
makedepends=('intltool' 'python' 'gtk2') # 'gtk-sharp'
options=('!libtool' '!makeflags')
source=(http://ftp.gnome.org/pub/GNOME/sources/libbtctl/0.10/${pkgname}-${pkgver}.tar.bz2)
md5sums=('83d5f90efb2b26d1bd12a668940d02ba')

build() {
  # export MAKEFLAGS="-j1"
  # export MONO_SHARED_DIR=${startdir}/src/.wabi
  # mkdir -p ${MONO_SHARED_DIR}

  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --disable-gtk-doc # --enable-mono
  make || return 1
  make DESTDIR=${startdir}/pkg install
  # rm -rf $MONO_SHARED_DIR
}
