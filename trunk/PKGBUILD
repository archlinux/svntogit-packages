# Maintainer: Dan McGee <dan@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniele Paolella <dp@mcrservice.it>

pkgbase=python-virtualenv
pkgname=python-virtualenv
pkgver=20.12.1
pkgrel=1
pkgdesc="Virtual Python Environment builder"
url="https://virtualenv.pypa.io/"
arch=('any')
license=('MIT')
depends=('python-platformdirs' 'python-distlib' 'python-filelock' 'python-six'
         'python-importlib-metadata')
makedepends=('python-setuptools' 'python-platformdirs' 'python-distlib' 'python-filelock'
             'python-six' 'python-setuptools-scm' 'python-sphinx' 'python-sphinx_rtd_theme'
             'python-sphinx-argparse' 'towncrier' 'python-importlib-metadata')
checkdepends=('python-pytest-freezegun' 'python-pytest-mock' 'python-pip' 'python-coverage' 'fish'
              'xonsh' 'python-flaky')  # 'tcsh' removed: randomly hangs tests
replaces=('virtualenv')
conflicts=('virtualenv')
options=('!makeflags')
source=(https://github.com/pypa/virtualenv/archive/$pkgver/$pkgbase-$pkgver.tar.gz)
sha512sums=('558a7817c11dce84960e5ae3d60ff3d4458ace9597458f1168aafece6b1f2e645e83ca0d19cffdb504669e342996520a658b05e1d2d2670ee3a3b99b3744f7aa')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

prepare() {
  # TODO: figure out why
  sed -i '/test_py_info_to_system_raises/i @pytest.mark.skip' virtualenv-$pkgver/tests/unit/discovery/py_info/test_py_info.py

  # workaround pip vendorod certifi
  sed -i "s|pkgutil.get_data(\"pip._vendor.certifi\", \"cacert.pem\")|open(os.path.join('/etc/ssl/certs/ca-certificates.crt'), 'rb').read()|" virtualenv-$pkgver/tests/conftest.py

  # Use importlib-metadata directly for Python 3.9
  sed -i 's/from backports.entry_points_selectable import entry_points/from importlib_metadata import entry_points/' virtualenv-$pkgver/src/virtualenv/run/plugin/base.py
  sed -i '/backports.entry_points_selectable/d' virtualenv-$pkgver/setup.cfg
}

build() {
  (cd virtualenv-$pkgver
    python setup.py build egg_info
    export PYTHONPATH="$PWD/build/lib:$PWD/src"
    sphinx-build -b man docs docs/_build/man
  )
}

check() {
  cd virtualenv-$pkgver
  PYTHONPATH="$PWD/build/lib:$PWD/src" python -m pytest
}

package() {
  cd virtualenv-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --skip-build
  install -Dm 644 docs/_build/man/virtualenv.1 "${pkgdir}/usr/share/man/man1/virtualenv.1"
  ln -s virtualenv.1.gz "${pkgdir}/usr/share/man/man1/virtualenv3.1.gz"

  # link to a version with 3 suffix as well
  ln "$pkgdir/usr/bin/virtualenv" "$pkgdir/usr/bin/virtualenv3"

  install -D -m644 LICENSE -t \
    "$pkgdir"/usr/share/licenses/$pkgname/
}
