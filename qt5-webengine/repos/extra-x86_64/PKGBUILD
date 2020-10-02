# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt5-webengine
_qtver=5.15.1
pkgver=${_qtver/-/}
pkgrel=3
arch=('x86_64')
url='https://www.qt.io'
license=('LGPL3' 'LGPL2.1' 'BSD')
pkgdesc='Provides support for web applications using the Chromium browser project'
depends=('qt5-webchannel' 'qt5-location' 'libxcomposite' 'libxrandr' 'pciutils' 'libxss' 
         'libevent' 'snappy' 'nss' 'libxslt' 'minizip' 'ffmpeg' 're2' 'libvpx' 'krb5' 'ttf-font')
makedepends=('python2' 'gperf' 'jsoncpp' 'ninja' 'qt5-tools' 'poppler' 'libpipewire02' 'nodejs')
optdepends=('libpipewire02: WebRTC desktop sharing under Wayland')
groups=('qt' 'qt5')
_pkgfqn="${pkgname/5-/}-everywhere-src-${_qtver}"
source=("https://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz"
         qtbug-86752.patch::"https://code.qt.io/cgit/qt/qtwebengine-chromium.git/patch/?id=4e828b3b")
sha256sums=('f903e98fe3cd717161252710125fce011cf882ced96c24968b0c38811fbefdf2'
            'b9fde4d76a031c4bdba19b628ff9435647f54915546d977869568093f361d1b9')

prepare() {
  mkdir -p build

  patch -d $_pkgfqn/src/3rdparty -p1 -i "$srcdir"/qtbug-86752.patch # https://bugreports.qt.io/browse/QTBUG-86752
}

build() {
  cd build
  qmake ../${_pkgfqn} -- \
    -proprietary-codecs \
    -system-ffmpeg \
    -webp \
    -spellchecker \
    -webengine-icu \
    -webengine-kerberos \
    -webengine-webrtc-pipewire
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
