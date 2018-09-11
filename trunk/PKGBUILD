# Maintainer : Rémy Oudompheng <remy@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>

pkgname=namcap
pkgver=3.2.8
pkgrel=2
pkgdesc="A Pacman package analyzer"
arch=('any')
url="http://projects.archlinux.org/namcap.git/"
license=('GPL')
depends=('python' 'pyalpm>=0.5' 'licenses'
         'binutils' 'elfutils' 'python-pyelftools')
makedepends=('python-setuptools')
source=(https://sources.archlinux.org/other/${pkgname}/${pkgname}-${pkgver}.tar.gz missing-desktop-file-utils.patch)
sha512sums=('504b8294a86fdcc15946098fa57a4b6ca3bea0daf9ec51e7eab62078225b2102f527e123a9aeee33b8c4151adb8a59c5a682e25fd0330bd576d3da737f2a7d81'
            '74efb1939053f41129cd811cf84abef8ff84ca4673cb62c3115b9d56830a57a48fed021b9807a74299c4c4cf3ec1880733f91dd5d06f4b9ac294fc78a9b5498e')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}
  patch -Np1 -i ${srcdir}/missing-desktop-file-utils.patch
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python setup.py build
}

check() {
  cd ${srcdir}/${pkgname}-${pkgver}
  env PARSE_PKGBUILD_PATH=${srcdir}/${pkgname}-${pkgver} \
      PATH=${srcdir}/${pkgname}-${pkgver}:$PATH \
      python setup.py test
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python setup.py install --root=${pkgdir}
}

