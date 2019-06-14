# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt5-webengine
_qtver=5.12.4
pkgver=${_qtver/-/}
pkgrel=1
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
         qtwebengine-harmony.patch qtwebengine-glibc-2.29.patch)
sha256sums=('fccf5c945412c19c3805323211b504ac8becbf191c638a2dc85ec91abfb1b331'
            'feca54ab09ac0fc9d0626770a6b899a6ac5a12173c7d0c1005bc3964ec83e7b3'
            'dd791f154b48e69cd47fd94753c45448655b529590995fd71ac1591c53a3d60c')

prepare() {
  mkdir -p build

  # Hack to force using python2
  mkdir -p bin
  ln -s /usr/bin/python2 bin/python

  cd ${_pkgfqn}

  # FreeType 2.8.1
  patch -Np1 -i ../qtwebengine-harmony.patch

  cd src/3rdparty/chromium
  patch -p1 -i "$srcdir"/qtwebengine-glibc-2.29.patch # Fix PPAPI plugins with glibc 2.29
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
