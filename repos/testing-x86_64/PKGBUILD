# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt5-webengine
_qtver=5.15.6
pkgver=${_qtver/-/}
pkgrel=2
arch=('x86_64')
url='https://www.qt.io'
license=('LGPL3' 'LGPL2.1' 'BSD')
pkgdesc='Provides support for web applications using the Chromium browser project'
depends=('qt5-webchannel' 'qt5-location' 'libxcomposite' 'libxrandr' 'pciutils' 'libxss' 'libxkbfile' 
         'libevent' 'snappy' 'nss' 'libxslt' 'minizip' 'ffmpeg' 're2' 'libvpx' 'libxtst' 'ttf-font')
makedepends=('git' 'python2' 'python' 'gperf' 'jsoncpp' 'ninja' 'qt5-tools' 'poppler' 'libpipewire02' 'nodejs')
optdepends=('libpipewire02: WebRTC desktop sharing under Wayland')
groups=('qt' 'qt5')
_pkgfqn=qtwebengine
source=(git+https://code.qt.io/qt/qtwebengine.git#tag=v${pkgver}-lts
        git+https://code.qt.io/qt/qtwebengine-chromium.git
        chromium-harfbuzz-3.0.0.patch
        skia-harfbuzz-3.0.0.patch
        qt5-webengine-glibc-2.33.patch)
sha256sums=('SKIP'
            'SKIP'
            '7ce947944a139e66774dfc7249bf7c3069f07f83a0f1b2c1a1b14287a7e15928'
            'dae11dec5088eb1b14045d8c9862801a342609c15701d7c371e1caccf46e1ffd'
            '2294e5390c869963fc58f7bf1ee0a254a3f7fce3ed00c04e34a5f03e2b31b624')

prepare() {
  mkdir -p build

  cd ${_pkgfqn}
  git submodule init
  git submodule set-url src/3rdparty "$srcdir"/qtwebengine-chromium
  git submodule set-branch --branch 87-based src/3rdparty
  git submodule update

  # Fix build with harfbuzz 3.0.0
  patch -p1 -d src/3rdparty/chromium -i "$srcdir"/chromium-harfbuzz-3.0.0.patch
  patch -p1 -d src/3rdparty/chromium/third_party/skia -i "$srcdir"/skia-harfbuzz-3.0.0.patch

  patch -p1 -i "$srcdir"/qt5-webengine-glibc-2.33.patch # Fix text rendering when building with glibc 2.33
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

  # Fix cmake dependency versions
  sed -e "s|$pkgver\ |5.15.2 |" -i "$pkgdir"/usr/lib/cmake/*/*Config.cmake
}
