# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Dan McGee <dan@archlinux.org>
# Contributor: Daniele Paolella <dp@mcrservice.it>

pkgname=python-virtualenv
pkgver=20.21.0
pkgrel=1
pkgdesc="Virtual Python Environment builder"
url="https://virtualenv.pypa.io/"
arch=('any')
license=('MIT')
depends=(
  'python'
  'python-distlib'
  'python-filelock'
  'python-platformdirs'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-hatchling'
  'python-hatch-vcs'
  'python-importlib-metadata'
  'python-sphinx'
  'python-sphinx-argparse'
  'python-sphinxcontrib-towncrier'
  'python-wheel'
  'towncrier'
)
checkdepends=(
  'fish'
  'python-coverage'
  'python-flaky'
  'python-pip'
  'python-pytest-freezegun'
  'python-pytest-mock'
  # 'tcsh'  # NOTE: randomly hangs tests (e.g. tests/unit/test_util.py::test_reentrant_file_lock_is_thread_safe)
  'xonsh'
)
replaces=('virtualenv')
conflicts=('virtualenv')
options=('!makeflags')
source=(https://github.com/pypa/virtualenv/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('c02ba29677c3b6405d2849bba7243b7a61a49f83b0d309a288876754762f81a1d111ae5176e4c20623e263ceef73c4c0c76fd7a84043ee8a220b5620b31fc2e7')
b2sums=('5e8ac9e29af0251a247b7f80465e975c13fcaa722ad4859cba046783819a2540307f31a3799146316a07490e4c55fca0a77ee84238865412517832766e2ee200')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

prepare() {
  # workaround pip vendorod certifi
  sed -i "s|pkgutil.get_data(\"pip._vendor.certifi\", \"cacert.pem\")|open(os.path.join('/etc/ssl/certs/ca-certificates.crt'), 'rb').read()|" virtualenv-$pkgver/tests/conftest.py
}

build() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd virtualenv-$pkgver
  python -m build --wheel --no-isolation
  # NOTE: install to tmp dir for documentation and tests
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  sphinx-build -b man docs docs/_build/man
}

check() {
  local pytest_options=(
    -vv
    # tests try to find python2
    --deselect tests/unit/create/test_creator.py::test_py_pyc_missing[True-False]
    --deselect tests/unit/create/test_creator.py::test_py_pyc_missing[False-False]
    --deselect tests/unit/discovery/py_info/test_py_info.py::test_fallback_existent_system_executable
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd virtualenv-$pkgver
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  pytest "${pytest_options[@]}"
}

package() {
  cd virtualenv-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 docs/_build/man/virtualenv.1 -t "${pkgdir}/usr/share/man/man1/"
  ln -s virtualenv.1.gz "${pkgdir}/usr/share/man/man1/virtualenv3.1.gz"

  # link to a version with 3 suffix as well
  ln "$pkgdir/usr/bin/virtualenv" "$pkgdir/usr/bin/virtualenv3"

  install -D -m644 LICENSE -t \
    "$pkgdir"/usr/share/licenses/$pkgname/
}
