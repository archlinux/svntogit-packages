# $Id: PKGBUILD 240297 2015-06-03 10:22:03Z fyan $
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt5-webengine
_qtver=5.9.0
pkgver=${_qtver/-/}
pkgrel=1
arch=('i686' 'x86_64')
url='http://qt-project.org/'
license=('LGPL3' 'LGPL2.1' 'BSD')
pkgdesc='Provides support for web applications using the Chromium browser project'
depends=('qt5-webchannel' 'qt5-location' 'libxcomposite' 'libxrandr' 'pciutils' 'libxss' 'libvpx' 
         'libevent' 'libsrtp' 'snappy' 'nss' 'protobuf' 'libxslt' 'libxdamage' 'minizip' 'ffmpeg')
         # namcap note: libxdamage is needed for nvidia users
makedepends=('python2' 'git' 'gperf' 'jsoncpp' 'ninja')
groups=('qt' 'qt5')
_pkgfqn="${pkgname/5-/}-opensource-src-${_qtver}"
source=("http://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz")
sha256sums=('2ed4a579b0fc89c586ed84f131f8c64f6fb70f3126711138ce68f1290ac2b820')

prepare() {
  mkdir -p build

  # Hack to force using python2
  mkdir -p bin
  ln -s /usr/bin/python2 bin/python
}

build() {
  cd build

  export PATH="$srcdir/bin:$PATH"
  qmake CONFIG+="proprietary-codecs" WEBENGINE_CONFIG+="use_proprietary_codecs use_system_ffmpeg" ../${_pkgfqn}
  make
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  install -Dm644 "$srcdir"/${_pkgfqn}/src/3rdparty/chromium/LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE.chromium
}
