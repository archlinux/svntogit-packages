# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gtk2
pkgver=2.24.33
pkgrel=2
pkgdesc="GObject-based multi-platform GUI toolkit (legacy)"
arch=(x86_64)
url="https://www.gtk.org/"
depends=(atk pango libxcursor libxinerama libxrandr libxi libxcomposite libxdamage
         shared-mime-info cairo libcups gtk-update-icon-cache librsvg desktop-file-utils)
makedepends=(gobject-introspection git gtk-doc)
optdepends=('gnome-themes-standard: Default widget theme'
            'adwaita-icon-theme: Default icon theme'
            'python: gtk-builder-convert')
provides=(libgailutil.so libg{d,t}k-x11-2.0.so)
license=(LGPL)
install=gtk2.install
_commit=68631945733158f164427db84f01301d7e875763  # tags/2.24.33^0
source=("git+https://gitlab.gnome.org/GNOME/gtk.git#commit=$_commit"
        gtkrc
        gtk-query-immodules-2.0.hook
        xid-collision-debug.patch)
sha256sums=('SKIP'
            'bc968e3e4f57e818430130338e5f85a5025e21d7e31a3293b8f5a0e58362b805'
            '427e7ed2626465ea7a8986189b6c8340a0520b9f7b8e2a56cd1169d375da7425'
            '7724a55c4916318ed81b22f21c37c0a66e78adce017563fed6d84d813a4b80bc')

pkgver() {
  cd gtk
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd gtk
  git apply -3 ../xid-collision-debug.patch
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd gtk

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --with-xinput=yes \
    --disable-gtk-doc

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd gtk
  make DESTDIR="$pkgdir" install

  install -Dt "$pkgdir/usr/share/gtk-2.0" -m644 ../gtkrc
  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 ../gtk-query-immodules-2.0.hook

  rm "$pkgdir/usr/bin/gtk-update-icon-cache"
}

# vim:set et sw=2:
