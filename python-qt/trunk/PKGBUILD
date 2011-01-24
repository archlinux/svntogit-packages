# $Id$
# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=python-qt
pkgver=4.8.3
pkgrel=1
arch=('i686' 'x86_64')
url="http://riverbankcomputing.co.uk/software/pyqt/intro"
license=('GPL')
pkgdesc="A set of Python 3 bindings for the Qt toolkit"
depends=('python2-qt' 'python-sip')
optdepends=('phonon: enable audio and video in PyQt applications'
	'qscintilla: QScintilla API'
	'qt-assistant-compat: add PyQt online help in Qt Assistant')
makedepends=('phonon' 'qt-assistant-compat')
source=("http://riverbankcomputing.co.uk/static/Downloads/PyQt4/PyQt-x11-gpl-${pkgver}.tar.gz")
md5sums=('d54fd1c37a74864faf42709c8102f254')

build() {
  cd "${srcdir}/PyQt-x11-gpl-${pkgver}"

  python configure.py \
    --confirm-license \
    --qsci-api

  # Thanks Gerardo for the rpath fix
  find -name 'Makefile' | xargs sed -i 's|-Wl,-rpath,/usr/lib||g;s|-Wl,-rpath,.* ||g'

  make
}

package(){
  cd "${srcdir}/PyQt-x11-gpl-${pkgver}"
  # INSTALL_ROOT is needed for the QtDesigner module, the other Makefiles use DESTDIR
  make DESTDIR="${pkgdir}" INSTALL_ROOT="${pkgdir}" install

  # Provided by python2-qt package
  rm ${pkgdir}/usr/bin/{pylupdate4,pyrcc4,pyuic4}
  rm ${pkgdir}/usr/lib/qt/plugins/designer/libpythonplugin.so
  rm ${pkgdir}/usr/share/qt/qsci/api/python/PyQt4.api
}
