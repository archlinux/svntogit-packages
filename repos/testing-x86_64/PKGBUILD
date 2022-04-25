# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=pipewire
pkgname=(pipewire alsa-card-profiles pipewire-docs pipewire-alsa pipewire-jack
         pipewire-pulse gst-plugin-pipewire pipewire-zeroconf pipewire-v4l2
         pipewire-x11-bell)
_commit=64cf5e80e6240284e6b757907b900507fe56f1b5  # tags/0.3.50
pkgver=0.3.50
pkgrel=2
epoch=1
pkgdesc="Low-latency audio/video router and processor"
url="https://pipewire.org"
arch=(x86_64)
license=(MIT)
makedepends=(git meson doxygen graphviz python-docutils valgrind libpulse
             alsa-lib libusb gst-plugins-base rtkit dbus sdl2 ncurses
             libcanberra libsndfile bluez-libs sbc libldac libfreeaptx
             libfdk-aac avahi lilv webrtc-audio-processing libx11 libxfixes)
checkdepends=(desktop-file-utils)
options=(debug)
source=("git+https://gitlab.freedesktop.org/pipewire/pipewire.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd pipewire
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd pipewire

  git cherry-pick -n d3ea3142e1a4de206e616bc18f63a529e6b4986a  # fix headers for sdl2
  # remove export of LD_LIBRARY_PATH for pw-jack as it would add /usr/lib
  sed -i '/LD_LIBRARY_PATH/d' pipewire-jack/src/pw-jack.in
}

build() {
  local meson_options=(
    -D docs=enabled
    -D jack=disabled
    -D jack-devel=true
    -D libjack-path=/usr/lib
    -D libcamera=disabled
    -D udevrulesdir=/usr/lib/udev/rules.d
    -D roc=disabled
    -D session-managers=[]
  )

  arch-meson pipewire build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

_ver=${pkgver:0:3}

package_pipewire() {
  license+=(LGPL)  # libspa-alsa
  depends=(alsa-card-profiles libdbus-1.so libncursesw.so libsndfile.so
           libudev.so libusb-1.0.so libasound.so libsystemd.so libbluetooth.so
           libsbc.so libldacBT_enc.so libfreeaptx.so libfdk-aac.so liblilv-0.so
           libwebrtc_audio_processing.so)
  optdepends=('pipewire-docs: Documentation'
              'pipewire-session-manager: Session manager'
              'pipewire-alsa: ALSA configuration'
              'pipewire-jack: JACK support'
              'pipewire-pulse: PulseAudio replacement'
              'gst-plugin-pipewire: GStreamer plugin'
              'pipewire-zeroconf: Zeroconf support'
              'pipewire-v4l2: V4L2 interceptor'
              'pipewire-x11-bell: X11 bell'
              'realtime-privileges: realtime privileges with rt module'
              'rtkit: realtime privileges with rtkit module')
  provides=(libpipewire-$_ver.so)
  install=pipewire.install

  meson install -C build --destdir "$pkgdir"

  ( cd "$pkgdir"

    _pick acp usr/lib/udev
    _pick acp usr/share/alsa-card-profile

    _pick docs usr/share/doc

    _pick jack usr/bin/pw-jack
    _pick jack usr/include/jack
    _pick jack usr/lib/libjack*
    _pick jack usr/lib/pkgconfig/jack.pc
    _pick jack usr/share/man/man1/pw-jack.1
    _pick jack usr/share/pipewire/jack.conf

    _pick pulse usr/bin/pipewire-pulse
    _pick pulse usr/lib/pipewire-$_ver/libpipewire-module-protocol-pulse.so
    _pick pulse usr/lib/pipewire-$_ver/libpipewire-module-pulse-tunnel.so
    _pick pulse usr/lib/systemd/user/pipewire-pulse.*

    _pick gst usr/lib/gstreamer-1.0

    _pick zeroconf usr/lib/pipewire-$_ver/libpipewire-module-{raop,zeroconf}-discover.so

    _pick v4l2 usr/bin/pw-v4l2 usr/lib/pipewire-$_ver/v4l2

    _pick x11-bell usr/lib/pipewire-$_ver/libpipewire-module-x11-bell.so

    mkdir -p etc/alsa/conf.d
    ln -st etc/alsa/conf.d /usr/share/alsa/alsa.conf.d/50-pipewire.conf

    # directories for overrides
    mkdir -p etc/pipewire/{client-rt,client,minimal,pipewire,pipewire-pulse}.conf.d
  )

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_alsa-card-profiles() {
  pkgdesc+=" - ALSA card profiles"
  license=(LGPL)

  mv acp/* "$pkgdir"
}

package_pipewire-docs() {
  pkgdesc+=" - documentation"

  mv docs/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_pipewire-alsa() {
  pkgdesc+=" - ALSA configuration"
  depends=(pipewire-session-manager)
  provides=(pulseaudio-alsa)

  mkdir -p "$pkgdir/etc/alsa/conf.d"
  ln -st "$pkgdir/etc/alsa/conf.d" \
    /usr/share/alsa/alsa.conf.d/99-pipewire-default.conf

  install -Dm644 /dev/null \
    "$pkgdir/usr/share/pipewire/media-session.d/with-alsa"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_pipewire-jack() {
  pkgdesc+=" - JACK support"
  license+=(GPL2)  # libjackserver
  depends=(pipewire-session-manager libpipewire-$_ver.so sh)
  optdepends=('jack-example-tools: for official JACK example-clients and tools')
  conflicts=(jack jack2)
  provides=(jack libjack.so libjackserver.so libjacknet.so)

  mv jack/* "$pkgdir"

  install -Dm644 /dev/null \
    "$pkgdir/usr/share/pipewire/media-session.d/with-jack"

  # directories for overrides
  mkdir -p "$pkgdir/etc/pipewire/jack.conf.d"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_pipewire-pulse() {
  pkgdesc+=" - PulseAudio replacement"
  depends=(pipewire-session-manager libpipewire-$_ver.so libpulse.so
           libavahi-{client,common}.so)
  provides=(pulseaudio pulseaudio-bluetooth)
  conflicts=(pulseaudio pulseaudio-bluetooth)
  install=pipewire-pulse.install

  mv pulse/* "$pkgdir"

  install -Dm644 /dev/null \
    "$pkgdir/usr/share/pipewire/media-session.d/with-pulseaudio"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_gst-plugin-pipewire() {
  pkgdesc="Multimedia graph framework - pipewire plugin"
  depends=(pipewire-session-manager libpipewire-$_ver.so gst-plugins-base-libs)

  mv gst/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_pipewire-zeroconf() {
  pkgdesc+=" - Zeroconf support"
  depends=(pipewire libpipewire-$_ver.so libavahi-{client,common}.so)

  mv zeroconf/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_pipewire-v4l2() {
  pkgdesc+=" - V4L2 interceptor"
  depends=(pipewire-session-manager libpipewire-$_ver.so sh)

  mv v4l2/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}


package_pipewire-x11-bell() {
  pkgdesc+=" - X11 bell"
  depends=(pipewire libpipewire-$_ver.so libx11 libxfixes libcanberra.so)

  mv x11-bell/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}
# vim:set sw=2 et:
