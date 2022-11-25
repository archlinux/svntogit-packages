# Maintainer: Angel Velasquez <angvp@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=python-setuptools
pkgver=65.6.1
pkgrel=1
epoch=1
pkgdesc="Easily download, build, install, upgrade, and uninstall Python packages"
arch=('any')
license=('PSF')
url="https://pypi.org/project/setuptools/"
depends=('python-appdirs' 'python-jaraco.text' 'python-more-itertools' 'python-ordered-set'
         'python-packaging' 'python-pyparsing' 'python-tomli' 'python-validate-pyproject')
makedepends=('git' 'python-setuptools')
checkdepends=('python-jaraco.envs' 'python-jaraco.path' 'python-pip' 'python-pip-run'
              'python-pytest-fixture-config' 'python-pytest-virtualenv' 'python-wheel'
              'python-pytest-enabler' 'python-pytest-mypy' 'python-pytest-timeout' 'python-sphinx'
              'python-build' 'python-ini2toml' 'python-tomli-w')
provides=('python-distribute')
replaces=('python-distribute')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pypa/setuptools/archive/v$pkgver.tar.gz"
        system-validate-pyproject.patch
        add-dependency.patch)
sha512sums=('43be758bb0201d59bd8c277d5a9bc56e3ddc33ad8f24303c9854c06c50ea85efd75290770c29f8ac4f8650385c2055fcf893cabb3b106260d7efe9b1544d4ff6'
            '390fea2c575a0042054f51d33e629b04a48f832f0a4a2dd07d34e23cdf330c382dba0f54bfb7c8a6a253bb248a4940f2a789672f715e4dc2aeb395fa185cae7a'
            '4277c983f17db19b0e499ceff7b6e24aad4f7956ec282bb7f5148f6f44e4e35077bfdfa219cbc04f49f37d0b9dc9c3e3075db7a36dbdc30944e1bd28efad0e0b')

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

  # Add the devendored dependencies into metadata of setuptools
  patch -p1 -i ../add-dependency.patch

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
  # 2: pip failures related to devendoring, 
  PYTHONPATH="$PWD"/build/lib python -m pytest \
    --deselect setuptools/tests/config/test_apply_pyprojecttoml.py::test_apply_pyproject_equivalent_to_setupcfg \
    --deselect setuptools/tests/test_virtualenv.py
)}

package() {
  cd setuptools-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}
