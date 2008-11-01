# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: riai <riai@bigfoot.com> Ben <ben@benmazer.net>

pkgname=pyqt
pkgver=4.4.3
pkgrel=2
pkgdesc="PyQt is a set of Python bindings for the Qt toolkit."
arch=(i686 x86_64)
url="http://riverbankcomputing.co.uk/pyqt/"
depends=('sip>=4.7.7' 'qscintilla>=2.3' 'qt>=4.4.3')
license=('GPL')
provides=('pyqt4')
replaces=('pyqt4')
conflicts=('pyqt4')
pkgurl="http://www.riverbankcomputing.com/Downloads/PyQt4/GPL/"
source=(http://riverbankcomputing.com/static/Downloads/PyQt4/PyQt-x11-gpl-$pkgver.tar.gz)

md5sums=('89e84c36a8520bf8b3a8a2b20e765154')

build() {
  cd ${startdir}/src/PyQt-x11-gpl-${pkgver}

  echo yes | python configure.py -b /usr/bin \
  -d /usr/lib/python2.6/site-packages \
  -v /usr/share/sip

  make || return 1
  make DESTDIR=${startdir}/pkg install
} 
