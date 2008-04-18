# $Id$
# Maintainer: Mark Rosenstand <mark@archlinux.org>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>
pkgname=zope-interface
pkgver=3.3.0
pkgrel=2
pkgdesc="Separate distribution of the zope.interface package used in Zope 3."
arch=(i686 x86_64)
url="http://www.zope.org/Products/ZopeInterface/"
license=""
depends=('python')
source=(http://www.zope.org/Products/ZopeInterface/$pkgver/zope.interface-$pkgver.tar.gz)
md5sums=('93668855e37b4691c5c956665c33392c')

build() {
  cd $startdir/src/zope.interface-$pkgver
  python setup.py install --prefix=/usr --root=$startdir/pkg
  # Blabla.
  rm $startdir/pkg/usr/lib/python*/site-packages/zope/README.txt
  rm $startdir/pkg/usr/lib/python*/site-packages/zope/interface/README*.txt
}
