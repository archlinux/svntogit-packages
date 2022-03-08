# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Rémy Oudompheng <remy@archlinux.org>

pkgname=python-pyelftools
_pkgname=pyelftools
pkgver=0.28
pkgrel=1
pkgdesc='Python library for analyzing ELF files and DWARF debugging information'
url='https://github.com/eliben/pyelftools'
arch=('any')
license=('custom:Public Domain')
makedepends=('python' 'python-setuptools')
depends=('python')
options=('!strip')
source=(https://github.com/eliben/${_pkgname}/archive/v${pkgver}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('005163a53fe12baad0998d60d531e3ce4201236b7b042e3c28d7e68f9c40586f94a2576be6918be991a3bf464f2ca55700c0475a6e8c7b05b4342a6f5bbf3354')
b2sums=('87dad42d87b9d3de2382e21d6f7115fb24e420e262735d4bd73c4e3a325d10b69c6eab5d73ff999811633d6a024c22c15ad65be637339f0c609378d54926f747')


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
