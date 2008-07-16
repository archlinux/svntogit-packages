# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: riai <riai@bigfoot.com> Ben <ben@benmazer.net>

pkgname=pyqt
pkgver=4.4.2
pkgrel=1
pkgdesc="PyQt is a set of Python bindings for the Qt toolkit."
arch=(i686 x86_64)
url="http://riverbankcomputing.co.uk/pyqt/"
depends=('sip>=4.7.6' 'qscintilla>=2.2' 'qt>=4.4.0')
license=('GPL')
provides=('pyqt4')
replaces=('pyqt4')
conflicts=('pyqt4')
pkgurl="http://www.riverbankcomputing.com/Downloads/PyQt4/GPL/"
source=(http://riverbankcomputing.com/static/Downloads/PyQt4/PyQt-x11-gpl-$pkgver.tar.gz)

md5sums=('a3f1e828fe74242441f17020c10ba06b')

build() {
  cd ${startdir}/src/PyQt-x11-gpl-${pkgver}

  echo yes | python configure.py -b /usr/bin \
  -d /usr/lib/python2.5/site-packages \
  -v /usr/share/sip

  make || return 1
  make DESTDIR=${startdir}/pkg install
} 
