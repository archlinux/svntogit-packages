# $Id$
# Maintainer: damir <damir@archlinux.org>

pkgname=python-egenix-mx-base
origname=egenix-mx-base
pkgver=3.0.0
pkgrel=1
pkgdesc="A collection of professional quality Python software tools which enhance Python's usability in many important areas - Open Source parts of the eGenix.com mx Extension series"
arch=('i686' 'x86_64')
license=('custom')
url="http://www.egenix.com/files/python"
depends=('python>=2.5')
replaces=('egenix-mx-base')
provides=('egenix-mx-base')
source=("http://downloads.egenix.com/python/${origname}-${pkgver}.tar.gz")

build() {
  cd $startdir/src/$origname-$pkgver
  BASECFLAGS=$BASECFLAGS" -DNDEBUG -O0 -Wall -Wstrict-prototypes "
  python setup.py install --root=$startdir/pkg
  install -D -m644 COPYRIGHT $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
}

md5sums=('e4d388137900b2e7f29b5a113b2a0b5b')
