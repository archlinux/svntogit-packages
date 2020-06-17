# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt5-webengine
_qtver=5.15.0
pkgver=${_qtver/-/}
pkgrel=2
arch=('x86_64')
url='https://www.qt.io'
license=('LGPL3' 'LGPL2.1' 'BSD')
pkgdesc='Provides support for web applications using the Chromium browser project'
depends=('qt5-webchannel' 'qt5-location' 'libxcomposite' 'libxrandr' 'pciutils' 'libxss' 
         'libevent' 'snappy' 'nss' 'libxslt' 'minizip' 'ffmpeg' 're2' 'libvpx' 'krb5' 'ttf-font')
makedepends=('python2' 'gperf' 'jsoncpp' 'ninja' 'qt5-tools' 'poppler')
groups=('qt' 'qt5')
_pkgfqn="${pkgname/5-/}-everywhere-src-${_qtver}"
source=("https://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz"
        icu67.patch
        qt5-webengine-gcc10.patch
        dark-mode-crash.patch::"https://code.qt.io/cgit/qt/qtwebengine-chromium.git/patch/?id=4e8ca195")
sha256sums=('c38e2fda7ed1b7d5a90f26abf231ec0715d78a5bc39a94673d8e39d75f04c5df'
            '5315977307e69d20b3e856d3f8724835b08e02085a4444a5c5cefea83fd7d006'
            '8d73112da8bb95ae9b1c84e403e08563a5dbf3dc02f79cd931e1b0ac15a3be37'
            '7ea054a95045635fcee9ee50a6a28e9aedf182ca97a76cc6dd680fb1a91748e1')

prepare() {
  mkdir -p build

  cd $_pkgfqn
  patch -Np3 -d src/3rdparty/chromium/v8 < ../icu67.patch # Fix build with ICU 67
  cd src/3rdparty/chromium
  patch -p1 -i "$srcdir"/qt5-webengine-gcc10.patch
  patch -p2 -i "$srcdir"/dark-mode-crash.patch # Fix crash in qutebrowser when using dark mode
}

build() {
  cd build
  qmake ../${_pkgfqn} -- \
    -proprietary-codecs \
    -system-ffmpeg \
    -webp \
    -spellchecker \
    -webengine-icu \
    -webengine-kerberos
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
