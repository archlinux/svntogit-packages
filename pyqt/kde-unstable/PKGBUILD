# $Id$
# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: riai <riai@bigfoot.com> Ben <ben@benmazer.net>

pkgname=pyqt
pkgver=4.6.2
pkgrel=2
pkgdesc="A set of Python bindings for the Qt toolkit"
arch=('i686' 'x86_64')
url="http://riverbankcomputing.co.uk/software/pyqt/intro"
depends=('sip>=4.9.3' 'qscintilla>=2.4.1' 'qt>=4.6.0' 'dbus-python' 'openssl')
license=('GPL')
provides=('pyqt4')
replaces=('pyqt4')
conflicts=('pyqt4')
source=(http://riverbankcomputing.com/static/Downloads/PyQt4/PyQt-x11-gpl-${pkgver}.tar.gz)
md5sums=('b7aba1b0e41d674b0ebcb64844f442f7')

build() {
  cd ${srcdir}/PyQt-x11-gpl-${pkgver}
  
  python configure.py --confirm-license -b /usr/bin \
  -d /usr/lib/python2.6/site-packages \
  -v /usr/share/sip

  # Thanks Gerardo for the rpath fix
  find -name 'Makefile' | xargs sed -i 's|-Wl,-rpath,/usr/lib||g;s|-Wl,-rpath,.* ||g'

  make || return 1

  # INSTALL_ROOT is needed for the QtDesigner module, the other Makefiles use DESTDIR
  make DESTDIR=${pkgdir} INSTALL_ROOT=${pkgdir} install
}
