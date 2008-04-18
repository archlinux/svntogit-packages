# $Id$
# Maintainer: Arjan timmerman <arjan@soulfly.nl>
# Contributor: Link Dupont <link@subpop.net>

pkgname=pyrex
pkgver=0.9.5.1a
pkgrel=1
pkgdesc="Language for writing Python extension modules"
arch=(i686 x86_64)
url="http://www.cosc.canterbury.ac.nz/~greg/python/Pyrex/"
license=""
depends=('python>=2.5')
source=(http://www.cosc.canterbury.ac.nz/~greg/python/Pyrex/Pyrex-${pkgver}.tar.gz)
md5sums=('0132c5cd2f8685e4948fb14dcb65f637')
sha1sums=('ea8b6e5981ec2d05306a8fc42bb1c429bd3f5966')

build() {
  cd ${startdir}/src/Pyrex-${pkgver}
  python setup.py install --root=${startdir}/pkg --prefix=/usr
}
