# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-validate-pyproject
pkgver=0.12.1
pkgrel=1
pkgdesc="Validation library and CLI tool for checking on 'pyproject.toml' files using JSON Schema"
url="https://github.com/abravalheri/validate-pyproject"
license=('MPL')
arch=('any')
depends=('python-fastjsonschema' 'python-packaging' 'python-trove-classifiers' 'python-tomli')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
checkdepends=('python-pytest')
source=("https://github.com/abravalheri/validate-pyproject/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('7add0a3f53c4d7437e1967e905b8e787dc9bfe5b64b246712e60896df017e863213978799e4f0a8714e9d6d27fc6f3a47112e06bbd256202f558e932fa1044d2')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

prepare() {
  cd validate-pyproject-$pkgver

  # Upstream author only supports VCS builds
  echo "recursive-include src *.template *.json LICENSE LICENSE.*" > MANIFEST.in

  sed -i '/--cov/d' setup.cfg
}

build() {
  cd validate-pyproject-$pkgver
  python -m build -wn
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd validate-pyproject-$pkgver
  python -m installer --destdir=tmp_install dist/*.whl
  PYTHONPATH="$PWD/tmp_install/$site_packages:$PYTHONPATH" pytest --doctest-modules --ignore src/validate_pyproject/_vendor src
  # Deselected tests requiring a installed validate-pyproject
  PYTHONPATH="$PWD/tmp_install/$site_packages:$PYTHONPATH" pytest --deselect tests/test_pre_compile.py --deselect tests/test_vendoring.py
}

package() {
  cd validate-pyproject-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
