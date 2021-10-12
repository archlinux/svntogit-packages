# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=qt6-webengine
_qtver=6.2.0
pkgver=${_qtver/-/}
pkgrel=2
arch=(x86_64)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='Provides support for web applications using the Chromium browser project'
depends=(qt6-webchannel qt6-location libxcomposite libxrandr pciutils libxss libxkbfile 
         libevent snappy nss libxslt minizip ffmpeg re2 libvpx libxtst ttf-font)
makedepends=(cmake ninja python2 python gperf jsoncpp qt6-tools pipewire nodejs)
optdepends=('pipewire: WebRTC desktop sharing under Wayland')
groups=(qt6)
_pkgfn="${pkgname/6-/}-everywhere-src-$_qtver"
source=(https://download.qt.io/official_releases/qt/${pkgver%.*}/$_qtver/submodules/$_pkgfn.tar.xz
        chromium-harfbuzz-3.0.0.patch
        skia-harfbuzz-3.0.0.patch)
sha256sums=('c6e530a61bea2e7fbb50308a2b4e7fdb4f7c7b61a28797973270acffc020809d'
            '7ce947944a139e66774dfc7249bf7c3069f07f83a0f1b2c1a1b14287a7e15928'
            'c9ed1dbadaf4be6097e25bc5577b91751799befc2d0376b143e1bd10def5754e')

prepare() {
  cd $_pkgfn

  # Fix build with harfbuzz 3.0.0
  patch -p1 -d src/3rdparty/chromium -i "$srcdir"/chromium-harfbuzz-3.0.0.patch
  patch -p1 -d src/3rdparty/chromium/third_party/skia -i "$srcdir"/skia-harfbuzz-3.0.0.patch
}

build() {
  cmake -B build -S $_pkgfn -G Ninja \
    -DCMAKE_TOOLCHAIN_FILE=/usr/lib/cmake/Qt6/qt.toolchain.cmake \
    -DQT_FEATURE_webengine_system_ffmpeg=ON \
    -DQT_FEATURE_webengine_system_icu=ON \
    -DQT_FEATURE_webengine_proprietary_codecs=ON \
    -DQT_FEATURE_webengine_kerberos=ON \
    -DQT_FEATURE_webengine_webrtc_pipewire=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$srcdir"/${_pkgfn}/src/3rdparty/chromium/LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE.chromium
}
