# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-packaging
pkgname=(python-packaging python2-packaging)
pkgver=20.9
pkgrel=7
pkgdesc="Core utilities for Python packages"
arch=('any')
url="https://github.com/pypa/packaging"
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools' 'python-pyparsing' 'python2-pyparsing')
checkdepends=('python-pytest' 'python-pretend')
source=("https://github.com/pypa/packaging/archive/$pkgver/$pkgbase-$pkgver.tar.gz"
        replace-distutils-usage-with-sysconfig.patch)
sha512sums=('fb71f1036cfaacbe94fdee663af31d6ad1960f73ecc95cba87b461c2d7d2ea90085853bb4682b146492d8c48f784b60ef082e3b1259269857166b143cd9a920b'
            '015ddcb799259190e3a4b97d386fb8e4cb6f76a22eed2ce97babf10116e886b82f6f3e3e74e3590dd14a8fce8e6ca5980a91205c61e29afa5dbdc387f4daa8dd')

prepare() {
  cd packaging-$pkgver
  patch -Np1 -i ../replace-distutils-usage-with-sysconfig.patch
}

build() {
  cd packaging-$pkgver
  python setup.py build
  python2 setup.py build
}

check() {
  cd packaging-$pkgver
  python -m pytest
}

package_python-packaging() {
  depends=('python-pyparsing' 'python-six')

  cd packaging-$pkgver
  python setup.py install --root "$pkgdir"
}

package_python2-packaging() {
  depends=('python2-pyparsing' 'python2-six')

  cd packaging-$pkgver
  python2 setup.py install --root "$pkgdir"
}
