# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Rémy Oudompheng <remy@archlinux.org>

pkgname=python-pyelftools
_pkgname=pyelftools
pkgver=0.29
pkgrel=2
pkgdesc='Python library for analyzing ELF files and DWARF debugging information'
url='https://github.com/eliben/pyelftools'
arch=('any')
license=('custom:Public Domain')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
options=('!strip')
source=(https://github.com/eliben/${_pkgname}/archive/v${pkgver}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('0eba3b029a734abe9f8df92cd58bc967f10bf9f61c3a419bdbc5e637200844dddd947bcb485e8ebbe2eeaa7f7e91efc6500316af51aace1db051a658cf61153e')
b2sums=('441260492f8cd512445249700a79f1d823ef96f6213ab9183e17160b76efe51493c28d2ae8ecea79acf45e78987b4c24940441e9bc0a3deaeda0ee4fb72b58c3')


build() {
  cd ${_pkgname}-${pkgver}
  python -m build --wheel --no-isolation
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
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.rst CHANGES -t "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r examples "${pkgdir}/usr/share/doc/${pkgname}"
}
