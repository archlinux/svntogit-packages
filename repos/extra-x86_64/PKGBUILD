# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Sergej Pupykin <sergej@aur.archlinux.org>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>

pkgbase=python-urwid
pkgname=('python-urwid' 'python2-urwid')
pkgver=2.1.0
pkgrel=1
pkgdesc='Curses-based user interface library'
url='http://excess.org/urwid/'
arch=('x86_64')
license=('LGPL')
makedepends=('glibc' 'python-setuptools' 'python2-setuptools')
source=(https://github.com/urwid/urwid/archive/release-${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('2f35d3416f85c6ad3247fc37af450b342466827d8256512f4d28064c0020bca0')
sha512sums=('14267d1076e51ef53dc187dc1395e9f4d968bc1019c2fc2209143eb29b9b138a378116fae30645f1183b2378ffe43ee3491de6181a51699f933970385012abe1')

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
  rm -r "${pkgdir}"/usr/lib/python*/site-packages/urwid/tests
}

package_python2-urwid() {
  depends=('python2' 'glibc')
  cd urwid-release-${pkgver}-py2
  python2 setup.py install --prefix=/usr --root="${pkgdir}" -O1 --skip-build
  rm -r "${pkgdir}"/usr/lib/python*/site-packages/urwid/tests
}

# vim: ts=2 sw=2 et:
