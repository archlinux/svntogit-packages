# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Daniele Paolella <danielepaolella@email.it>
# Contributor: Philipp Überbacher <hollunder at gmx dot at>
# Contributor: Thomas Bahn <thomas-bahn at gmx dot net>

pkgbase=jack2
pkgname=('jack2' 'jack2-dbus')
pkgdesc="The JACK low-latency audio server"
pkgver=1.9.19
pkgrel=2
arch=('x86_64')
url="https://github.com/jackaudio/jack2"
license=('GPL2' 'LGPL2.1')
makedepends=('alsa-lib' 'celt' 'dbus' 'expat' 'git' 'libffado' 'libsamplerate'
'libsndfile' 'zita-alsa-pcmi' 'zita-resampler' 'readline' 'systemd' 'waf')
source=("${pkgbase}::git+https://github.com/jackaudio/${pkgname}.git#tag=v${pkgver}?signed")
validpgpkeys=('62B11043D2F6EB6672D93103CDBAA37ABC74FBA0') # falkTX <falktx@falktx.com>
sha512sums=('SKIP')

prepare() {
  cd "${pkgbase}"
  # copying relevant custom waf scripts and loading them specifically using
  # wscript
  (
    touch __init__.py
    mkdir -vp tools
    cp -v waflib/extras/xcode*.py tools
    rm -rv waflib
    sed -e "s/load('xcode'/load('xcode', tooldir='tools'/g" \
        -e "s/load('xcode6'/load('xcode6', tooldir='tools'/g" \
        -i wscript
  )
}

build() {
  cd "${pkgbase}"
  export LINKFLAGS="$LDFLAGS"
  export PYTHONPATH="${PWD}:${PYTHONPATH}"
  waf configure --prefix=/usr \
                --htmldir="/usr/share/doc/${pkgbase}/" \
                --autostart=none \
                --systemd-unit \
                --classic \
                --dbus
  waf build
}

package_jack2() {
  depends=('db' 'gcc-libs' 'glibc' 'opus' 'libasound.so' 'libcelt0.so'
  'libdbus-1.so' 'libreadline.so' 'libsamplerate.so' 'libsndfile.so'
  'libsystemd.so' 'libzita-alsa-pcmi.so' 'libzita-resampler.so')
  optdepends=('a2jmidid: for ALSA MIDI to JACK MIDI bridging'
              'libffado: for firewire support using FFADO'
              'jack2-dbus: for dbus integration'
              'realtime-privileges: for realtime privileges'
              'zita-ajbridge: for using multiple ALSA devices')
  conflicts=('jack')
  provides=('jack' 'libjack.so' 'libjacknet.so' 'libjackserver.so')
  replaces=('jack')

  cd "${pkgbase}"
  export PYTHONPATH="${PWD}:${PYTHONPATH}"
  waf install --destdir="${pkgdir}"
  rm -rfv "${pkgdir}/usr/bin/jack"{dbus,_control} "${pkgdir}/usr/share/dbus-1/"
}

package_jack2-dbus() {
  local _names=('alias' 'bufsize' 'connect' 'cpu' 'cpu_load' 'disconnect'
  'evmon' 'freewheel' 'iodelay' 'latent_client' 'load' 'lsp' 'metro'
  'midi_dump' 'midi_latency_test' 'midiseq' 'midisine' 'monitor_client'
  'multiple_metro' 'net_master' 'net_slave' 'netsource' 'property' 'rec'
  'samplerate' 'server_control' 'session_notify' 'showtime' 'simdtests'
  'simple_client' 'simple_session_client' 'test' 'thru' 'transport' 'unload'
  'wait' 'zombie')

  pkgdesc+=" (dbus integration)"
  depends=('gcc-libs' 'glibc' 'jack2' 'libdbus-1.so' 'libjackserver.so'
  'python-dbus')

  cd "${pkgbase}"
  export PYTHONPATH="${PWD}:${PYTHONPATH}"
  waf install --destdir="${pkgdir}"
  rm -rfv "${pkgdir}/etc/" "${pkgdir}/usr/include/" "${pkgdir}/usr/lib/" \
    "${pkgdir}/usr/share/man/" "${pkgdir}/usr/bin/alsa"* "${pkgdir}/usr/bin/jackd"
  for _name in "${_names[@]}"; do
    rm -v "${pkgdir}/usr/bin/jack_${_name}"
  done
}
# vim:set ts=2 sw=2 et:
