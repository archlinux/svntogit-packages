# $Id$
# Maintainer:
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: riai <riai@bigfoot.com> Ben <ben@benmazer.net>

pkgbase=pyqt
pkgname=('pyqt' 'python2-pyqt')
pkgver=4.8.6
pkgrel=1
arch=('i686' 'x86_64')
url="http://riverbankcomputing.co.uk/software/pyqt/intro"
license=('GPL')
makedepends=('qt' 'python-sip' 'dbus-python' 'python2-sip' 'phonon'
             'python-opengl' 'qt-assistant-compat')
source=("http://riverbankcomputing.co.uk/static/Downloads/PyQt4/PyQt-x11-gpl-${pkgver}.tar.gz")
md5sums=('9bfd7b08b8e438b83cc50d5c58191f97')

build() {
  cd "${srcdir}"
  cp -r PyQt-x11-gpl-${pkgver} Py2Qt-x11-gpl-${pkgver}

  cd "${srcdir}/PyQt-x11-gpl-${pkgver}"
  python configure.py \
    --confirm-license \
    --qsci-api

  # Thanks Gerardo for the rpath fix
  find -name 'Makefile' | xargs sed -i 's|-Wl,-rpath,/usr/lib||g;s|-Wl,-rpath,.* ||g'

  make

  ### Python2 version ###
  cd "${srcdir}/Py2Qt-x11-gpl-${pkgver}"
  python2 configure.py \
    --confirm-license \
    -v /usr/share/sip \
    --qsci-api

  # Thanks Gerardo for the rpath fix
  find -name 'Makefile' | xargs sed -i 's|-Wl,-rpath,/usr/lib||g;s|-Wl,-rpath,.* ||g'

  make
}

package_pyqt(){
  pkgdesc="A set of Python bindings for the Qt toolkit"
  depends=('qt' 'python-sip' 'qtwebkit')
  optdepends=('phonon: enable audio and video in PyQt applications'
              'qscintilla: QScintilla API'
              'qt-assistant-compat: add PyQt online help in Qt Assistant')
  replaces=('python-qt')
  provides=('python-qt')
  
  cd "${srcdir}/PyQt-x11-gpl-${pkgver}"
  # INSTALL_ROOT is needed for the QtDesigner module, the other Makefiles use DESTDIR
  make DESTDIR="${pkgdir}" INSTALL_ROOT="${pkgdir}" install
}

package_python2-pyqt(){
  pkgdesc="PyQt: A set of Python2 bindings for the Qt toolkit"
  depends=('pyqt' 'python2-sip' 'dbus-python')
  optdepends=('phonon: enable audio and video in PyQt applications'
              'python-opengl: enable OpenGL 3D graphics in PyQt applications'
              'qscintilla: QScintilla API'
              'qt-assistant-compat: add PyQt online help in Qt Assistant')
  replaces=('python2-qt')
  provides=('python2-qt')

  cd "${srcdir}/Py2Qt-x11-gpl-${pkgver}"
  # INSTALL_ROOT is needed for the QtDesigner module, the other Makefiles use DESTDIR
  make DESTDIR="${pkgdir}" INSTALL_ROOT="${pkgdir}" install

  # Provided by pyqt
  rm ${pkgdir}/usr/bin/{pylupdate4,pyrcc4,pyuic4}
  rm ${pkgdir}/usr/lib/qt/plugins/designer/libpythonplugin.so
  rm ${pkgdir}/usr/share/qt/qsci/api/python/PyQt4.api
}
