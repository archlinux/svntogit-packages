# Maintainer : Tom Gundersen <teg@jklm.no>
# Maintainer : Ionut Biru <ibiru@archlinux.org>

pkgbase=transmission
pkgname=(transmission-cli transmission-gtk transmission-qt libtransmission)
pkgver=3.00
pkgrel=3
arch=(x86_64)
url="http://www.transmissionbt.com/"
license=(MIT)
makedepends=(gtk3 intltool curl qt5-base libevent systemd qt5-tools libappindicator-gtk3 dht libb64 libutp miniupnpc libnatpmp)
source=(https://github.com/transmission/transmission-releases/raw/master/transmission-${pkgver}.tar.xz
        transmission-cli.sysusers
        transmission-cli.tmpfiles)
sha256sums=('9144652fe742f7f7dd6657716e378da60b751aaeda8bef8344b3eefc4db255f2'
            '641310fb0590d40e00bea1b5b9c843953ab78edf019109f276be9c6a7bdaf5b2'
            '1266032bb07e47d6bcdc7dabd74df2557cc466c33bf983a5881316a4cc098451')

prepare() {
  cd $pkgbase-$pkgver

# Fix build with autoconf 2.70
  sed -i 's/\[IT_PROG_INTLTOOL(\[/[\nIT_PROG_INTLTOOL(\[/' configure.ac
  rm -f m4/glib-gettext.m4
  autoreconf -fi

  sed -i '/^Icon=/ s/$/-qt/' qt/transmission-qt.desktop
}

build() {
  export CFLAGS+=" -ffat-lto-objects"
  cd $pkgbase-$pkgver
  ./configure --prefix=/usr \
    --enable-external-dht \
    --enable-external-b64 \
    --enable-external-natpmp
  make

  cd qt
  qmake qtr.pro \
    DEFINES+=TRANSLATIONS_DIR=\\\\\\\"/usr/share/transmission-qt/translations\\\\\\\"
  make
  lrelease translations/*.ts
}

package_transmission-cli() {
  pkgdesc='Fast, easy, and free BitTorrent client (CLI tools, daemon and web client)'
  depends=(curl libevent systemd libb64 miniupnpc libnatpmp)

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
  depends=(curl libevent gtk3 hicolor-icon-theme libappindicator-gtk3 libb64 miniupnpc libnatpmp)
  optdepends=('libnotify: Desktop notification support'
              'transmission-cli: daemon and web support')

  cd $pkgbase-$pkgver

  make -C gtk DESTDIR="$pkgdir" install
  make -C po DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/transmission-gtk/COPYING"
}

package_transmission-qt() {
  pkgdesc='Fast, easy, and free BitTorrent client (Qt GUI)'
  depends=(curl qt5-base libevent libb64 miniupnpc libnatpmp)
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

package_libtransmission() {
  pkgdesc='Fast, easy, and free BitTorrent client (shared library)'

  cd $pkgbase-$pkgver
  install -Dm644 libtransmission/libtransmission.a -t "$pkgdir"/usr/lib
  install -Dm644 libtransmission/*.h -t "$pkgdir"/usr/include/transmission
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/libtransmission/COPYING"
}
