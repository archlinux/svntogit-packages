# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Daniele Paolella <danielepaolella@email.it>
# Contributor: Philipp Überbacher <hollunder at gmx dot at>
# Contributor: Thomas Bahn <thomas-bahn at gmx dot net>

pkgbase=jack2
pkgname=(jack2 jack2-dbus jack2-docs)
pkgdesc="The JACK low-latency audio server"
pkgver=1.9.22
_commit=80149e552b56d6d57d754dc04d119b8170d27313  # refs/tags/v1.9.22
pkgrel=1
arch=(x86_64)
url="https://github.com/jackaudio/jack2"
license=(GPL2)
makedepends=(alsa-lib db5.3 dbus doxygen expat git libffado libsamplerate opus systemd waf)
# jack breaks when built with LTO: https://github.com/jackaudio/jack2/issues/485
options=(!lto)
source=(
  git+$url#tag=$_commit?signed
  $pkgbase-1.9.22-db-5.3.patch
)
validpgpkeys=('62B11043D2F6EB6672D93103CDBAA37ABC74FBA0') # falkTX <falktx@falktx.com>
sha512sums=('SKIP'
            'f5a5abaf6a0c0a7326b60b8bfe2eff84251d27037cfec7e6dc3194c7ceb296290779fdb26dca188cfbcf49f0a8a62707506584a1f7b0ed36c39f8a794154c4eb')

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
  patch -Np1 -d $pkgbase -i ../$pkgbase-1.9.22-db-5.3.patch

  # remove custom waflib, as we are using system provided waf
  rm -rv $pkgbase/waflib
}

build() {
  local waf_options=(
    --prefix=/usr
    --htmldir=/usr/share/doc/$pkgbase/html
    --autostart=none
    --doxygen=yes
    --systemd-unit
    --classic
    --dbus
  )

  cd $pkgbase
  export CXXFLAGS="$CXXFLAGS -I/usr/include/db5.3"
  export LDFLAGS="$LDFLAGS -ldb-5.3"
  export LINKFLAGS="$LDFLAGS"
  export PYTHONPATH="$PWD:$PYTHONPATH"
  waf configure "${waf_options[@]}"
  waf build
}

package_jack2() {
  license+=(LGPL2.1)
  depends=(
    alsa-lib libasound.so
    db5.3
    dbus libdbus-1.so
    gcc-libs
    glibc
    libsamplerate libsamplerate.so
    opus libopus.so
    systemd-libs libsystemd.so
  )
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

  cd $pkgbase
  export PYTHONPATH="$PWD:$PYTHONPATH"
  waf install --destdir="$pkgdir"

  (
    cd $pkgdir

    _pick jack2-dbus usr/bin/jack{dbus,_control}
    _pick jack2-dbus usr/share/dbus-1/services/*
    _pick jack2-docs usr/share/doc/$pkgbase/html
  )
}

package_jack2-dbus() {
  pkgdesc+=" (dbus integration)"
  depends=(
    dbus libdbus-1.so
    expat libexpat.so
    gcc-libs
    glibc
    jack2 libjackserver.so
    python-dbus
  )

  mv -v jack2-dbus/* "$pkgdir"
}

package_jack2-docs() {
  pkgdesc+=" (documentation)"

  mv -v jack2-docs/* "$pkgdir"
}

# vim:set ts=2 sw=2 et:
