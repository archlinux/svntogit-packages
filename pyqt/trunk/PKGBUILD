# $Id$
# Maintainer: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: riai <riai@bigfoot.com> Ben <ben@benmazer.net>

pkgname=pyqt
pkgver=4.6.0
_pkgver=4.6
pkgrel=2
pkgdesc="A set of Python bindings for the Qt toolkit."
arch=(i686 x86_64)
url="http://riverbankcomputing.co.uk/software/pyqt/intro"
depends=('sip>=4.9.0' 'qscintilla>=2.4.0' 'qt>=4.5.3' 'dbus-python' 'openssl')
license=('GPL')
provides=('pyqt4')
replaces=('pyqt4')
conflicts=('pyqt4')
source=(http://riverbankcomputing.com/static/Downloads/PyQt4/PyQt-x11-gpl-${_pkgver}.tar.gz)
md5sums=('e03ad1d98b0cf803743e08258f0004d1')

build() {
  cd ${srcdir}/PyQt-x11-gpl-${_pkgver}

  python configure.py --confirm-license -b /usr/bin \
  -d /usr/lib/python2.6/site-packages \
  -v /usr/share/sip

  # Thanks Gerardo for the rpath fix
  find -name 'Makefile' | xargs sed -i 's|-Wl,-rpath,/usr/lib||g;s|-Wl,-rpath,.* ||g'

  make || return 1
  make DESTDIR=${pkgdir} install

  # FS#16599
  install -d ${pkgdir}/usr/lib/qt/plugins/designer/
  install -m755 libpythonplugin.so ${pkgdir}/usr/lib/qt/plugins/designer/
} 
