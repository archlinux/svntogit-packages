# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=pylint
pkgver=0.14.0
pkgrel=1
pkgdesc="Python code static checker"
arch=('i686' 'x86_64')
url="http://www.logilab.org/project/pylint"
license=('GPL')
depends=('python-logilab-astng')
install=pylint.install
source=(ftp://ftp.logilab.fr/pub/pylint/pylint-$pkgver.tar.gz)
md5sums=('a6a6a1c68e56506d6fca7569f622767a')
sha1sums=('b0074cca2083792b5602f33d8e7be33a9ab4322f')

build() {
  cd $startdir/src/pylint-$pkgver
  python setup.py install --prefix=/usr --root=$startdir/pkg || return 1

  install -D -m644 man/pylint.1 $startdir/pkg/usr/share/man/man1/pylint.1
}
