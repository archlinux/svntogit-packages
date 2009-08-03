# $Id$
# Maintainer: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: riai <riai@bigfoot.com> Ben <ben@benmazer.net>

pkgname=pyqt
pkgver=4.5.4
pkgrel=1
pkgdesc="A set of Python bindings for the Qt toolkit."
arch=(i686 x86_64)
url="http://riverbankcomputing.co.uk/software/pyqt/intro"
depends=('sip>=4.8.2' 'qscintilla>=2.4.0' 'qt>=4.5.2' 'dbus-python' 'openssl')
license=('GPL')
provides=('pyqt4')
replaces=('pyqt4')
conflicts=('pyqt4')
source=(http://riverbankcomputing.com/static/Downloads/PyQt4/PyQt-x11-gpl-$pkgver.tar.gz)
md5sums=('b721266d14c450dd7045025e042819ec')

build() {
  cd ${srcdir}/PyQt-x11-gpl-${pkgver}

  python configure.py --confirm-license -b /usr/bin \
  -d /usr/lib/python2.6/site-packages \
  -v /usr/share/sip

  # Thanks Gerardo for the rpath fix
  find -name 'Makefile' | xargs sed -i 's|-Wl,-rpath,/usr/lib||g;s|-Wl,-rpath,.* ||g'

  make || return 1
  make DESTDIR=${pkgdir} install
} 
