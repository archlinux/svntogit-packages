# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Daniele Paolella <danielepaolella@email.it>
# Contributor: Philipp Überbacher <hollunder at gmx dot at>
# Contributor: Thomas Bahn <thomas-bahn at gmx dot net>

pkgbase=jack2
pkgname=(jack2 jack2-dbus jack2-docs)
pkgdesc="The JACK low-latency audio server"
pkgver=1.9.21
pkgrel=3
arch=(x86_64)
url="https://github.com/jackaudio/jack2"
license=(GPL2)
makedepends=(alsa-lib db5.3 dbus doxygen expat git libffado libsamplerate opus systemd waf)
# jack breaks when built with LTO: https://github.com/jackaudio/jack2/issues/485
options=(debug !lto)
source=(git+https://github.com/jackaudio/$pkgbase.git#tag=v$pkgver?signed
        bdb_5.3.patch)
validpgpkeys=('62B11043D2F6EB6672D93103CDBAA37ABC74FBA0') # falkTX <falktx@falktx.com>
sha512sums=('SKIP'
            '3d2842899de395e48ef6d4307905fc3633eaac02f4987032594084573991450566b592e30069c19dca4a5cb0b07e1962bbfc7b9cd7c8a174990190147481823f')

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
  cd "${pkgbase}"
  # remove custom waflib, as we are using system provided waf
  (
    touch __init__.py
    rm -rv waflib
  )
  patch -Np1 -i ../bdb_5.3.patch  
}

build() {
  cd $pkgbase
  export CXXFLAGS="$CXXFLAGS -I/usr/include/db5.3"
  export LDFLAGS="$LDFLAGS -ldb-5.3"
  export LINKFLAGS="$LDFLAGS"
  export PYTHONPATH="$PWD:$PYTHONPATH"
  waf configure --prefix=/usr \
                --htmldir=/usr/share/doc/$pkgbase/html \
                --autostart=none \
                --doxygen=yes \
                --systemd-unit \
                --classic \
                --dbus
  waf build
}

package_jack2() {
  license+=(LGPL2.1)
  depends=(db5.3 gcc-libs glibc opus libasound.so libdbus-1.so libsamplerate.so
  libsystemd.so )
  optdepends=(
    'a2jmidid: for ALSA MIDI to JACK MIDI bridging'
    'libffado: for firewire support using FFADO'
    'jack-example-tools: for official JACK example-clients and tools'
    'jack2-dbus: for dbus integration'
    'jack2-docs: for developer documentation'
    'realtime-privileges: for realtime privileges'
  )
  conflicts=(jack)
  provides=(jack libjack.so libjacknet.so libjackserver.so)

  cd "${pkgbase}"
  export PYTHONPATH="$PWD:$PYTHONPATH"
  waf install --destdir="$pkgdir"

  ( cd "$pkgdir"

  _pick jack2-dbus usr/bin/jack{dbus,_control}
  _pick jack2-dbus usr/share/dbus-1/services/*
  _pick jack2-docs usr/share/doc/$pkgbase/html
  )
}

package_jack2-dbus() {
  pkgdesc+=" (dbus integration)"
  depends=(gcc-libs glibc jack2 libdbus-1.so libexpat.so libjackserver.so
  python-dbus)

  mv -v jack2-dbus/* "$pkgdir"
}

package_jack2-docs() {
  pkgdesc+=" (documentation)"

  mv -v jack2-docs/* "$pkgdir"
}

# vim:set ts=2 sw=2 et:
