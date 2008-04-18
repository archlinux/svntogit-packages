# $Id$
# Maintainer: damir <damir@archlinux.org>

pkgname=qwt
pkgver=5.0.2
pkgrel=1
pkgdesc="Qt Widgets for Technical Applications"
arch=("i686" "x86_64")
url="http://qwt.sourceforge.net/"
depends=('qt>=4.3.1')
options=('!makeflags')
license=("custom:$pkgname")
source=("http://puzzle.dl.sourceforge.net/sourceforge/qwt/$pkgname-$pkgver.tar.bz2" \
        "qwtconfig-archlinux.pri")

build() {
  cd $startdir/src/$pkgname-$pkgver
#  . /etc/profile.d/qt3.sh
  # copy our config file to the right place
  cp -f $startdir/src/qwtconfig-archlinux.pri $startdir/src/$pkgname-$pkgver/qwtconfig.pri || return 1
  # build qwt:
  qmake qwt.pro
  make || return 1
  make INSTALL_ROOT=$startdir/pkg QTDIR=/usr install || return 1

  # install licence
  install -D -m644 $startdir/src/$pkgname-$pkgver/COPYING $startdir/pkg/usr/share/licenses/$pkgname/license.txt
}
