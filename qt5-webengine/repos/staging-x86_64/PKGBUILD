# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt5-webengine
_qtver=5.13.2
pkgver=${_qtver/-/}
pkgrel=1
arch=('x86_64')
url='https://www.qt.io'
license=('LGPL3' 'LGPL2.1' 'BSD')
pkgdesc='Provides support for web applications using the Chromium browser project'
depends=('qt5-webchannel' 'qt5-location' 'libxcomposite' 'libxrandr' 'pciutils' 'libxss' 
         'libevent' 'snappy' 'nss' 'libxslt' 'minizip' 'ffmpeg' 're2' 'libvpx')
makedepends=('python2' 'gperf' 'jsoncpp' 'ninja' 'qt5-tools' 'poppler')
groups=('qt' 'qt5')
_pkgfqn="${pkgname/5-/}-everywhere-src-${_qtver}"
source=("https://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz")
sha256sums=('adcf56b5de6f34744bba2307b696fc75611884f4270e87dfa760d6e99dd711bb')

prepare() {
  mkdir -p build
}

build() {
  cd build

  qmake ../${_pkgfqn} -- \
    -proprietary-codecs \
    -system-ffmpeg \
    -webp \
    -spellchecker \
    -webengine-icu
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
