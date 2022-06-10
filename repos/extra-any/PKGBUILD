# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-validate-pyproject
pkgver=0.9
pkgrel=1
pkgdesc="Validation library and CLI tool for checking on 'pyproject.toml' files using JSON Schema"
url="https://github.com/abravalheri/validate-pyproject"
license=('MPL')
arch=('any')
depends=('python-packaging' 'python-trove-classifiers' 'python-tomli')
makedepends=('python-setuptools-scm')
checkdepends=('python-pytest-cov')
source=("https://github.com/abravalheri/validate-pyproject/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('6928041c4c86b40a4999ed86ede53d6bb397612ef2372bdeb11f0efd86c178bd092c2e13d46e5ede8ff499dfd0dd4d47dab6441762a7d2ae257e19a909f28609')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

prepare() {
  cd validate-pyproject-$pkgver

  # Upstream author only supports VCS builds
  echo "recursive-include src *.template *.json LICENSE LICENSE.*" > MANIFEST.in

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
  python setup.py build
}

check() {
  cd validate-pyproject-$pkgver
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.10/site-packages:$PYTHONPATH" pytest --doctest-modules --ignore src/validate_pyproject/_vendor src
  # Deselected tests require a installed validate-pyproject
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.10/site-packages:$PYTHONPATH" pytest --deselect tests/test_pre_compile.py --deselect tests/test_vendoring.py
}

package() {
  cd validate-pyproject-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
