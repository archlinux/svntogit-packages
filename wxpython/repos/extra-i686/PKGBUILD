# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Andrew Wright <andreww@photism.org>

pkgname=wxpython
pkgver=2.8.7.1
pkgrel=1
pkgdesc="A wxWidgets GUI toolkit for Python."
arch=('i686' 'x86_64')
license=('custom:wxWindows')
url="http://www.wxpython.org"
depends=('wxgtk>=2.8.7' 'python>=2.5')
source=(http://downloads.sourceforge.net/sourceforge/wxpython/wxPython-src-${pkgver}.tar.bz2)
md5sums=('04fc1079430b18e6fd097b3287e9ae10')
sha1sums=('5526ee4c4cc57bcebb4950ea05e24639ef8b02dd')

build() {
  cd ${startdir}/src/wxPython-src-${pkgver}/wxPython
  python setup.py \
    WXPORT=gtk2 \
    UNICODE=1 \
    build install --root=${startdir}/pkg
  install -D -m644 ../docs/licence.txt $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
}
