# Maintainer : Tom Gundersen <teg@jklm.no>
# Maintainer : Ionut Biru <ibiru@archlinux.org>

pkgbase=transmission
pkgname=(transmission-cli transmission-gtk transmission-qt)
pkgver=2.94
pkgrel=1
arch=(x86_64)
url="http://www.transmissionbt.com/"
license=(MIT)
makedepends=(gtk3 intltool curl qt5-base libevent systemd qt5-tools)
source=(https://github.com/transmission/transmission-releases/raw/master/transmission-${pkgver}.tar.xz
        transmission-2.90-libsystemd.patch
        transmission-cli.sysusers
        transmission-cli.tmpfiles)
sha256sums=('35442cc849f91f8df982c3d0d479d650c6ca19310a994eccdaa79a4af3916b7d'
            '9f8f4bb532e0e46776dbd90e75557364f495ec95896ee35900ea222d69bda411'
            '641310fb0590d40e00bea1b5b9c843953ab78edf019109f276be9c6a7bdaf5b2'
            '1266032bb07e47d6bcdc7dabd74df2557cc466c33bf983a5881316a4cc098451')

prepare() {
  cd $pkgbase-$pkgver
  patch -p1 -i "$srcdir/transmission-2.90-libsystemd.patch"

  rm -f m4/glib-gettext.m4
  autoreconf -fi

  sed -i '/^Icon=/ s/$/-qt/' qt/transmission-qt.desktop
}

build() {
  cd $pkgbase-$pkgver
  ./configure --prefix=/usr
  make

  cd qt
  qmake qtr.pro \
    DEFINES+=TRANSLATIONS_DIR=\\\\\\\"/usr/share/transmission-qt/translations\\\\\\\"
  make
  lrelease translations/*.ts
}

package_transmission-cli() {
  pkgdesc='Fast, easy, and free BitTorrent client (CLI tools, daemon and web client)'
  depends=(curl libevent systemd)

  cd $pkgbase-$pkgver

  for dir in daemon cli web utils; do
    make -C "$dir" DESTDIR="$pkgdir" install
  done

  install -Dm644 daemon/transmission-daemon.service \
    "$pkgdir/usr/lib/systemd/system/transmission.service"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/transmission-cli/COPYING"

  install -Dm644 "$srcdir/$pkgname.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/transmission.conf"
  install -Dm644 "$srcdir/$pkgname.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/transmission.conf"
}

package_transmission-gtk() {
  pkgdesc='Fast, easy, and free BitTorrent client (GTK+ GUI)'
  depends=(curl libevent gtk3 desktop-file-utils hicolor-icon-theme)
  optdepends=('notification-daemon: Desktop notification support'
              'transmission-cli: daemon and web support')

  cd $pkgbase-$pkgver

  make -C gtk DESTDIR="$pkgdir" install
  make -C po DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/transmission-gtk/COPYING"
}

package_transmission-qt() {
  pkgdesc='Fast, easy, and free BitTorrent client (Qt GUI)'
  depends=(curl qt5-base libevent)
  optdepends=('transmission-cli: daemon and web support')

  cd $pkgbase-$pkgver

  make -C qt INSTALL_ROOT="$pkgdir"/usr install
  install -Dm644 -t "$pkgdir/usr/share/transmission-qt/translations" \
    qt/translations/*.qm

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/transmission-qt/COPYING"
  install -Dm644 qt/icons/transmission.png \
    "$pkgdir/usr/share/pixmaps/transmission-qt.png"
  install -Dm644 qt/transmission-qt.desktop \
    "$pkgdir/usr/share/applications/transmission-qt.desktop"
}
