# $Id: PKGBUILD,v 1.21 2008/02/09 15:58:23 dan Exp $
# Maintainer: Jason Chu <jason@archlinux.org>

pkgname=devtools
pkgver=0.6.1
pkgrel=1
pkgdesc="A few tools to help Arch Linux developers"
arch=(i686 x86_64)
license=('GPL')
url="http://projects.archlinux.org/git/?p=devtools.git"
depends=(namcap)
source=(ftp://ftp.archlinux.org/other/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('f656dc689018ed94696d2396110c2d8d')

build() {
  cd $startdir/src/$pkgname-$pkgver
  make DESTDIR=$startdir/pkg install
}
