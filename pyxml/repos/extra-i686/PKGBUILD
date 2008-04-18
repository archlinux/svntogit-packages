# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=pyxml
pkgver=0.8.4
pkgrel=3
pkgdesc="Python XML parsing library."
arch=(i686 x86_64)
url="http://pyxml.sourceforge.net/"
depends=('python>=2.5')
source=(http://dl.sourceforge.net/sourceforge/pyxml/PyXML-${pkgver}.tar.gz)
md5sums=(1f7655050cebbb664db976405fdba209)

build() {
  cd ${startdir}/src/PyXML-${pkgver}
  python setup.py build
  python setup.py install --prefix=/usr --root=${startdir}/pkg
}
