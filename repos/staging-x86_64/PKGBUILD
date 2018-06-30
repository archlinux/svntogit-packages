# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Sergej Pupykin <sergej@aur.archlinux.org>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>

pkgbase=python-urwid
pkgname=('python-urwid' 'python2-urwid')
pkgver=2.0.1
pkgrel=2
pkgdesc='Curses-based user interface library'
url='http://excess.org/urwid/'
arch=('x86_64')
license=('LGPL')
makedepends=('glibc' 'python-setuptools' 'python2-setuptools')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/urwid/urwid/archive/release-${pkgver}.tar.gz)
sha512sums=('9dbb868e7111ad35be84db3bea6df8cd3fc2b71cd93755d481863c2e0e262a757193e776a1edc1478996876895e2519510a160c2434a115f425a91601fdcc833')

prepare() {
  cp -a urwid-release-${pkgver}{,-py2}
  sed -i 's|bin/python$|bin/python2|' urwid-release-${pkgver}-py2/urwid/*.py
}

build() {
  (cd urwid-release-${pkgver}
    python setup.py build
  )
  (cd urwid-release-${pkgver}-py2
    python2 setup.py build
  )
}

check() {
  (cd urwid-release-${pkgver}
    python setup.py test
  )
  (cd urwid-release-${pkgver}-py2
    python2 setup.py test
  )
}

package_python-urwid() {
  depends=('python' 'glibc')
  cd urwid-release-${pkgver}
  python setup.py install --prefix=/usr --root="${pkgdir}" -O1 --skip-build
}

package_python2-urwid() {
  depends=('python2' 'glibc')
  cd urwid-release-${pkgver}-py2
  python2 setup.py install --prefix=/usr --root="${pkgdir}" -O1 --skip-build
}

# vim: ts=2 sw=2 et:
