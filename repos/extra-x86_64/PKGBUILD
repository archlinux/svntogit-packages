# $Id$
# Maintainer: Jason Chu <jason@archlinux.org>

pkgname=devtools
pkgver=0.6.2
pkgrel=1
pkgdesc="A few tools to help Arch Linux developers"
arch=(i686 x86_64)
license=('GPL')
url="http://projects.archlinux.org/git/?p=devtools.git"
depends=(namcap)
source=(ftp://ftp.archlinux.org/other/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('3b98d0a6e2d64983d323a78b0e792077')

build() {
  cd $startdir/src/$pkgname-$pkgver
  make DESTDIR=$startdir/pkg install
}
