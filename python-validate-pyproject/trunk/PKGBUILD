# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-validate-pyproject
pkgver=0.10
pkgrel=1
pkgdesc="Validation library and CLI tool for checking on 'pyproject.toml' files using JSON Schema"
url="https://github.com/abravalheri/validate-pyproject"
license=('MPL')
arch=('any')
depends=('python-packaging' 'python-trove-classifiers' 'python-tomli')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
checkdepends=('python-pytest')
source=("https://github.com/abravalheri/validate-pyproject/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('a77cf65f844ef922e8311e3226d099f4a2a293006b8a614779a90e24de8b578c187a3faf6a1351eaf10f2084bcd6c5746549b7de1b25b165734626e84eb0feb0')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

prepare() {
  cd validate-pyproject-$pkgver

  # Upstream author only supports VCS builds
  echo "recursive-include src *.template *.json LICENSE LICENSE.*" > MANIFEST.in

  sed -i '/--cov/d' setup.cfg

  # Devendor fastjsonschema
  # Disabled: functional differences due to changes in vendored copy
  # rm -r src/validate_pyproject/_vendor
  # sed -e 's/from validate_pyproject._vendor.fastjsonschema import/from fastjsonschema import/' \
  #     -e 's/from validate_pyproject._vendor import fastjsonschema/import fastjsonschema/' \
  #     -e 's/from .._vendor import fastjsonschema/import fastjsonschema/' \
  #     -e 's/from ._vendor.fastjsonschema import/from fastjsonschema import/' \
  #     -e 's/from ._vendor import fastjsonschema/import fastjsonschema/' \
  #     -i src/validate_pyproject/*.py tests/*.py src/validate_pyproject/pre_compile/*.template src/validate_pyproject/pre_compile/*.py
}

build() {
  cd validate-pyproject-$pkgver
  python -m build -wn
}

check() {
  cd validate-pyproject-$pkgver
  python -m installer --destdir=tmp_install dist/*.whl
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.10/site-packages:$PYTHONPATH" pytest --doctest-modules --ignore src/validate_pyproject/_vendor src
  # Deselected tests requiring a installed validate-pyproject
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.10/site-packages:$PYTHONPATH" pytest --deselect tests/test_pre_compile.py --deselect tests/test_vendoring.py
}

package() {
  cd validate-pyproject-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
