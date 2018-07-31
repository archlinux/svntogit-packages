# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Rémy Oudompheng <remy@archlinux.org>

pkgbase=python-pyelftools
pkgname=('python2-pyelftools' 'python-pyelftools')
_pkgname=pyelftools
pkgver=0.24
pkgrel=3
pkgdesc='Python library for analyzing ELF files and DWARF debugging information'
url='https://github.com/eliben/pyelftools'
arch=('any')
license=('custom:Public Domain')
makedepends=('python' 'python2')
options=('!strip')
source=(${_pkgname}-${pkgver}.tar.gz::https://github.com/eliben/${_pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('5f02018b3c1c6da55c762e4e7a0eb9d5c9d2af542779dbcda231f563eb93565a0b5bd520ab5a4e07b26958122abeea1e76ee8609e4941ac38289adacea50910f')

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
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst CHANGES -t "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r examples "${pkgdir}/usr/share/doc/${pkgname}"
}

package_python2-pyelftools() {
  depends=('python2')
  cd ${_pkgname}-${pkgver}-py2
  python2 setup.py install -O1 --root="${pkgdir}" --skip-build
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst CHANGES -t "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r examples "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
