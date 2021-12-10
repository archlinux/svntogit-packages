# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Sergej Pupykin <sergej@aur.archlinux.org>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>

pkgname=python-urwid
pkgver=2.1.2
pkgrel=3
pkgdesc='Curses-based user interface library'
url='http://urwid.org/'
arch=('x86_64')
license=('LGPL')
depends=('python' 'glibc')
makedepends=('glibc' 'python-setuptools')
source=(https://pypi.org/packages/source/u/urwid/urwid-${pkgver}.tar.gz)
sha256sums=('588bee9c1cb208d0906a9f73c613d2bd32c3ed3702012f51efe318a3f2127eae')
sha512sums=('f102bdde5f5d39d4bce455020bbe4f18290589da0750a3b15b1e2bc8acf8a405f02295d7efa3009877801a36bfbfade92ec963086122e9b133db137d816a1ea5')

build() {
  cd urwid-${pkgver}
    python setup.py build
}

check() {
  cd urwid-${pkgver}
    python setup.py test
  
}

package() {
  cd urwid-${pkgver}
  python setup.py install --prefix=/usr --root="${pkgdir}" -O1 --skip-build
  rm -r "${pkgdir}"/usr/lib/python*/site-packages/urwid/tests
}

# vim: ts=2 sw=2 et:
