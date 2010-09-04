# $Id$
# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: riai <riai@bigfoot.com> Ben <ben@benmazer.net>

pkgname=pyqt
pkgver=4.7.4
pkgrel=3
pkgdesc="A set of Python bindings for the Qt toolkit"
arch=('i686' 'x86_64')
url="http://riverbankcomputing.co.uk/software/pyqt/intro"
license=('GPL')
depends=('sip' 'qt' 'dbus-python')
makedepends=('phonon' 'python-opengl')
optdepends=('phonon' 'python-opengl' 'qscintilla')
provides=('pyqt4')
replaces=('pyqt4')
conflicts=('pyqt4')
source=("http://pyqwt.sourceforge.net/support/PyQt-x11-gpl-${pkgver}.tar.gz")
md5sums=('88e9f1bc467cccf424d2032e3470982c')

build() {
  cd ${srcdir}/PyQt-x11-gpl-${pkgver}
  
  python2 configure.py \
    --confirm-license \
    -v /usr/share/sip \
    --qsci-api

  # Thanks Gerardo for the rpath fix
  find -name 'Makefile' | xargs sed -i 's|-Wl,-rpath,/usr/lib||g;s|-Wl,-rpath,.* ||g'

  make
}

package(){
  cd ${srcdir}/PyQt-x11-gpl-${pkgver}
  # INSTALL_ROOT is needed for the QtDesigner module, the other Makefiles use DESTDIR
  make DESTDIR="${pkgdir}" INSTALL_ROOT="${pkgdir}" install
}
