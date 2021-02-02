# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt5-webengine
_qtver=5.15.2
pkgver=${_qtver/-/}
pkgrel=4
arch=('x86_64')
url='https://www.qt.io'
license=('LGPL3' 'LGPL2.1' 'BSD')
pkgdesc='Provides support for web applications using the Chromium browser project'
depends=('qt5-webchannel' 'qt5-location' 'libxcomposite' 'libxrandr' 'pciutils' 'libxss' 
         'libevent' 'snappy' 'nss' 'libxslt' 'minizip' 'ffmpeg' 're2' 'libvpx' 'krb5' 'ttf-font')
makedepends=('python2' 'gperf' 'jsoncpp' 'ninja' 'qt5-tools' 'poppler' 'libpipewire02' 'nodejs' 'libxtst')
optdepends=('libpipewire02: WebRTC desktop sharing under Wayland')
groups=('qt' 'qt5')
_pkgfqn="${pkgname/5-/}-everywhere-src-${_qtver}"
source=("https://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz"
         qt5-webengine-icu-68.patch::"https://code.qt.io/cgit/qt/qtwebengine-chromium.git/patch/?id=9236b21c")
sha256sums=('c8afca0e43d84f7bd595436fbe4d13a5bbdb81ec5104d605085d07545b6f91e0'
            'e3364f29db7a1630e9959123b34e6bcd25ba66cd1714638b8b9b6fd6fd527539')

prepare() {
  mkdir -p build

# Disable jumbo build https://bugreports.qt.io/browse/QTBUG-88657
  sed -i 's|use_jumbo_build=true|use_jumbo_build=false|' -i ${_pkgfqn}/src/buildtools/config/common.pri

  patch -d $_pkgfqn/src/3rdparty/ -p1 -i "$srcdir"/qt5-webengine-icu-68.patch # Fix build with ICU 68
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
