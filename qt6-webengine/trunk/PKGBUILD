# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=qt6-webengine
_qtver=6.3.0
pkgver=${_qtver/-/}
pkgrel=1
arch=(x86_64)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='Provides support for web applications using the Chromium browser project'
depends=(qt6-webchannel qt6-positioning libxcomposite libxrandr libxkbfile 
         libevent snappy nss libxslt minizip ffmpeg re2 libvpx libxtst ttf-font pciutils)
makedepends=(cmake ninja python-html5lib gperf jsoncpp qt6-tools pipewire nodejs qt6-websockets)
optdepends=('pipewire: WebRTC desktop sharing under Wayland')
groups=(qt6)
options=(debug)
_pkgfn=${pkgname/6-/}-everywhere-src-$_qtver
source=(https://download.qt.io/official_releases/qt/${pkgver%.*}/$_qtver/submodules/$_pkgfn.tar.xz
        system-icu.patch)
sha256sums=('2001b45dd81dcb7ad1bc6cf1aa32f2eca5367a11fed49656053c75676c4d093d'
            '469ca3f2da107dd28736f827cb20e5658455cb70bd277e101c50f80d00931944')

prepare() {
  patch -d $_pkgfn -p1 < system-icu.patch # Fix build with system ICU
}

build() {
  cmake -B build -S $_pkgfn -G Ninja \
    -DCMAKE_TOOLCHAIN_FILE=/usr/lib/cmake/Qt6/qt.toolchain.cmake \
    -DQT_FEATURE_webengine_system_ffmpeg=ON \
    -DQT_FEATURE_webengine_system_icu=ON \
    -DQT_FEATURE_webengine_system_libevent=ON \
    -DQT_FEATURE_webengine_system_libxslt=ON \
    -DQT_FEATURE_webengine_proprietary_codecs=ON \
    -DQT_FEATURE_webengine_kerberos=ON \
    -DQT_FEATURE_webengine_webrtc_pipewire=ON \
    -DQT_FEATURE_webengine_full_debug_info=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$srcdir"/${_pkgfn}/src/3rdparty/chromium/LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE.chromium
}
