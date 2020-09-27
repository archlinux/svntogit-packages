# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=polkit
pkgver=0.118
pkgrel=1
pkgdesc="Application development toolkit for controlling system-wide privileges"
arch=(x86_64)
license=(LGPL)
url="https://www.freedesktop.org/wiki/Software/polkit/"
depends=(glib2 pam expat systemd js78)
makedepends=(intltool gtk-doc gobject-introspection git autoconf-archive)
backup=(etc/pam.d/polkit-1)
_commit=ff4c2144f0fb1325275887d9e254117fcd8a1b52
source=("git+https://gitlab.freedesktop.org/polkit/polkit.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname

  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --libexecdir=/usr/lib \
      --enable-libsystemd-login=yes --disable-static \
      --enable-gtk-doc --with-os-type=redhat

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

check() {
  cd $pkgname
  make -k check || :
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install \
      dbusconfdir=/usr/share/dbus-1/system.d \
      rulesdir=/usr/share/polkit-1/rules.d

  install -d -o root -g 102 -m 750 "$pkgdir"/{etc,usr/share}/polkit-1/rules.d

  install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf" <<END
u polkitd 102 "PolicyKit daemon"
m polkitd proc
END
}

# vim: ts=2 sw=2 et:
