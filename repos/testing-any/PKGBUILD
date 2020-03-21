# Maintainer: Dan McGee <dan@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniele Paolella <dp@mcrservice.it>

pkgbase=python-virtualenv
pkgname=('python-virtualenv' 'python2-virtualenv')
pkgver=20.0.11
pkgrel=1
pkgdesc="Virtual Python Environment builder"
url="https://virtualenv.pypa.io/"
arch=('any')
license=('MIT')
makedepends=('python-setuptools' 'python-appdirs' 'python-filelock' 'python-six'
             'python2-setuptools' 'python2-appdirs' 'python2-filelock' 'python2-six'
             'python2-contextlib2' 'python2-importlib-metadata' 'python2-importlib_resources'
             'python2-pathlib2'
             'python-setuptools-scm' 'python2-setuptools-scm' 'python-sphinx'
             'python-sphinx_rtd_theme' 'python-sphinx-argparse' 'towncrier')
checkdepends=('python-pytest-mock' 'python2-pytest' 'python2-pytest-mock' 'python-pip' 'python2-pip'
              'python-coverage' 'python2-coverage' 'fish' 'xonsh')
replaces=('virtualenv')
conflicts=('virtualenv')
options=('!makeflags')
source=($pkgbase-$pkgver.tar.gz::https://github.com/pypa/virtualenv/archive/$pkgver.tar.gz)
sha512sums=('f21ba4bd72633bc2e9abc6fb457e436f5c32b5467824600ad4c4871f5d8a3d18f237a3d1737c2d15c5fed5d9e3ff00b7b7f22a3f549dd59c26c5e575d796d3ec')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

prepare() {
  cp -a virtualenv-$pkgver{,-py2}
}

build() {
  (cd virtualenv-$pkgver
    python setup.py build egg_info
    export PYTHONPATH="$PWD/build/lib:$PWD/src"
    sphinx-build -b man docs docs/_build/man
  )
  (cd virtualenv-$pkgver-py2
    python2 setup.py build egg_info
  )
}

check() {
  (cd virtualenv-$pkgver
    PYTHONPATH="$PWD/build/lib:$PWD/src" python -m pytest
  )
  (cd virtualenv-$pkgver-py2
    # Our python2 has bad pyc mtime due to makepkg, which fails this test
    PYTHONPATH="$PWD/build/lib:$PWD/src" python2 -m pytest --deselect tests/unit/create/test_creator.py::test_pyc_only
  )
}

package_python-virtualenv() {
  depends=('python-setuptools' 'python-appdirs' 'python-filelock' 'python-six')

  cd virtualenv-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --skip-build
  install -Dm 644 docs/_build/man/virtualenv.1 "${pkgdir}/usr/share/man/man1/virtualenv.1"
  ln -s virtualenv.1.gz "${pkgdir}/usr/share/man/man1/virtualenv3.1.gz"

  # link to a version with 3 suffix as well
  ln "$pkgdir/usr/bin/virtualenv" "$pkgdir/usr/bin/virtualenv3"

  install -D -m644 LICENSE -t \
    "$pkgdir"/usr/share/licenses/$pkgname/
}

package_python2-virtualenv() {
  depends=('python2-setuptools' 'python2-appdirs' 'python2-filelock' 'python2-six'
           'python2-contextlib2' 'python2-importlib-metadata' 'python2-importlib_resources'
           'python2-pathlib2')

  cd virtualenv-$pkgver-py2
  python2 setup.py install --prefix=/usr --root="$pkgdir" --skip-build
  install -Dm 644 ../virtualenv-$pkgver/docs/_build/man/virtualenv.1 "${pkgdir}/usr/share/man/man1/virtualenv2.1"

  # move this "old" version out of the way
  mv "$pkgdir/usr/bin/virtualenv" "$pkgdir/usr/bin/virtualenv2"

  install -D -m644 LICENSE -t \
    "$pkgdir"/usr/share/licenses/$pkgname/
}
