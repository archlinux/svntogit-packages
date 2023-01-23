# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-validate-pyproject
pkgver=0.11
pkgrel=1
pkgdesc="Validation library and CLI tool for checking on 'pyproject.toml' files using JSON Schema"
url="https://github.com/abravalheri/validate-pyproject"
license=('MPL')
arch=('any')
depends=('python-fastjsonschema' 'python-packaging' 'python-trove-classifiers' 'python-tomli')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
checkdepends=('python-pytest')
source=("https://github.com/abravalheri/validate-pyproject/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('4be3213d491e6aa82875141befb4173287701d1c8ba43a092427840d73a1ac5488121b3a0acbde52df175f6cc79ff9a1bb2d8ed65048c13c76c3c4ba8e733e6b')

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
