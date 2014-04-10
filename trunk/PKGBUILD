# $Id: PKGBUILD,v 1.10 2009/03/13 21:14:09 sergej Exp $
# Maintainer: Daniel Isenmann <daniel@archlinux.org>
# Maintainer: Sergej Pupykin <sergej@aur.archlinux.org>
# Maintainer: Douglas Soares de Andrade <dsandrade@gmail.com>

pkgname=('python-urwid' 'python2-urwid')
pkgver=1.2.1
pkgrel=1
pkgdesc="Urwid is a curses-based user interface library."
license=('LGPL')
arch=('i686' 'x86_64')
makedepends=('python2-setuptools' 'python-setuptools')
url="http://excess.org/urwid/"
source=(https://pypi.python.org/packages/source/u/urwid/urwid-$pkgver.tar.gz)
md5sums=('6a05ada11b87e7b026b01fc5150855b0')

build() {
  cp -r urwid-$pkgver python2-urwid-$pkgver

  cd "$srcdir/urwid-$pkgver"
  python setup.py build

  cd "$srcdir/python2-urwid-$pkgver"
  sed -i 's#bin/python#bin/python2#' urwid/*.py
  
  python2 setup.py build
}

package_python-urwid() {
  depends=('python')

  cd "$srcdir/urwid-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

package_python2-urwid() {
  depends=('python2')
 
  cd "$srcdir/python2-urwid-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}


