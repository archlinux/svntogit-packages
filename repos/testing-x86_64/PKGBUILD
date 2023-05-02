# Maintainer: David Runge <dvzrv@archlinux.org>

pkgbase=libcamera
pkgname=(
  libcamera
  libcamera-docs
  libcamera-ipa
  libcamera-tools
  gst-plugin-libcamera
)
pkgver=0.0.5
_commit=5fa37d7623053ef5a693b276986a44d010d057e5  # refs/tags/v0.0.5
pkgrel=1
pkgdesc="A complex camera support library for Linux, Android, and ChromeOS"
arch=(x86_64)
url="https://libcamera.org/"
license=(
  LGPL2.1
  GPL2
)
depends=(glibc)
makedepends=(
  doxygen
  git
  glib2
  graphviz
  gst-plugins-base
  gtest
  libdrm
  libjpeg-turbo
  libtiff
  libyaml
  meson
  python-jinja
  python-ply
  python-sphinx
  python-pyyaml
  qt5-base
  qt5-tools
  sdl2
  systemd
  texlive-core
)
source=(
  git+https://git.libcamera.org/$pkgbase/$pkgbase.git#tag=$_commit
  $pkgbase-0.0.5-sphinx.patch
)
sha512sums=('SKIP'
            '52abec885c0a38c042622bc1bb106f7cefc19e3d8d0b6dcba7c4fadae3ad9303d5ae74447a72abe710598bc2162d57900be54bfe0de18d4c0842160c1c65b35a')
b2sums=('SKIP'
        'e43847222ad644a23761f7f601891971f499552156d8dfd5922732d134e5a09202c6c4fa3880e13c1ae950d34c5a3617ada12fabc06368e3201110ac5455af7f')

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

prepare() {
  cd $pkgbase

  # add version, so that utils/gen-version.sh may rely on it
  printf "%s\n" "$pkgver" > .tarball-version

  # fix use of python-sphinx
  # https://github.com/sphinx-doc/sphinx/pull/11381
  git apply -v ../$pkgbase-0.0.5-sphinx.patch
}

build() {
  local meson_options=(
    -D v4l2=true
    -D tracing=disabled
    -D test=true
  )

  arch-meson $pkgbase build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build || echo "Tests require CLONE_NEWUSER/ CLONE_NEWNET."
}

package_libcamera() {
  depends=(
    gcc-libs
    glibc
    gnutls
    libcamera-ipa
    libelf
    libunwind
    libyaml
    sh
    systemd-libs libudev.so
  )
  optdepends=(
    'gst-plugin-libcamera: GStreamer plugin'
    'libcamera-docs: for documentation'
    'libcamera-tools: for applications'
  )
  provides=(libcamera.so libcamera-base.so)

  meson install -C build --destdir "$pkgdir"

  (
    cd "$pkgdir"
    _pick $pkgbase-docs usr/share/doc
    _pick $pkgbase-ipa usr/lib/libcamera/
    _pick $pkgbase-tools usr/bin/{cam,qcam,lc-compliance}
    _pick gst-plugin-$pkgbase usr/lib/gstreamer-*
  )
}

package_libcamera-docs() {
  pkgdesc+=" - documentation"

  mv -v $pkgname/* "$pkgdir"
  mv -v "$pkgdir/usr/share/doc/$pkgbase-$pkgver/" "$pkgdir/usr/share/doc/$pkgbase/"
  rm -frv "$pkgdir/usr/share/doc/$pkgbase/html/.buildinfo"
}

package_libcamera-ipa() {
  pkgdesc+=" - signed IPA"
  depends=(
    gcc-libs
    glibc
    libcamera libcamera.so libcamera-base.so
  )
  # stripping requires re-signing of IPA libs, so we do it manually
  options=(!strip)

  strip $pkgname/usr/lib/libcamera/*{.so,proxy}
  for _lib in $pkgname/usr/lib/libcamera/*.so; do
    $pkgbase/src/ipa/ipa-sign.sh "$(find build -type f -iname "*ipa-priv-key.pem")" "$_lib" "$_lib.sign"
  done
  mv -v $pkgname/* "$pkgdir"
}

package_libcamera-tools() {
  pkgdesc+=" - tools"
  depends=(
    gcc-libs
    glibc
    gtest
    libcamera libcamera.so libcamera-base.so
    libdrm
    libevent libevent-2.1.so libevent_pthreads-2.1.so
    libjpeg-turbo libjpeg.so
    libtiff libtiff.so
    libyaml
    qt5-base
    sdl2
  )
  conflicts=("$pkgbase-tests<0.0.1-2")
  replaces=("$pkgbase-tests<0.0.1-2")

  mv -v $pkgname/* "$pkgdir"
}

package_gst-plugin-libcamera() {
  pkgdesc="Multimedia graph framework - libcamera plugin"
  depends=(
    gcc-libs
    glibc
    glib2 libg{lib,object}-2.0.so
    gstreamer
    gst-plugins-base-libs
    libcamera libcamera.so libcamera-base.so
  )

  mv -v $pkgname/* "$pkgdir"
}
