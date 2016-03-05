# $Id: PKGBUILD 240297 2015-06-03 10:22:03Z fyan $
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt5-webengine
_qtver=5.6.0-rc
pkgver=${_qtver/-/}
pkgrel=2
arch=('i686' 'x86_64')
url='http://qt-project.org/'
license=('GPL3' 'LGPL' 'FDL' 'custom')
pkgdesc='Provides support for web applications using the Chromium browser project'
depends=('qt5-webchannel' 'libxcomposite' 'libxrandr' 'libxtst' 'libxcursor' 'libpulse' 'pciutils' 'libxss' 'libvpx' 'opus'
         'libevent' 'libsrtp' 'jsoncpp' 'libwebp' 'snappy' 'minizip' 'nss' 'libxml2' 'libxslt')
makedepends=('python2' 'git' 'gperf')
conflicts=('qt')
groups=('qt' 'qt5')
_pkgfqn="${pkgname/5-/}-opensource-src-${_qtver}"
source=("http://download.qt.io/development_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz" qt5-webengine-nss.patch)
md5sums=('af563195bc61e878e8de45658a1bd745'
         '26f5e1e96be524ccad564dc2fdb9766c')

prepare() {
  mkdir -p build

  # Hack to force using python2
  mkdir -p bin
  ln -s /usr/bin/python2 bin/python

  # Fix opening some websites with recent NSS https://github.com/QupZilla/qupzilla/issues/1870 (KaOSx patch)
  cd ${_pkgfqn}
  patch -p1 -i ../qt5-webengine-nss.patch
}

build() {
  cd build

  export PATH="$srcdir/bin:$PATH"
  qmake WEBENGINE_CONFIG+=use_proprietary_codecs ../${_pkgfqn}
  make
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  install -d "$pkgdir"/usr/share/licenses
  ln -s /usr/share/licenses/qt5-base "$pkgdir"/usr/share/licenses/${pkgname}
}
