# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=ntfsprogs
pkgver=2.0.0
pkgrel=2
depends=('glibc' 'fuse' 'e2fsprogs')
makedepends=('pkgconfig')
pkgdesc="NTFS Resizing Tool"
arch=(i686 x86_64)
license=('GPL')
#source=(http://heanet.dl.sourceforge.net/sourceforge/linux-ntfs/$pkgname-$pkgver.tar.gz)
#source=(http://mesh.dl.sourceforge.net/sourceforge/linux-ntfs/$pkgname-$pkgver.tar.gz)
source=(http://switch.dl.sourceforge.net/sourceforge/linux-ntfs/$pkgname-$pkgver.tar.gz)
url="http://linux-ntfs.sourceforge.net"
install=('ntfsprogs.install')
options=(!libtool)
md5sums=('2c402b647bb7aeb1d3f8ce1cc354fd68')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --disable-gnome-vfs --enable-fuse-module PKG_CONFIG=/usr/bin/pkg-config
  make || return 1
  make DESTDIR=$startdir/pkg install
}

