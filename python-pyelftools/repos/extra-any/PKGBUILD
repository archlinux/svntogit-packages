# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Rémy Oudompheng <remy@archlinux.org>

pkgbase=python-pyelftools
pkgname=('python2-pyelftools' 'python-pyelftools')
_pkgname=pyelftools
pkgver=0.25
pkgrel=1
pkgdesc='Python library for analyzing ELF files and DWARF debugging information'
url='https://github.com/eliben/pyelftools'
arch=('any')
license=('custom:Public Domain')
makedepends=('python' 'python-setuptools'
             'python2' 'python2-setuptools')
options=('!strip')
source=(${_pkgname}-${pkgver}.tar.gz::https://github.com/eliben/${_pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('84fbff3a8abc1d0d47e2113d14f509a6a0e8fb97d09c6abf91cefb416b7237d31f53945627e3958901b2a5229f57d5d2ffc9e0b7b4cd271f61689781dc6871bc')

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
  msg2 "Running tests under Python 3"
  (cd ${_pkgname}-${pkgver}
    python test/run_all_unittests.py
    python test/run_examples_test.py
    if [ "${CARCH}" == "x86_64" ]; then
      python test/run_readelf_tests.py
    else
      warning "Skipping readelf tests (require x86_64)"
    fi
  )
  msg2 "Running tests under Python 2"
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
