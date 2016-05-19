# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Rémy Oudompheng <remy@archlinux.org>

pkgbase=python-pyelftools
pkgname=('python2-pyelftools' 'python-pyelftools')
_pkgname=pyelftools
pkgver=0.23
pkgrel=3
pkgdesc='Python library for analyzing ELF files and DWARF debugging information'
url="https://github.com/eliben/pyelftools"
arch=('any')
license=('custom:Public Domain')
makedepends=('python' 'python2')
options=('!strip')
source=(${_pkgname}-${pkgver}.tar.gz::https://github.com/eliben/${_pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('277976a889291c4abf9a700655d4a2e373f763aa80f8d5929822dd323a7d3563d51a51b7cf72979752f33790394aabdc3cbd06e03c4bb54022030adc8942dd4b')

prepare() {
  cp -ra ${_pkgname}-${pkgver}{,-py2}
  cd ${_pkgname}-${pkgver}-py2
  sed -e 's/env python$/env python2/g' -i scripts/readelf.py
  mv scripts/readelf.py scripts/readelf.py2
  sed -r 's/readelf.py/\02/g' -i setup.py test/run_readelf_tests.py
}

build() {
  (cd ${_pkgname}-${pkgver}
    python setup.py build
  )
  (cd ${_pkgname}-${pkgver}-py2
    python2 setup.py build
  )
}

check() {
  (cd ${_pkgname}-${pkgver}
    python test/run_all_unittests.py
    python test/run_examples_test.py
    if [ "${CARCH}" == "x86_64" ]; then
      python test/run_readelf_tests.py
    else
      warning "Skipping readelf tests (require x86_64)"
    fi
  )
  (cd ${_pkgname}-${pkgver}-py2
    python2 test/run_all_unittests.py
    python2 test/run_examples_test.py
    if [ "${CARCH}" == "x86_64" ]; then
      python2 test/run_readelf_tests.py
    else
      warning "Skipping readelf tests (require x86_64)"
    fi
  )
}

package_python-pyelftools() {
  depends=('python')
  cd ${_pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
  cp -r examples "${pkgdir}/usr/share/doc/${pkgname}"
}

package_python2-pyelftools() {
  depends=('python2')
  cd ${_pkgname}-${pkgver}-py2
  python2 setup.py install -O1 --root="${pkgdir}" --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
  cp -r examples "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
