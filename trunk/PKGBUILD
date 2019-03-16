# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gstreamer
pkgver=1.14.4+11+g39de78c99
pkgrel=1
pkgdesc="GStreamer open-source multimedia framework core library"
url="https://gstreamer.freedesktop.org/"
arch=(x86_64)
license=(LGPL)
depends=(libxml2 glib2 libunwind libcap libelf)
makedepends=(gtk-doc gobject-introspection autoconf-archive git valgrind bash-completion)
checkdepends=(gmp gsl gtk3)
_commit=39de78c996595960654766c4604f91521aa1dac9  # 1.14
install=gstreamer.install
source=("git+https://gitlab.freedesktop.org/gstreamer/gstreamer.git#commit=$_commit"
        "gst-common::git+https://gitlab.freedesktop.org/gstreamer/common.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname

  # Fix tests with glib 2.60
  git cherry-pick -n 4a7739f4b6442814696bbd0706ab9a1ce1462d80

  git submodule init
  git config --local submodule.common.url "$srcdir/gst-common"
  git submodule update

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib \
    --with-package-name="GStreamer (Arch Linux)" \
    --with-package-origin="https://www.archlinux.org/" \
    --enable-gtk-doc \
    --disable-static
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd $pkgname
  make check
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
