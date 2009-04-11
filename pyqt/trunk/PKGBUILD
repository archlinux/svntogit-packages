# $Id$
# Maintainer: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: riai <riai@bigfoot.com> Ben <ben@benmazer.net>

pkgname=pyqt
pkgver=4.4.4
pkgrel=3
pkgdesc="PyQt is a set of Python bindings for the Qt toolkit."
arch=(i686 x86_64)
url="http://riverbankcomputing.co.uk/pyqt/"
depends=('sip>=4.7.9' 'qscintilla>=2.3' 'qt>=4.4.3' 'dbus-python')
license=('GPL')
provides=('pyqt4')
replaces=('pyqt4')
conflicts=('pyqt4')
pkgurl="http://riverbankcomputing.com/software/pyqt/download"
source=(http://riverbankcomputing.com/static/Downloads/PyQt4/PyQt-x11-gpl-$pkgver.tar.gz)

build() {
  cd ${startdir}/src/PyQt-x11-gpl-${pkgver}

  echo yes | python configure.py -b /usr/bin \
  -d /usr/lib/python2.6/site-packages \
  -v /usr/share/sip

  # Thanks Gerardo for the rpath fix
  find -name 'Makefile' | xargs sed -i 's|-Wl,-rpath,/usr/lib||g;s|-Wl,-rpath,.* ||g'

  make || return 1
  make DESTDIR=${startdir}/pkg install
} 
md5sums=('4bd346d56d10452e47ac71e2cbe04229')
