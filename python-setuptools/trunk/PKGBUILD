# Maintainer: Angel Velasquez <angvp@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=python-setuptools
pkgver=59.5.0
pkgrel=1
epoch=1
pkgdesc="Easily download, build, install, upgrade, and uninstall Python packages"
arch=('any')
license=('PSF')
url="https://pypi.org/project/setuptools/"
depends=('python-appdirs' 'python-more-itertools' 'python-ordered-set' 'python-packaging'
         'python-pyparsing')
makedepends=('git' 'python-setuptools')
checkdepends=('python-jaraco.envs' 'python-jaraco.path' 'python-mock' 'python-pip'
              'python-pytest-fixture-config' 'python-pytest-flake8' 'python-pytest-virtualenv'
              'python-wheel' 'python-paver' 'python-pytest-cov' 'python-sphinx')
provides=('python-distribute')
replaces=('python-distribute')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pypa/setuptools/archive/v$pkgver.tar.gz")
sha512sums=('65720b040ae9fc356d66fc74dadeec8456d4dc415cde88efc61c86d932bf0e00865b1bd56c3371d40be64c3a8ac1595543c7ff13d1b1b1c1133ca13f0b353a74')

export SETUPTOOLS_INSTALL_WINDOWS_SPECIFIC_FILES=0

prepare() {
  rm -r setuptools-$pkgver/{pkg_resources,setuptools}/{extern,_vendor}

  # Upstream devendoring logic is badly broken, see:
  # https://bugs.archlinux.org/task/58670
  # https://github.com/pypa/pip/issues/5429
  # https://github.com/pypa/setuptools/issues/1383
  # The simplest fix is to simply rewrite import paths to use the canonical
  # location in the first place
  for _module in setuptools pkg_resources '' ; do
      find setuptools-$pkgver -name \*.py -exec sed -i \
          -e 's/from '$_module.extern' import/import/' \
          -e 's/from '$_module.extern'./from /' \
          -e 's/import '$_module.extern'./import /' \
          -e "s/__import__('$_module.extern./__import__('/" \
          {} +
  done

  # Remove post-release tag since we are using stable tags
  sed -e '/tag_build = .post/d' \
      -e '/tag_date = 1/d' \
      -i setuptools-$pkgver/setup.cfg

  # 'Clean' installation is expected to fail since we removed bundled packages
  sed -i '/^def test_clean_env_install/i @pytest.mark.xfail' setuptools-$pkgver/setuptools/tests/test_virtualenv.py

  # Tests failed. Importing an unbundled new setuptools in a virtualenv does not work, but this won't
  # affect normal virtualenv usage (which don't have to import the unbundled setuptools in *current*
  # dir.
  sed -e '/^def test_pip_upgrade_from_source/i @pytest.mark.xfail' \
      -e '/^def test_test_command_install_requirements/i @pytest.mark.xfail' \
      -e '/^def test_no_missing_dependencies/i @pytest.mark.xfail' \
      -i setuptools-$pkgver/setuptools/tests/test_virtualenv.py
  
  cd "$srcdir"/setuptools-$pkgver
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
  python -m pytest --deselect setuptools/tests/test_distutils_adoption.py
)}

package() {
  cd setuptools-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}
