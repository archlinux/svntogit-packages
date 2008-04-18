# $Id$
# Maintainer: damir <damir@archlinux.org>

pkgname=biopython
pkgver=1.44
pkgrel=1
pkgdesc="Biopython: freely available Python tools for computational molecular biology"
arch=("i686" "x86_64")
url="http://www.biopython.org"
license=('custom')
depends=('glibc' 'python>=2.5.1' 'python-numeric' 'python-egenix-mx-base' 'mysql-python')
makedepends=('gcc')
source=("$url/DIST/$pkgname-$pkgver.tar.gz")


build() {
  cd $startdir/src/$pkgname-$pkgver
  yes | python setup.py build
  # python setup.py test
  yes | python setup.py install --root=$startdir/pkg
  install -D -m644 LICENSE $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
}
md5sums=('762c7a358af9dc58b712b8b4bb99d0c2')
sha1sums=('ca2a35c9e92a219256fe4fc2a232df5328f9f5d9')
