# $Id$
# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgbase=pyqt
pkgname=('pyqt' 'python-qt')
pkgver=4.8.2
pkgrel=2
arch=('i686' 'x86_64')
url="http://riverbankcomputing.co.uk/software/pyqt/intro"
license=('GPL')
makedepends=('python-sip' 'qt' 'phonon' 'qt-assistant-compat')
source=("http://riverbankcomputing.co.uk/static/Downloads/PyQt4/PyQt-x11-gpl-${pkgver}.tar.gz"
        'fix-stackedwidget-bug.patch')
md5sums=('142a32f126f205a2bd77f6a9910f5333'
        '42cfd44a8ec063cce3e328ddb9892565')

build() {
  cd ${srcdir}/PyQt-x11-gpl-${pkgver}

  # Already fixed upstream
  patch -Np1 -i ${srcdir}/fix-stackedwidget-bug.patch

  python configure.py \
    --confirm-license \
    --qsci-api

  # Thanks Gerardo for the rpath fix
  find -name 'Makefile' | xargs sed -i 's|-Wl,-rpath,/usr/lib||g;s|-Wl,-rpath,.* ||g'

  make
}

package_pyqt(){
  depends=()
  pkgdesc="Python bindings common files"

  cd ${srcdir}/PyQt-x11-gpl-${pkgver}
  install -Dm755 pylupdate/pylupdate4 ${pkgdir}/usr/bin/pylupdate4
  install -Dm755 pyrcc/pyrcc4 ${pkgdir}/usr/bin/pyrcc4
  install -Dm755 pyuic/pyuic4 ${pkgdir}/usr/bin/pyuic4
  install -Dm755 designer/libpythonplugin.so \
    ${pkgdir}/usr/lib/qt/plugins/designer/libpythonplugin.so
  install -Dm644 PyQt4.api ${pkgdir}/usr/share/qt/qsci/api/python/PyQt4.api
}

package_python-qt(){
  pkgdesc="A set of Python 3 bindings for the Qt toolkit"
  depends=('pyqt' 'python-sip' 'qt')
  optdepends=('phonon: enable audio and video in PyQt applications'
	'qscintilla: QScintilla API'
	'qt-assistant-compat: add PyQt online help in Qt Assistant')

  cd ${srcdir}/PyQt-x11-gpl-${pkgver}
  # INSTALL_ROOT is needed for the QtDesigner module, the other Makefiles use DESTDIR
  make DESTDIR="${pkgdir}" INSTALL_ROOT="${pkgdir}" install

  # Provided by pyqt package
  rm ${pkgdir}/usr/bin/{pylupdate4,pyrcc4,pyuic4}
  rm ${pkgdir}/usr/lib/qt/plugins/designer/libpythonplugin.so
  rm ${pkgdir}/usr/share/qt/qsci/api/python/PyQt4.api
}
