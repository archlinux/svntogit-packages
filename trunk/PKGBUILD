# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Nikolay Rysev <mad.f3ka@gmail.com>

pkgname=fprintd
pkgver=0.8.1
pkgrel=2
pkgdesc="D-Bus service to access fingerprint readers"
arch=(x86_64)
url="https://www.freedesktop.org/wiki/Software/fprint/fprintd"
license=(GPL)
depends=(libfprint dbus-glib polkit)
makedepends=(intltool gtk-doc gnome-common git)
groups=(fprint)
_commit=9e32cd525724f21eebf2336a06b13a39c6616ab0  # tags/V_0_8_1^0
source=("git+https://gitlab.freedesktop.org/libfprint/fprintd.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^V_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --enable-gtk-doc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" dbus_confdir=/usr/share/dbus-1/system.d install
  install -d -m 700 "$pkgdir/var/lib/fprint"
}
