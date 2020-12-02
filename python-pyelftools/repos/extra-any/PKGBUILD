# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Rémy Oudompheng <remy@archlinux.org>

pkgname=python-pyelftools
_pkgname=pyelftools
pkgver=0.26
pkgrel=3
pkgdesc='Python library for analyzing ELF files and DWARF debugging information'
url='https://github.com/eliben/pyelftools'
arch=('any')
license=('custom:Public Domain')
makedepends=('python' 'python-setuptools')
depends=('python')
options=('!strip')
source=(https://github.com/eliben/${_pkgname}/archive/v${pkgver}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('dd166f56654592f6a0d7a91bc41c01b9300de6d2f08b204a61ac48eb3f4b3224f89271c5fe66adc41d71a5e2bed8ddfa4ad495098df917623f7aa90c2caffeca')
b2sums=('523e6f64205273e8362db92900aebdc05849c5a55d48f75aeae4aa0c58d6dde35ba73c660a5993b211b210fba634360befbdfa90077a140d708c71091918e306')


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
