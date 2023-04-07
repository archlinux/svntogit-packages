# Maintainer : Rémy Oudompheng <remy@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>

pkgname=namcap
pkgver=3.4.0
pkgrel=3
pkgdesc="A Pacman package analyzer"
arch=('any')
url='https://gitlab.archlinux.org/pacman/namcap'
license=('GPL')
depends=('python' 'pyalpm' 'licenses' 'binutils' 'elfutils' 'python-pyelftools' 'pkgconf')
checkdepends=('systemd' 'python-pytest' 'python-six')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=(https://gitlab.archlinux.org/pacman/namcap/-/archive/${pkgver}/namcap-${pkgver}.tar.bz2)
sha512sums=('ab4d1658dbdf192d1d91e3cf3cd3e4cab0be6021561e6d14ad86603b95f6261eb97bd3087a003ce493b3dea7a240d8fdddc29f059613b3ff3fb718467cd8078e')

prepare() {
  cd ${pkgname}-${pkgver}
}

build() {
  cd ${pkgname}-${pkgver}
  python setup.py build
}

check() {
  cd ${pkgname}-${pkgver}
  env PARSE_PKGBUILD_PATH="${srcdir}/${pkgname}-${pkgver}" \
      PATH="${srcdir}/${pkgname}-${pkgver}/scripts:$PATH" \
      pytest
}

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}"
}
