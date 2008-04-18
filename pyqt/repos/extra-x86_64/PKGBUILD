# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: riai <riai@bigfoot.com> Ben <ben@benmazer.net>

pkgname=pyqt
pkgver=4.3.3
pkgrel=1
pkgdesc="PyQt is a set of Python bindings for the Qt toolkit."
arch=(i686 x86_64)
url="http://riverbankcomputing.co.uk/pyqt/"
depends=('sip>=4.7.3' 'qscintilla>=2.1' 'qt>=4.3.3')
license=('GPL')
provides=('pyqt4')
replaces=('pyqt4')
conflicts=('pyqt4')
pkgurl="http://www.riverbankcomputing.com/Downloads/PyQt4/GPL/"
source=($pkgurl/PyQt-x11-gpl-${pkgver}.tar.gz)

build() {
  cd ${startdir}/src/PyQt-x11-gpl-${pkgver}

  echo yes | python configure.py -b /usr/bin \
  -d /usr/lib/python2.5/site-packages \
  -v /usr/share/sip

  make || return 1
  make DESTDIR=${startdir}/pkg install
} 
