# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
pkgname=dialog
pkgver=1.1_20071028
_pkgver=1.1-20071028
pkgrel=1
pkgdesc="A tool to display dialog boxes from shell scripts"
arch=(i686 x86_64)
license=('GPL')
groups=('base')
depends=('ncurses')
url="http://packages.debian.org/dialog"
source=(ftp://ftp.debian.org/debian/pool/main/d/${pkgname}/${pkgname}_$_pkgver.orig.tar.gz)
md5sums=('73604d3b3a43b5a122709a7a8e4edee2')

build() {
  cd $startdir/src/$pkgname-$_pkgver
  ./configure --prefix=/usr --disable-Xdialog
  make || return 1
  make DESTDIR=$startdir/pkg install
}
