# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Maintainer: Jan de Groot <jgc@archlinxu.org>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>
# Contributor: Tor Krill <tor@krill.nu>
# Contributor: Will Rea <sillywilly@gmail.com>
# Contributor: Valentine Sinitsyn <e_val@inbox.ru>

pkgbase=networkmanager
pkgname=(networkmanager libnm libnm-glib)
pkgver=1.16.0
pkgrel=1
pkgdesc="Network connection manager and user applications"
url="https://wiki.gnome.org/Projects/NetworkManager"
arch=(x86_64)
license=(GPL2 LGPL2.1)
_pppver=2.4.7
makedepends=(intltool dhclient iptables gobject-introspection gtk-doc "ppp=$_pppver" modemmanager
             dbus-glib iproute2 nss polkit wpa_supplicant curl systemd libmm-glib
             libnewt libndp libteam vala perl-yaml python-gobject git vala jansson bluez-libs
             glib2-docs dhcpcd iwd dnsmasq systemd-resolvconf libpsl audit meson)
checkdepends=(libx11 python-dbus)
_commit=15a6b41239e9abc44f128d2721f63c2ce09a40ec  # tags/1.16.0^0
source=("git+https://gitlab.freedesktop.org/NetworkManager/NetworkManager.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd NetworkManager
  git describe | sed 's/-dev/dev/;s/-rc/rc/;s/-/+/g'
}

prepare() {
  cd NetworkManager
}

build() {
  local meson_args=(
    -D dbus_conf_dir=/usr/share/dbus-1/system.d
    -D dist_version="$pkgver-$pkgrel"
    -D session_tracking_consolekit=false
    -D suspend_resume=systemd
    -D modify_system=true
    -D polkit_agent=true
    -D selinux=false
    -D iwd=true
    -D pppd_plugin_dir=/usr/lib/pppd/$_pppver
    -D teamdctl=true
    -D libnm_glib=true
    -D bluez5_dun=true
    -D ebpf=true
    -D config_plugins_default=keyfile,ibft
    -D ibft=true
    -D vapi=true
    -D docs=true
    -D more_asserts=no
    -D more_logging=false
    -D qt=false
  )

  arch-meson NetworkManager build "${meson_args[@]}"
  ninja -C build
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

package_networkmanager() {
  depends=(libnm libnm-glib iproute2 polkit wpa_supplicant libmm-glib libnewt libndp libteam curl
           bluez-libs libpsl audit)
  optdepends=('dnsmasq: connection sharing'
              'bluez: Bluetooth support'
              'ppp: dialup connection support'
              'modemmanager: cellular network support'
              'iwd: wpa_supplicant alternative')
  backup=(etc/NetworkManager/NetworkManager.conf)
  groups=(gnome)

  DESTDIR="$pkgdir" meson install -C build

  # /etc/NetworkManager
  install -d "$pkgdir"/etc/NetworkManager/{conf,dnsmasq}.d
  install -dm700 "$pkgdir/etc/NetworkManager/system-connections"
  install -m644 /dev/stdin "$pkgdir/etc/NetworkManager/NetworkManager.conf" <<END
# Configuration file for NetworkManager.
# See "man 5 NetworkManager.conf" for details.
END

  # packaged configuration
  install -Dm644 /dev/stdin "$pkgdir/usr/lib/NetworkManager/conf.d/20-connectivity.conf" <<END
[connectivity]
uri=http://www.archlinux.org/check_network_status.txt
END

### Split libnm
  _pick libnm "$pkgdir"/usr/include/libnm
  _pick libnm "$pkgdir"/usr/lib/girepository-1.0/NM-*
  _pick libnm "$pkgdir"/usr/lib/libnm.*
  _pick libnm "$pkgdir"/usr/lib/pkgconfig/libnm.pc
  _pick libnm "$pkgdir"/usr/share/gir-1.0/NM-*
  _pick libnm "$pkgdir"/usr/share/gtk-doc/html/libnm
  _pick libnm "$pkgdir"/usr/share/vala/vapi/libnm.*

### Split libnm-glib
  _pick libnm-glib "$pkgdir"/usr/include/*
  _pick libnm-glib "$pkgdir"/usr/lib/girepository-1.0/*
  _pick libnm-glib "$pkgdir"/usr/lib/libnm-*
  _pick libnm-glib "$pkgdir"/usr/lib/pkgconfig/*
  _pick libnm-glib "$pkgdir"/usr/share/gir-1.0/*
  _pick libnm-glib "$pkgdir"/usr/share/gtk-doc/html/libnm-*
  _pick libnm-glib "$pkgdir"/usr/share/vala/vapi/*
}

package_libnm() {
  pkgdesc="NetworkManager client library"
  depends=(glib2 nss libutil-linux jansson systemd-libs)
  mv libnm/* "$pkgdir"
}

package_libnm-glib() {
  pkgdesc="NetworkManager client library (legacy)"
  depends=(libnm dbus-glib)
  mv libnm-glib/* "$pkgdir"
}

# vim:set sw=2 et:
