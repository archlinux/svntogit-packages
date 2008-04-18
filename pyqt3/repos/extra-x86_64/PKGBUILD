# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: riai <riai@bigfoot.com> Ben <ben@benmazer.net>

pkgname=pyqt3
pkgver=3.17.4
pkgrel=1
pkgdesc="PyQt is a set of Python bindings for the Qt toolkit."
arch=(i686 x86_64)
url="http://riverbankcomputing.co.uk/pyqt/"
depends=('sip>=4.5.2-2' 'qscintilla-qt3>=1.7.1' 'qt3>=3.3.7')
license=('GPL')
pkgurl="http://www.riverbankcomputing.com/Downloads/PyQt3/GPL/"
source=($pkgurl/PyQt-x11-gpl-${pkgver}.tar.gz)

build() {
  cd ${startdir}/src/PyQt-x11-gpl-${pkgver}

  . /etc/profile.d/qt3.sh

  echo yes | python configure.py -b /usr/bin \
  -d /usr/lib/python2.5/site-packages \
  -v /usr/share/sip

  make || return 1
  make DESTDIR=${startdir}/pkg install
} 
