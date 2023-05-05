# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Sergej Pupykin <sergej@aur.archlinux.org>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>

_name=urwid
pkgname=python-urwid
pkgver=2.1.2.r56.gabc098c
# somewhere past 2.1.2 as there has not been a release in years to have Python 3.11 support without bricking dependents
# https://github.com/urwid/urwid/issues/511
# https://github.com/urwid/urwid/issues/548
# https://github.com/urwid/urwid/issues/550
_commit=abc098c3400220b51aeb6fec14175e1bfa1f8bfb
pkgrel=1
pkgdesc='Curses-based user interface library'
url='https://urwid.org/'
arch=('x86_64')
license=('LGPL')
depends=(
  'glibc'
  'python'
  'python-typing-extensions'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=(
  git+https://github.com/$_name/$_name.git#commit=$_commit
)
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
  cd $_name
  git describe --long --abbrev=7 | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_name
  python -m build --wheel --no-isolation
}

check() {
  cd $_name
  python -m unittest discover -vs $_name/tests
}

package() {
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
  rm -rv "${pkgdir}"/usr/lib/python*/site-packages/urwid/tests
}

# vim: ts=2 sw=2 et:
