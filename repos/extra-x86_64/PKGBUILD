# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt5-webengine
_qtver=5.12.1
pkgver=${_qtver/-/}
pkgrel=3
arch=('x86_64')
url='https://www.qt.io'
license=('LGPL3' 'LGPL2.1' 'BSD')
pkgdesc='Provides support for web applications using the Chromium browser project'
depends=('qt5-webchannel' 'qt5-location' 'libxcomposite' 'libxrandr' 'pciutils' 'libxss' 
         'libevent' 'snappy' 'nss' 'libxslt' 'minizip' 'ffmpeg' 're2' 'libvpx')
makedepends=('python2' 'git' 'gperf' 'jsoncpp' 'ninja' 'qt5-tools' 'poppler')
groups=('qt' 'qt5')
_pkgfqn="${pkgname/5-/}-everywhere-src-${_qtver}"
source=("https://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz"
         qtwebengine-harmony.patch
         CVE-2019-5786.patch::"http://code.qt.io/cgit/qt/qtwebengine-chromium.git/patch/?id=43316b15")
sha256sums=('43e91e06bc4a60ef0f91d15ae06425cf9c6b4f7dafe960259a5b013c687c3bd0'
            'feca54ab09ac0fc9d0626770a6b899a6ac5a12173c7d0c1005bc3964ec83e7b3'
            'd8434d27ac0dd8c4d49b0208fc2df91611440d3ee733bb8597212980f98d4b1b')

prepare() {
  mkdir -p build

  # Hack to force using python2
  mkdir -p bin
  ln -s /usr/bin/python2 bin/python

  cd ${_pkgfqn}

  # FreeType 2.8.1
  patch -Np1 -i ../qtwebengine-harmony.patch
  
  cd src/3rdparty
  patch -p1 -i "$srcdir"/CVE-2019-5786.patch # https://bugreports.qt.io/browse/QTBUG-74254
}

build() {
  cd build

  export PATH="$srcdir/bin:$PATH"
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
