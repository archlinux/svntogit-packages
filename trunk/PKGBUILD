# Maintainer: Angel Velasquez <angvp@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=python-setuptools
pkgver=61.1.1
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
sha512sums=('ec595dec22380277a8eedf20df2dab868634c8506dc05f72dc1af48a371ba011213c8d4be4178c6842ad368d713a5a5e30ce1a97b8e529abfbf1e03470718eef'
            '678c1f4bfc012c5615691433b9e329a4dd363c2b31e70620ce073bab3efe925437bf6f41c12ad48a8042e37ea6f8f7a25198afa482680ebd1505c0fc5bc30927')

export SETUPTOOLS_INSTALL_WINDOWS_SPECIFIC_FILES=0

prepare() {
  cd setuptools-$pkgver

  patch -p1 -i ../system-validate-pyproject.patch

  rm -r {pkg_resources,setuptools}/{extern,_vendor}

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
    --deselect setuptools/tests/test_config_discovery.py::TestDiscoverPackagesAndPyModules::test_project \
    --deselect setuptools/tests/test_config_discovery.py::TestNoConfig::test_build_with_discovered_name \
    --deselect setuptools/tests/test_config_discovery.py::TestWithAttrDirective::test_setupcfg_metadata \
    --deselect setuptools/tests/config/test_apply_pyprojecttoml.py::test_apply_pyproject_equivalent_to_setupcfg \
    --deselect setuptools/tests/config/test_pyprojecttoml.py::test_invalid_example \
    --deselect setuptools/tests/test_easy_install.py::TestInstallRequires::test_setup_install_includes_dependencies
)}

package() {
  cd setuptools-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}
