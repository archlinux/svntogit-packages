# Maintainer: Angel Velasquez <angvp@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=python-setuptools
pkgver=67.1.0
_commit=8032430d75cdfad9f9826d302d90cd7b23dea3ca
pkgrel=1
epoch=1
pkgdesc="Easily download, build, install, upgrade, and uninstall Python packages"
arch=('any')
license=('PSF')
url="https://pypi.org/project/setuptools/"
depends=('python-jaraco.text' 'python-more-itertools' 'python-ordered-set' 'python-packaging'
         'python-platformdirs' 'python-tomli' 'python-validate-pyproject')
makedepends=('git' 'python-setuptools')
checkdepends=('python-jaraco.envs' 'python-jaraco.path' 'python-pip' 'python-pip-run'
              'python-pytest-fixture-config' 'python-pytest-virtualenv' 'python-wheel'
              'python-pytest-enabler' 'python-pytest-mypy' 'python-pytest-timeout' 'python-sphinx'
              'python-build' 'python-ini2toml' 'python-tomli-w')
provides=('python-distribute')
replaces=('python-distribute')
source=("git+https://github.com/pypa/setuptools.git#commit=$_commit"
        system-validate-pyproject.patch
        add-dependency.patch)
sha512sums=('SKIP'
            '390fea2c575a0042054f51d33e629b04a48f832f0a4a2dd07d34e23cdf330c382dba0f54bfb7c8a6a253bb248a4940f2a789672f715e4dc2aeb395fa185cae7a'
            '9c5d80c753e78bf613572fb789a234984087d0ce96d0bad22b5ed731d83c77bf6d8acfa65c78f6c78f9063be7819c2b58988fdf8e7fc89b55339f94a87b3b21f')

export SETUPTOOLS_INSTALL_WINDOWS_SPECIFIC_FILES=0

prepare() {
  cd setuptools

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
  cd setuptools
  python setup.py build
}

check() { (
  # Workaround UTF-8 tests by setting LC_CTYPE
  export LC_CTYPE=en_US.UTF-8

  # https://github.com/pypa/setuptools/pull/810
  export PYTHONDONTWRITEBYTECODE=1

  cd setuptools
  # 1: subtle difference introduced by devendoring
  # 2: pip failures related to devendoring, 
  # 3: TODO
  PYTHONPATH="$PWD"/build/lib python -m pytest \
    --deselect setuptools/tests/config/test_apply_pyprojecttoml.py::test_apply_pyproject_equivalent_to_setupcfg \
    --deselect setuptools/tests/test_virtualenv.py \
    --deselect setuptools/tests/test_editable_install.py::test_editable_with_prefix
)}

package() {
  cd setuptools
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}
