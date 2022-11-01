# Maintainer: Angel Velasquez <angvp@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=python-setuptools
pkgver=64.0.0
pkgrel=1
epoch=1
pkgdesc="Easily download, build, install, upgrade, and uninstall Python packages"
arch=('any')
license=('PSF')
url="https://pypi.org/project/setuptools/"
depends=('python-appdirs' 'python-jaraco.text' 'python-more-itertools' 'python-ordered-set'
         'python-packaging' 'python-pyparsing' 'python-tomli' 'python-validate-pyproject')
makedepends=('git' 'python-setuptools')
checkdepends=('python-jaraco.envs' 'python-jaraco.path' 'python-mock' 'python-pip' 'python-pip-run'
              'python-pytest-fixture-config' 'python-pytest-virtualenv' 'python-wheel'
              'python-pytest-enabler' 'python-pytest-mypy' 'python-sphinx' 'python-build'
              'python-ini2toml' 'python-tomli-w')
provides=('python-distribute')
replaces=('python-distribute')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pypa/setuptools/archive/v$pkgver.tar.gz"
        system-validate-pyproject.patch)
sha512sums=('efc15a423215443e05a9e6a778b8ff910f0a982a814899f20f7599b6bf7213e11effaae2725548e5c52874d3c9de5be7964f4d1155e7df48ccf990b64fcff246'
            '390fea2c575a0042054f51d33e629b04a48f832f0a4a2dd07d34e23cdf330c382dba0f54bfb7c8a6a253bb248a4940f2a789672f715e4dc2aeb395fa185cae7a')

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

  # Fix tests invoking python-build
  sed -e 's/"-m", "build", "--wheel"/"-m", "build", "--wheel", "--no-isolation"/' \
      -e 's/"-m", "build", "--sdist"/"-m", "build", "--sdist", "--no-isolation"/' \
      -i setuptools/tests/fixtures.py

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
  # 1: subtle difference introduced by devendoring
  # rest: skipping broken tests using "setuptools_sdist", "setuptools_wheel" (or "venv" which uses the latter)
  #       and fails with pip
  PYTHONPATH="$PWD"/build/lib python -m pytest \
    --deselect setuptools/tests/config/test_apply_pyprojecttoml.py::test_apply_pyproject_equivalent_to_setupcfg \
    --deselect setuptools/tests/test_build_meta.py::test_legacy_editable_install \
    --deselect setuptools/tests/test_distutils_adoption.py::test_distutils_local_with_setuptools \
    --deselect setuptools/tests/test_editable_install.py::test_editable_with_pyproject \
    --deselect setuptools/tests/test_editable_install.py::test_editable_with_flat_layout \
    --deselect setuptools/tests/test_editable_install.py::TestLegacyNamespaces::test_namespace_package_importable \
    --deselect setuptools/tests/test_editable_install.py::TestPep420Namespaces::test_namespace_package_importable \
    --deselect setuptools/tests/test_editable_install.py::TestPep420Namespaces::test_namespace_created_via_package_dir \
    --deselect setuptools/tests/test_editable_install.py::TestOverallBehaviour::test_editable_install \
    --deselect setuptools/tests/test_editable_install.py::TestLinkTree::test_strict_install \
    --deselect setuptools/tests/test_editable_install.py::test_compat_install \
    --deselect setuptools/tests/test_virtualenv.py
)}

package() {
  cd setuptools-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}
