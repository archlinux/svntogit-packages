# $Id$
# Maintainer: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: riai <riai@bigfoot.com> Ben <ben@benmazer.net>

pkgname=pyqt
pkgver=4.5.0.20090604
_pkgver=4.5-snapshot-20090604
pkgrel=1
pkgdesc="A set of Python bindings for the Qt toolkit."
arch=(i686 x86_64)
url="http://riverbankcomputing.co.uk/pyqt/"
depends=('sip>=4.8.0' 'qscintilla>=2.3' 'qt>=4.4.3' 'dbus-python' 'openssl')
license=('GPL')
provides=('pyqt4')
replaces=('pyqt4')
conflicts=('pyqt4')
source=(http://riverbankcomputing.com/static/Downloads/PyQt4/PyQt-x11-gpl-${_pkgver}.tar.gz)
md5sums=('a8960b74430a4e381691ff7c41a17b2e')

build() {
  cd ${srcdir}/PyQt-x11-gpl-${_pkgver}

  python configure.py --confirm-license -b /usr/bin \
    -d /usr/lib/python2.6/site-packages \
    -v /usr/share/sip

  # Thanks Gerardo for the rpath fix
  find -name 'Makefile' | xargs sed -i 's|-Wl,-rpath,/usr/lib||g;s|-Wl,-rpath,.* ||g'

  make || return 1
  make DESTDIR=${pkgdir} install
} 
