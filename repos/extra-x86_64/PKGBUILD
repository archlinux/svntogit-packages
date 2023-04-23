# Contributor : Tom Gundersen <teg@jklm.no>
# Contributor : Ionut Biru <ibiru@archlinux.org>
# Contributor : Thomas Weißschuh <thomas t-8ch de>
# Contributor : Florian Pritz <bluewind@xinu.at>

pkgbase=transmission
pkgname=(transmission-cli transmission-gtk transmission-qt libtransmission)
pkgver=4.0.3
pkgrel=1
arch=(x86_64)
url="http://www.transmissionbt.com/"
license=(GPL)
makedepends=(
	cmake
	curl
	dht
	glibmm-2.68
	gtk4
	gtkmm-4.0
	intltool
	libb64
	libdeflate
	libevent
	libnatpmp
	miniupnpc
	ninja
	npm
	qt6-base
	qt6-svg
	qt6-tools
	systemd
)
source=(https://github.com/transmission/transmission/releases/download/$pkgver/transmission-$pkgver.tar.xz
        transmission-cli.sysusers
        transmission-cli.tmpfiles)
sha256sums=('b6b01fd58e42bb14f7aba0253db932ced050fcd2bba5d9f8469d77ddd8ad545a'
            '641310fb0590d40e00bea1b5b9c843953ab78edf019109f276be9c6a7bdaf5b2'
            '1266032bb07e47d6bcdc7dabd74df2557cc466c33bf983a5881316a4cc098451')

build() {
  export CFLAGS+=" -ffat-lto-objects"
  cd $pkgbase-$pkgver

  cmake -G Ninja -DCMAKE_BUILD_TYPE=RelWithDebInfo \
	  -DCMAKE_INSTALL_PREFIX=/usr \
	  -DENABLE_CLI=ON \
	  -DENABLE_DAEMON=ON \
	  -DENABLE_GTK=ON \
	  -DENABLE_MAC=OFF \
	  -DENABLE_QT=ON \
	  -DREBUILD_WEB=ON \
	  -DENABLE_TESTS=ON \
	  -DENABLE_UTILS=ON \
	  -DENABLE_UTP=ON \
	  -DINSTALL_LIB=ON \
      -DUSE_SYSTEM_B64=ON \
      -DUSE_SYSTEM_DEFLATE=ON \
      -DUSE_SYSTEM_DHT=ON \
	  -DUSE_SYSTEM_EVENT2=ON \
      -DUSE_SYSTEM_MINIUPNPC=ON \
      -DUSE_SYSTEM_NATPMP=ON \
      -DUSE_SYSTEM_PSL=ON \
      -DUSE_SYSTEM_UTP=OFF \
	  -DWITH_CRYPTO=openssl \
	  -S . -B build

  cmake --build build --config Release
}

check() {
  cd $pkgbase-$pkgver

  cd build
  ctest --output-on-failure -j "$(nproc)"
}

_install_component() {
  (cd $srcdir/$pkgbase-$pkgver/build; DESTDIR="$pkgdir" ninja $1/install)
}

package_transmission-cli() {
  pkgdesc='Fast, easy, and free BitTorrent client (CLI tools, daemon and web client)'
  depends=(curl libevent systemd libb64 miniupnpc libnatpmp libdeflate)

  cd $pkgbase-$pkgver

  for dir in daemon cli web utils; do
    _install_component $dir
  done

  install -d "$pkgdir"/usr/share/transmission
  cp -a build/web/public_html/ "$pkgdir"/usr/share/transmission

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
  depends=(curl libevent gtk4 hicolor-icon-theme libb64 miniupnpc libnatpmp libdeflate gtkmm-4.0)
  optdepends=('libnotify: Desktop notification support'
              'transmission-cli: daemon and web support')

  cd $pkgbase-$pkgver

  _install_component gtk
  _install_component po

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/transmission-gtk/COPYING"
}

package_transmission-qt() {
  pkgdesc='Fast, easy, and free BitTorrent client (Qt GUI)'
  depends=(curl qt6-base qt6-svg libevent libb64 miniupnpc libnatpmp libdeflate)
  optdepends=('transmission-cli: daemon and web support')

  cd $pkgbase-$pkgver

  _install_component qt

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/transmission-qt/COPYING"
}

package_libtransmission() {
  pkgdesc='Fast, easy, and free BitTorrent client (shared library)'

  cd $pkgbase-$pkgver

  install -Dm644 build/libtransmission/libtransmission.a -t "$pkgdir"/usr/lib
  install -Dm644 libtransmission/*.h -t "$pkgdir"/usr/include/transmission
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/libtransmission/COPYING"
}
