# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgbase=vte3
pkgname=(vte3 vte-common)
pkgver=0.56.3
pkgrel=1
pkgdesc="Virtual Terminal Emulator widget for use with GTK3"
url="https://wiki.gnome.org/Apps/Terminal/VTE"
arch=(x86_64)
license=(LGPL)
options=(!emptydirs)
depends=(gtk3 pcre2 gnutls)
makedepends=(intltool gobject-introspection vala glade git gtk-doc gperf)
_commit=14fac9f56d923cbb23b0c114ddf630fe36c5163c  # tags/0.56.3^0
source=("git+https://gitlab.gnome.org/GNOME/vte.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd vte
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd vte
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd vte

  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/vte \
    --localstatedir=/var --disable-static --enable-introspection --enable-glade-catalogue --enable-gtk-doc

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package_vte3(){
  depends+=(vte-common)

  cd vte
  make DESTDIR="$pkgdir" install

  rm "$pkgdir"/etc/profile.d/vte.sh
}

package_vte-common() {
  pkgdesc="Common files used by vte and vte3"
  depends=(sh)

  cd vte
  install -Dm644 src/vte.sh "$pkgdir"/etc/profile.d/vte.sh
}
