# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt5-webengine
_qtver=5.15.3
pkgver=${_qtver/-/}
pkgrel=3
_commit=a059e7404a6db799f4da0ad696e65ae9c854b4b0
# Upstream won't tag releases, because potatoes https://lists.qt-project.org/pipermail/interest/2021-March/036386.html
arch=('x86_64')
url='https://www.qt.io'
license=('LGPL3' 'LGPL2.1' 'BSD')
pkgdesc='Provides support for web applications using the Chromium browser project'
depends=('qt5-webchannel' 'qt5-location' 'libxcomposite' 'libxrandr' 'pciutils' 'libxss' 
         'libevent' 'snappy' 'nss' 'libxslt' 'minizip' 'ffmpeg' 're2' 'libvpx' 'libxtst' 'ttf-font')
makedepends=('git' 'python2' 'python' 'gperf' 'jsoncpp' 'ninja' 'qt5-tools' 'poppler' 'libpipewire02' 'nodejs')
optdepends=('libpipewire02: WebRTC desktop sharing under Wayland')
groups=('qt' 'qt5')
_pkgfqn=qtwebengine
source=(git+https://code.qt.io/qt/qtwebengine.git#commit=$_commit
        git+https://code.qt.io/qt/qtwebengine-chromium.git
        v8-call-new-ListFormatter-createInstance.patch
        qt5-webengine-glibc-2.33.patch)
sha256sums=('SKIP'
            'SKIP'
            '44ebcff050a1c849819d66399c14bd711801d0eb64f518d292d3d6efedce3b3a'
            '2294e5390c869963fc58f7bf1ee0a254a3f7fce3ed00c04e34a5f03e2b31b624')

prepare() {
  mkdir -p build

  cd ${_pkgfqn}
  git submodule init
  git submodule set-url src/3rdparty "$srcdir"/qtwebengine-chromium
  git submodule set-branch --branch 87-based src/3rdparty
  git submodule update

  git cherry-pick -n 199ea00a9eea13315a652c62778738629185b059 # Fix crashes with some locales
  patch -p1 -d src/3rdparty/chromium/v8 -i "$srcdir"/v8-call-new-ListFormatter-createInstance.patch # Fix build with ICU 69
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
