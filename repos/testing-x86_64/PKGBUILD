# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt5-webengine
_qtver=5.13.0
pkgver=${_qtver/-/}
pkgrel=4
arch=('x86_64')
url='https://www.qt.io'
license=('LGPL3' 'LGPL2.1' 'BSD')
pkgdesc='Provides support for web applications using the Chromium browser project'
depends=('qt5-webchannel' 'qt5-location' 'libxcomposite' 'libxrandr' 'pciutils' 'libxss' 
         'libevent' 'snappy' 'nss' 'libxslt' 'minizip' 'ffmpeg' 're2' 'libvpx' 'libpulse')
makedepends=('python2' 'gperf' 'jsoncpp' 'ninja' 'qt5-tools' 'poppler')
groups=('qt' 'qt5')
_pkgfqn="${pkgname/5-/}-everywhere-src-${_qtver}"
source=("https://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz"
        qtwebengine-glibc-2.29.patch
        qtbug-77037-workaround.patch
        qtbug-76913.patch::"https://code.qt.io/cgit/qt/qtwebengine.git/patch/?id=4746bb90"
        qtbug-76958.patch) # "https://code.qt.io/cgit/qt/qtwebengine.git/patch/?id=662de14c"
sha256sums=('e0af82ecee1ab41b6732697f667b98b7b0c53164bebcfaad8070e88b2e064efe'
            'dd791f154b48e69cd47fd94753c45448655b529590995fd71ac1591c53a3d60c'
            '3e3bb8ecf292e7f249d001db4a4a072ca4ba38f713f496122bd7c73d93d5def9'
            '5771af2442d7743ef7c59f0d3716a23985383e2b69ecb4fa9d4ea8e8f7c551fa'
            'eef55340b3ec5f8d1020b7327eda67f86729aaf70107c688deb15083f5ca8fbc')

prepare() {
  mkdir -p build

  cd ${_pkgfqn}
  patch -p1 -i ../qtbug-76913.patch # Fix crashes on media-heavy sites
  patch -p1 -i ../qtbug-76958.patch # Fix crash when loading tabs on the background
  patch -p1 -i ../qtbug-77037-workaround.patch # Link to pulseaudio to avoid header mismatch

  cd src/3rdparty/chromium
  patch -p1 -i "$srcdir"/qtwebengine-glibc-2.29.patch # Fix PPAPI plugins with glibc 2.29
}

build() {
  cd build

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
