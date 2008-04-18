# $Id$
# Maintainer: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>
pkgname=twisted
pkgver=2.5.0
pkgrel=2
pkgdesc="Asynchronous networking framework written in Python."
arch=(i686 x86_64)
url="http://twistedmatrix.com/projects/core/"
license=""
depends=('python' 'pycrypto' 'zope-interface')
source=(http://tmrc.mit.edu/mirror/twisted/Twisted/${pkgver%.*}/Twisted-${pkgver}.tar.bz2)
md5sums=('56df2ae66db57932515a491c03bf514f')

build() {
  cd $startdir/src/Twisted-$pkgver
  python setup.py install --prefix=/usr --root=$startdir/pkg
}
