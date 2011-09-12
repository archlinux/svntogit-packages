# $Id: PKGBUILD,v 1.10 2009/03/13 21:14:09 sergej Exp $
# Maintainer: Daniel Isenmann <daniel@archlinux.org>
# Maintainer: Sergej Pupykin <sergej@aur.archlinux.org>
# Maintainer: Douglas Soares de Andrade <dsandrade@gmail.com>

pkgname=python-urwid
pkgver=0.9.9.2
pkgrel=1
pkgdesc="Urwid is a curses-based user interface library."
license=('GPL')
arch=('i686' 'x86_64')
depends=('python2')
url="http://excess.org/urwid/"
source=(http://excess.org/urwid/urwid-$pkgver.tar.gz)
md5sums=('e58b86a983fe5474a07749501748b728')

build() {
  cd $startdir/src/urwid-$pkgver
  sed -i 's#bin/python#bin/python2#' urwid/*.py
  python2 setup.py install --prefix=/usr --root=$startdir/pkg || return 1

  rm -rf $startdir/src/$_hgname-build
}
