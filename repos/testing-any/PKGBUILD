# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Rémy Oudompheng <remy@archlinux.org>

pkgname=python-pyelftools
_pkgname=pyelftools
pkgver=0.27
pkgrel=3
pkgdesc='Python library for analyzing ELF files and DWARF debugging information'
url='https://github.com/eliben/pyelftools'
arch=('any')
license=('custom:Public Domain')
makedepends=('python' 'python-setuptools')
depends=('python')
options=('!strip')
source=(https://github.com/eliben/${_pkgname}/archive/v${pkgver}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('bb0a00e5500016e3d4f64be0a728e190f84b11a805f78d668b5a74716a30400e6794946f198ef4a3f3b8f64a63deb1b5a96180b09e56b7357b988b28e25fad0a')
b2sums=('74e6e17c68b197d0ecdddedba81a96601003c41a9c095bc72dff7630511705d36d1bc2732005a87ad1420c99497d729c5b771eca7bf5409c0da77d7b348d9c1b')


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
    echo "Skipping readelf tests (require x86_64)"
  fi
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.rst CHANGES -t "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r examples "${pkgdir}/usr/share/doc/${pkgname}"
}
