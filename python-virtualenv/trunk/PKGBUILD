# Maintainer: Dan McGee <dan@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniele Paolella <dp@mcrservice.it>

pkgname=('python-virtualenv' 'python2-virtualenv')
pkgver=16.2.0
pkgrel=1
pkgdesc="Virtual Python Environment builder"
url="https://virtualenv.pypa.io/"
arch=('any')
license=('MIT')
makedepends=('python-setuptools' 'python-sphinx' 'python2-setuptools' 'towncrier')
checkdepends=('python-pytest-runner' 'python-mock' 'python2-pytest-runner' 'python2-mock'
              'python-pip' 'python2-pip')
replaces=('virtualenv')
conflicts=('virtualenv')
options=('!makeflags')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/pypa/virtualenv/archive/${pkgver}.tar.gz)
sha512sums=('1c80f1ea693a4223d78571919bf7e33650e569060674cacf880f2142e6cd78a39d2cd2c2310bdbb6968ff0dc2e75ab1245029a0e792228d15dc33569b237d58a')

prepare() {
  cp -a virtualenv-${pkgver}{,-py2}
}

build() {
  (cd virtualenv-${pkgver}
    python setup.py build
    export PYTHONPATH="$PWD/build/lib"
    sphinx-build -b man docs docs/_build/man
    sphinx-build -b text docs docs/_build/text
  )
  (cd virtualenv-${pkgver}-py2
    python2 setup.py build
    export PYTHONPATH="$PWD/build/lib"
    sphinx-build -b man docs docs/_build/man
    sphinx-build -b text docs docs/_build/text
  )
}

check() {
  (cd virtualenv-${pkgver}
    python setup.py pytest --addopts "--deselect tests/test_source_content.py::test_wheel_contains"
  )
  (cd virtualenv-${pkgver}-py2
    python2 setup.py pytest --addopts "--deselect tests/test_source_content.py::test_wheel_contains \
                                       --deselect tests/test_bootstrap.py"
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
