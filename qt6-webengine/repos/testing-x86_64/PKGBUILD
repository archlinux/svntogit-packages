# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=qt6-webengine
_qtver=6.2.3
pkgver=${_qtver/-/}
pkgrel=1
arch=(x86_64)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='Provides support for web applications using the Chromium browser project'
depends=(qt6-webchannel qt6-positioning libxcomposite libxrandr pciutils libxss libxkbfile 
         libevent snappy nss libxslt minizip ffmpeg re2 libvpx libxtst ttf-font)
makedepends=(cmake ninja python2 python gperf jsoncpp qt6-tools pipewire nodejs qt6-websockets)
optdepends=('pipewire: WebRTC desktop sharing under Wayland')
groups=(qt6)
_pkgfn="${pkgname/6-/}-everywhere-src-$_qtver"
source=(https://download.qt.io/official_releases/qt/${pkgver%.*}/$_qtver/submodules/$_pkgfn.tar.xz
        qt6-webengine-ffmpeg5.patch)
sha256sums=('a72293b799a91189e12c91480d485d079cbce90b069439acf0bf81847cd02058'
            'c50d3019626183e753c53a997dc8a55938847543aa3178d4c51f377be741c693')

#prepare() {
#  patch -d $_pkgfn/src/3rdparty -p1 < qt6-webengine-ffmpeg5.patch # Fix build with ffmpeg 5
#}

build() {
  cmake -B build -S $_pkgfn -G Ninja \
    -DCMAKE_TOOLCHAIN_FILE=/usr/lib/cmake/Qt6/qt.toolchain.cmake \
    -DQT_FEATURE_webengine_system_ffmpeg=ON \
    -DQT_FEATURE_webengine_system_icu=ON \
    -DQT_FEATURE_webengine_system_libevent=ON \
    -DQT_FEATURE_webengine_proprietary_codecs=ON \
    -DQT_FEATURE_webengine_kerberos=ON \
    -DQT_FEATURE_webengine_webrtc_pipewire=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$srcdir"/${_pkgfn}/src/3rdparty/chromium/LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE.chromium
}
