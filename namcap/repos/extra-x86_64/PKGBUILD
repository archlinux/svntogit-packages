# $Id$
# Contributor: Jason Chu <jason@archlinux.org>
# Maintainer: Jason Chu <jason@archlinux.org>
pkgname=namcap
pkgver=2.1
pkgrel=1
pkgdesc="A Pacman package analyzer"
arch=(i686 x86_64)
url="http://xentac.net/~jchu/blog/static/namcap"
license=('GPL')
depends=('python')
source=(ftp://ftp.archlinux.org/other/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('0aa913c2b9c94785309bac045310d070')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./setup.py install --root=$startdir/pkg
  ln -s namcap.py $startdir/pkg/usr/bin/namcap
}
