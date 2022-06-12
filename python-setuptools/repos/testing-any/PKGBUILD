# Maintainer: Angel Velasquez <angvp@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=python-setuptools
pkgver=61.3.0
pkgrel=1
epoch=1
pkgdesc="Easily download, build, install, upgrade, and uninstall Python packages"
arch=('any')
license=('PSF')
url="https://pypi.org/project/setuptools/"
depends=('python-appdirs' 'python-jaraco.text' 'python-more-itertools' 'python-nspektr'
         'python-ordered-set' 'python-packaging' 'python-pyparsing' 'python-tomli'
         'python-validate-pyproject')
makedepends=('git' 'python-setuptools')
checkdepends=('python-jaraco.envs' 'python-jaraco.path' 'python-mock' 'python-pip' 'python-pip-run'
              'python-pytest-fixture-config' 'python-pytest-flake8' 'python-pytest-virtualenv'
              'python-wheel' 'python-paver' 'python-pytest-cov' 'python-sphinx' 'python-build'
              'python-ini2toml' 'python-tomli-w')
provides=('python-distribute')
replaces=('python-distribute')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pypa/setuptools/archive/v$pkgver.tar.gz"
        system-validate-pyproject.patch)
sha512sums=('35e2b848cf79e577b8c469562cb68a80b27d42d2d9c1c94f84fea9beb85e2db0796ed64d414add67a404d801c4f4e6cd489a72153de4dc8ed8b45fab24c28fd9'
            '50495062093b1b6902484c384abe073896e4f45c5768741582e178014367f186831711a72a8a987e7bacafe96d871161fc07c686dd92c6886de19302f6a10b56')

export SETUPTOOLS_INSTALL_WINDOWS_SPECIFIC_FILES=0

prepare() {
  cd setuptools-$pkgver

  patch -p1 -i ../system-validate-pyproject.patch

  rm -r {pkg_resources,setuptools}/{extern,_vendor} setuptools/config/_validate_pyproject

  # Upstream devendoring logic is badly broken, see:
  # https://bugs.archlinux.org/task/58670
  # https://github.com/pypa/pip/issues/5429
  # https://github.com/pypa/setuptools/issues/1383
  # The simplest fix is to simply rewrite import paths to use the canonical
  # location in the first place
  for _module in setuptools pkg_resources '' ; do
      find . -name \*.py -exec sed -i \
          -e 's/from '$_module.extern' import/import/' \
          -e 's/from '$_module.extern'\./from /' \
          -e 's/import '$_module.extern'\./import /' \
          -e "s/__import__('$_module.extern./__import__('/" \
          -e 's/from \.\.extern\./from /' \
          {} +
  done

  # Remove post-release tag since we are using stable tags
  sed -e '/tag_build = .post/d' \
      -e '/tag_date = 1/d' \
      -i setup.cfg

  # Fix shebang
  sed -i -e "s|^#\!.*/usr/bin/env python|#!/usr/bin/env python3|" setuptools/command/easy_install.py
}

build() {
  cd setuptools-$pkgver
  python setup.py build
}

check() { (
  # Workaround UTF-8 tests by setting LC_CTYPE
  export LC_CTYPE=en_US.UTF-8

  # https://github.com/pypa/setuptools/pull/810
  export PYTHONDONTWRITEBYTECODE=1

  cd setuptools-$pkgver
  SETUPTOOLS_USE_DISTUTILS=stdlib python -m pytest \
    --deselect setuptools/tests/test_distutils_adoption.py \
    --deselect setuptools/tests/integration/test_pip_install_sdist.py \
    --deselect setuptools/tests/test_setuptools.py::test_its_own_wheel_does_not_contain_tests \
    --deselect setuptools/tests/test_virtualenv.py \
    --deselect "setuptools/tests/test_editable_install.py::test_editable_with_pyproject[__import__('setuptools').setup()]" \
    --deselect setuptools/tests/config/test_apply_pyprojecttoml.py::test_apply_pyproject_equivalent_to_setupcfg \
    --deselect setuptools/tests/config/test_pyprojecttoml.py::test_invalid_example
)}

package() {
  cd setuptools-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}
