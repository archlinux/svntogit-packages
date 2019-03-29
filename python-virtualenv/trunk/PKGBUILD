# Maintainer: Dan McGee <dan@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniele Paolella <dp@mcrservice.it>

pkgname=('python-virtualenv' 'python2-virtualenv')
pkgver=16.1.0
pkgrel=1
pkgdesc="Virtual Python Environment builder"
url="https://virtualenv.pypa.io/"
arch=('any')
license=('MIT')
makedepends=('python-setuptools' 'python-sphinx' 'python2-setuptools' 'python2-sphinx')
checkdepends=('python-pytest-runner' 'python-mock' 'python2-pytest-runner' 'python2-mock')
replaces=('virtualenv')
conflicts=('virtualenv')
options=('!makeflags')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/pypa/virtualenv/archive/${pkgver}.tar.gz)
sha512sums=('a946b18c6b35fed32329ff398a55f2b3e3bf0b96ff00b11f70255dad9af7a341d0d2b1f5a5a62792bf5a66096401055909afcddfe47302420709abce17e1c151')

prepare() {
  cp -a virtualenv-${pkgver}{,-py2}
  cd virtualenv-${pkgver}-py2
  sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2|" src/virtualenv.py
}

build() {
  (cd virtualenv-${pkgver}
    python setup.py build
    make -C docs text man
  )
  (cd virtualenv-${pkgver}-py2
    python2 setup.py build
    make -C docs text man
  )
}

check() {
  (cd virtualenv-${pkgver}
    python setup.py pytest
  )
  (cd virtualenv-${pkgver}-py2
    python2 setup.py pytest
  )
}

package_python-virtualenv() {
  depends=('python-setuptools')

  cd virtualenv-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --skip-build
  install -Dm 644 docs/_build/text/* -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 docs/_build/man/virtualenv.1 "${pkgdir}/usr/share/man/man1/virtualenv.1"
  ln -s virtualenv.1.gz "${pkgdir}/usr/share/man/man1/virtualenv3.1.gz"

  # link to a version with 3 suffix as well
  ln "$pkgdir/usr/bin/virtualenv" "$pkgdir/usr/bin/virtualenv3"

  install -D -m644 LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-virtualenv() {
  depends=('python2-setuptools')

  cd virtualenv-$pkgver-py2
  python2 setup.py install --prefix=/usr --root="$pkgdir" --skip-build
  install -Dm 644 docs/_build/text/* -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 docs/_build/man/virtualenv.1 "${pkgdir}/usr/share/man/man1/virtualenv2.1"

  # move this "old" version out of the way
  mv "$pkgdir/usr/bin/virtualenv" "$pkgdir/usr/bin/virtualenv2"

  install -D -m644 LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
