# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=python-logilab-astng
pkgver=0.17.2
pkgrel=1
pkgdesc="Extend python's abstract syntax tree"
arch=('i686' 'x86_64')
url="http://www.logilab.org/project/logilab-astng"
license=('GPL')
depends=('python-logilab-common')
source=(ftp://ftp.logilab.fr/pub/astng/logilab-astng-$pkgver.tar.gz)
md5sums=('a654d65a4644fb984d840906cf8b27d5')
sha1sums=('6725878bef9570937c67491e2a0feafd62c9a02b')

build() {
  cd $startdir/src/logilab-astng-$pkgver
  python setup.py install --prefix=/usr --root=$startdir/pkg || return 1

  # Resolve conflict with python-logilab-common
  rm -f $startdir/pkg/usr/lib/python2.?/site-packages/logilab/__init__.py
}
