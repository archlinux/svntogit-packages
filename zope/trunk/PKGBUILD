# $Id$
# Contributor: Jason Chu <jason@archlinux.org>
# Maintainer: Juergen Hoetzel <juergen@archlinux.org>

pkgname=zope
pkgver=3.3.1
pkgrel=1
pkgdesc="An web application server for building content management systems, portals and custom applications"
arch=(i686 x86_64)
url="http://zope.org"
depends=('python24')
makedepends=('gcc')
source=(http://www.zope.org/Products/Zope3/${pkgver}/Zope-${pkgver}.tgz)
md5sums=('3c28888c51cc0a9e853c0f3032370bf9')
install=$pkgname.install

build() {
	PREFIX=/opt/zope-3 	
	PYTHON=/usr/bin/python2.4
  cd $startdir/src/Zope-$pkgver
  chmod -R go+r *
  ./configure --prefix=${PREFIX} --with-python=$PYTHON --force
  make || exit 1 
	$PYTHON install.py -q install --skip-build --home ${PREFIX} --root $startdir/pkg/
}
