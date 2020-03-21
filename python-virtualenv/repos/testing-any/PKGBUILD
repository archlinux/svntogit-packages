# Maintainer: Dan McGee <dan@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniele Paolella <dp@mcrservice.it>

pkgbase=python-virtualenv
pkgname=('python-virtualenv' 'python2-virtualenv')
pkgver=20.0.12
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
              'python-coverage' 'python2-coverage' 'fish' 'tcsh' 'xonsh')
replaces=('virtualenv')
conflicts=('virtualenv')
options=('!makeflags')
source=($pkgbase-$pkgver.tar.gz::https://github.com/pypa/virtualenv/archive/$pkgver.tar.gz)
sha512sums=('7cb6e58a89cf68efbc1cc631dd9e6610f90d16f9c41a6c99341852c0895b17f13146b6cdd32c046cab71144f1412e2ab062267486a91929dccf98866cc64adda')

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
    PYTHONPATH="$PWD/build/lib:$PWD/src" python2 -m pytest
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
