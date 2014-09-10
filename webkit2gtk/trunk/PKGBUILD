# $Id: PKGBUILD 220846 2014-08-31 19:25:05Z heftig $
# Maintainer: Andreas Radke <andyrtr@archlinux.org>

pkgname=webkit2gtk
pkgver=2.5.3
pkgrel=1
pkgdesc="GTK+ Web content engine library"
arch=(i686 x86_64)
url="http://webkitgtk.org/"
license=(custom)
depends=(libxt libxslt sqlite libsoup enchant libgl geoclue2 gst-plugins-base-libs
         libsecret libwebp harfbuzz-icu gtk3)
makedepends=(gtk3 gtk2 gperf gobject-introspection python2 mesa ruby gtk-doc cmake python)
optdepends=('gtk2: Netscape plugin support'
            'gst-plugins-base: free media decoding'
            'gst-plugins-good: media decoding'
            'gst-libav: nonfree media decoding')
options=(!emptydirs)
source=(http://webkitgtk.org/releases/webkitgtk-${pkgver}.tar.xz
        webkitgtk-2.5.3-toggle-buttons.patch
        fix-pretty-quotes.patch)
sha256sums=('010803e371ac92a3e0e297e929978f83a9a3c597e4a10d50363fb1aaa6ea18d6'
            'f034e1fc5e08da029e5a0542e614176619881bfaa5532f3117d2bd31682c2c23'
            '56316228bbbf0b7ebcbe210a35120f4e72cb9c1b680dd82cc2bde0f4549245e6')

prepare() {
  mkdir build

  cd webkitgtk-$pkgver
  patch -Np1 -i ../webkitgtk-2.5.3-toggle-buttons.patch
  patch -Np0 -i ../fix-pretty-quotes.patch
  rm -rf Source/ThirdParty/leveldb/
  rm -rf Source/ThirdParty/gtest/
  rm -rf Source/ThirdParty/qunit/
}

build() (
  cd build
  cmake -DPORT=GTK -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_SKIP_RPATH=ON -DCMAKE_INSTALL_PREFIX=/usr \
        -DLIB_INSTALL_DIR=/usr/lib -DLIBEXEC_INSTALL_DIR=/usr/lib/webkit2gtk-4.0 \
        ../webkitgtk-$pkgver
  make
)

package() {
  cd build
  make DESTDIR="$pkgdir" install

  install -m755 -d "$pkgdir/usr/share/licenses/webkit2gtk"
  cd "$srcdir/webkitgtk-$pkgver/Source"
  for f in $(find -name 'COPYING*' -or -name 'LICENSE*'); do
    echo $f >> "$pkgdir/usr/share/licenses/webkit2gtk/LICENSE"
    cat $f >> "$pkgdir/usr/share/licenses/webkit2gtk/LICENSE"
    echo "" >> "$pkgdir/usr/share/licenses/webkit2gtk/LICENSE"
  done
}
