# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=qca
pkgver=2.0.0.svn744387
pkgrel=1.1
pkgdesc="Qt Cryptographic Architecture"
arch=('i686' 'x86_64')
url="http://delta.affinix.com/qca/"
license=('GPL2')
depends=('qt>=4.3.2' 'nss' 'libsasl' 'openssl>=0.9.8g-2')
makedepends=('cmake' 'pkgconfig' 'libgcrypt' 'gnupg')
# svn snapshot: svn co svn://anonsvn.kde.org/home/kde/trunk/kdesupport/qca
source=(ftp://ftp.archlinux.org/other/qca/$pkgname-$pkgver.tar.bz2)
options=(!libtool)

build() {
  # start building
  cd $startdir/src/$pkgname

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release

  make VERBOSE=1 || return 1
  make DESTDIR=$startdir/pkg install || return 1
  # fix mkspecs
  mkdir $startdir/pkg/usr/share/qt
  mv $startdir/pkg/usr/mkspecs $startdir/pkg/usr/share/qt
}
md5sums=('e73c7dd9ef8334067a398ccc6d8bb71f')
