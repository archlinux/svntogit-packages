# $Id$
# Contributor: Ben <contrasutra@myrealbox.com>
# Maintainer: damir <damir@archlinux.org>

pkgname=libxml++
pkgver=1.0.5
pkgrel=1
pkgdesc="c++ bindings to libxml"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://libxmlplusplus.sourceforge.net/"
depends=('gcc-libs' 'libxml2')
options=("!libtool")
source=("http://ftp.gnome.org/pub/GNOME/sources/libxml++/1.0/$pkgname-$pkgver.tar.bz2")

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --with-gnu-ld
  make || return 1
  make prefix=$startdir/pkg/usr install
}

md5sums=('10c178eb992be70d45450020bf0cc2aa')
