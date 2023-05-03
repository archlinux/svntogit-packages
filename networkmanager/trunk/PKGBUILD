# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinxu.org>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>
# Contributor: Tor Krill <tor@krill.nu>
# Contributor: Will Rea <sillywilly@gmail.com>
# Contributor: Valentine Sinitsyn <e_val@inbox.ru>

pkgbase=networkmanager
pkgname=(networkmanager libnm nm-cloud-setup)
pkgver=1.42.6
pkgrel=1
pkgdesc="Network connection manager and user applications"
url="https://networkmanager.dev/"
arch=(x86_64)
license=(GPL)
_pppver=2.4.9
makedepends=(
  audit
  bluez-libs
  curl
  dhclient
  dhcpcd
  dnsmasq
  git
  glib2-docs
  gobject-introspection
  gtk-doc
  iproute2
  iptables
  iwd
  jansson
  libmm-glib
  libndp
  libnewt
  libpsl
  libteam
  meson
  modemmanager
  nftables
  nss
  openresolv
  pacrunner
  perl-yaml
  polkit
  "ppp=$_pppver"
  python-gobject
  systemd
  vala
  vala
  wpa_supplicant
)
checkdepends=(
  libx11
  python-dbus
)
_commit=b6cc7c7e695ba3b1f2a5c95b0d6df418b8556e57  # tags/1.42.6^0
source=("git+https://gitlab.freedesktop.org/NetworkManager/NetworkManager.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd NetworkManager
  git describe --tags | sed 's/-dev/dev/;s/-rc/rc/;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd NetworkManager
}

build() {
  local meson_options=(
    # system paths
    -D dbus_conf_dir=/usr/share/dbus-1/system.d

    # platform
    -D dist_version="$pkgver-$pkgrel"
    -D session_tracking_consolekit=false
    -D suspend_resume=systemd
    -D modify_system=true
    -D selinux=false

    # features
    -D iwd=true
    -D pppd_plugin_dir=/usr/lib/pppd/$_pppver
    -D teamdctl=true
    -D nm_cloud_setup=true
    -D bluez5_dun=true
    -D ebpf=true

    # configuration plugins
    -D config_plugins_default=keyfile
    -D ifcfg_rh=false
    -D ifupdown=false

    # handlers for resolv.conf
    -D netconfig=no
    -D config_dns_rc_manager_default=symlink

    # miscellaneous
    -D vapi=true
    -D docs=true
    -D more_asserts=no
    -D more_logging=false
    -D qt=false
  )

  arch-meson NetworkManager build "${meson_options[@]}"
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

package_networkmanager() {
  depends=(
    audit
    bluez-libs
    curl
    iproute2
    jansson
    libmm-glib
    libndp
    libnewt
    libnm
    libpsl
    libteam
    mobile-broadband-provider-info
    wpa_supplicant
  )
  optdepends=(
    'bluez: Bluetooth support'
    'dhclient: alternative DHCP client'
    'dhcpcd: alternative DHCP client'
    'dnsmasq: connection sharing'
    'firewalld: firewall support'
    'iptables: connection sharing'
    'iwd: wpa_supplicant alternative'
    'modemmanager: cellular network support'
    'nftables: connection sharing'
    'openresolv: alternative resolv.conf manager'
    'pacrunner: PAC proxy support'
    'polkit: let non-root users control networking'
    'ppp: dialup connection support'
  )
  backup=(etc/NetworkManager/NetworkManager.conf)

  meson install -C build --destdir "$pkgdir"

  cd "$pkgdir"

  # /etc/NetworkManager
  install -d etc/NetworkManager/{conf,dnsmasq}.d
  install -dm700 etc/NetworkManager/system-connections
  install -m644 /dev/stdin etc/NetworkManager/NetworkManager.conf <<END
# Configuration file for NetworkManager.
# See "man 5 NetworkManager.conf" for details.
END

  # packaged configuration
  install -Dm644 /dev/stdin usr/lib/NetworkManager/conf.d/20-connectivity.conf <<END
[connectivity]
uri=http://ping.archlinux.org/nm-check.txt
END

  shopt -s globstar

  _pick libnm usr/include/libnm
  _pick libnm usr/lib/girepository-1.0/NM-*
  _pick libnm usr/lib/libnm.*
  _pick libnm usr/lib/pkgconfig/libnm.pc
  _pick libnm usr/share/gir-1.0/NM-*
  _pick libnm usr/share/gtk-doc/html/libnm
  _pick libnm usr/share/vala/vapi/libnm.*

  _pick cloud usr/lib/**/*nm-cloud-setup*
  _pick cloud usr/share/man/*/nm-cloud-setup*

  # Not actually packaged (https://bugs.archlinux.org/task/69138)
  _pick ovs usr/lib/systemd/system/NetworkManager.service.d/NetworkManager-ovs.conf

  # Restore empty dir
  install -d usr/lib/NetworkManager/dispatcher.d/no-wait.d
}

package_libnm() {
  pkgdesc="NetworkManager client library"
  license=(LGPL)
  depends=(
    glib2
    nss
    systemd-libs
    util-linux-libs
  )
  provides=(libnm.so)

  mv libnm/* "$pkgdir"
}

package_nm-cloud-setup() {
  pkgdesc="Automatically configure NetworkManager in cloud"
  depends=(networkmanager)

  mv cloud/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
