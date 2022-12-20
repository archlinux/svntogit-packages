# Maintainer: David Runge <dvzrv@archlinux.org>

pkgbase=libcamera
pkgname=(libcamera libcamera-docs libcamera-tools gst-plugin-libcamera)
pkgver=0.0.3
_commit=3c3f20d05113f5f2abbad233e4c792f84328001a  # refs/tags/v0.0.3
pkgrel=1
pkgdesc="A complex camera support library for Linux, Android, and ChromeOS"
arch=(x86_64)
url="https://libcamera.org/"
license=(LGPL2.1 GPL2)
depends=(glibc)
makedepends=(doxygen git glib2 graphviz gst-plugins-base gtest libdrm
libjpeg-turbo libtiff libyaml meson python-jinja python-ply python-sphinx
python-pyyaml qt5-base qt5-tools sdl2 systemd texlive-core)
options=(debug)
source=(git+https://git.libcamera.org/$pkgname/$pkgname.git#tag=$_commit)
sha256sums=('SKIP')

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
  cd $pkgname
  # add version, so that utils/gen-version.sh may rely on it
  printf "%s\n" "$pkgver" > .tarball-version
}

build() {
  local meson_options=(
    -D v4l2=true
    -D tracing=disabled
    -D test=true
  )

  arch-meson $pkgname build "${meson_options[@]}"
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
    libdrm
    libelf
    libunwind
    libyaml
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

package_libcamera-tools() {
  pkgdesc+=" - tools"
  depends=(
    gcc-libs
    glibc
    gtest
    libcamera libcamera.so libcamera-base.so
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
