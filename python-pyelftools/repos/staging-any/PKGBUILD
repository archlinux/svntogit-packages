# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Rémy Oudompheng <remy@archlinux.org>

pkgname=python-pyelftools
_pkgname=pyelftools
pkgver=0.25
pkgrel=2
pkgdesc='Python library for analyzing ELF files and DWARF debugging information'
url='https://github.com/eliben/pyelftools'
arch=('any')
license=('custom:Public Domain')
makedepends=('python' 'python-setuptools')
options=('!strip')
source=(${_pkgname}-${pkgver}.tar.gz::https://github.com/eliben/${_pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('84fbff3a8abc1d0d47e2113d14f509a6a0e8fb97d09c6abf91cefb416b7237d31f53945627e3958901b2a5229f57d5d2ffc9e0b7b4cd271f61689781dc6871bc')


build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build

}

check() {
  cd ${_pkgname}-${pkgver}
  python test/run_all_unittests.py
  python test/run_examples_test.py
  if [ "${CARCH}" == "x86_64" ]; then
    python test/run_readelf_tests.py
  else
    warning "Skipping readelf tests (require x86_64)"
  fi
}

package() {
  depends=('python')
  cd ${_pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --skip-build
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst CHANGES -t "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r examples "${pkgdir}/usr/share/doc/${pkgname}"
}
