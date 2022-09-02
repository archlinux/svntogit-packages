# Maintainer: Angel Velasquez <angvp@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=python-setuptools
pkgver=62.3.4
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
              'python-pytest-fixture-config' 'python-pytest-virtualenv' 'python-wheel'
              'python-paver' 'python-sphinx' 'python-build' 'python-ini2toml' 'python-tomli-w')
provides=('python-distribute')
replaces=('python-distribute')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pypa/setuptools/archive/v$pkgver.tar.gz"
        system-validate-pyproject.patch)
sha512sums=('3a94fe9e359111b17c3e2ec904485f4be86533728a55db41e9ae44df3eaa6857f5cc8607316fa986b92f59c63ad623586c783815911c809340a802850f6d3ab0'
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
  # 1-7: skipping all tests using "setuptools_sdist", "setuptools_wheel" (or "venv" which uses the latter)
  # 8-9: subtle difference introduced by devendoring
  # 10-11: TODO
  PRE_BUILT_SETUPTOOLS_SDIST="$PWD"/build/lib python -m pytest \
    --deselect setuptools/tests/integration/test_pip_install_sdist.py \
    --deselect setuptools/tests/test_distutils_adoption.py \
    --deselect setuptools/tests/test_setuptools.py::test_its_own_wheel_does_not_contain_tests \
    --deselect setuptools/tests/test_virtualenv.py \
    --deselect setuptools/tests/test_editable_install.py::test_editable_with_pyproject \
    --deselect setuptools/tests/config/test_apply_pyprojecttoml.py::TestMeta::test_example_file_in_sdist \
    --deselect setuptools/tests/config/test_apply_pyprojecttoml.py::TestMeta::test_example_file_not_in_wheel \
    --deselect setuptools/tests/config/test_apply_pyprojecttoml.py::test_apply_pyproject_equivalent_to_setupcfg \
    --deselect setuptools/tests/config/test_pyprojecttoml.py::test_invalid_example \
    --deselect setuptools/tests/test_dist_info.py::TestWheelCompatibility \
    --deselect setuptools/tests/test_dist_info.py::TestDistInfo::test_invalid_version
)}

package() {
  cd setuptools-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}
