# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Maintainer: Jan de Groot <jgc@archlinxu.org>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>
# Contributor: Tor Krill <tor@krill.nu>
# Contributor: Will Rea <sillywilly@gmail.com>
# Contributor: Valentine Sinitsyn <e_val@inbox.ru>

pkgbase=networkmanager
pkgname=(networkmanager libnm libnm-glib)
pkgver=1.14.0
pkgrel=1
pkgdesc="Network connection manager and user applications"
url="https://wiki.gnome.org/Projects/NetworkManager"
arch=(x86_64)
license=(GPL2 LGPL2.1)
_pppver=2.4.7
makedepends=(intltool dhclient iptables gobject-introspection gtk-doc "ppp=$_pppver" modemmanager
             dbus-glib iproute2 nss polkit wpa_supplicant curl systemd libmm-glib
             libnewt libndp libteam vala perl-yaml python-gobject git vala jansson bluez-libs
             glib2-docs dhcpcd iwd dnsmasq systemd-resolvconf libpsl audit)
checkdepends=(libx11 python-dbus)
_commit=2979c891c4af7584780924e92b6d448b7d6cd328  # tags/1.14.0^0
source=("git+https://gitlab.freedesktop.org/NetworkManager/NetworkManager.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd NetworkManager
  git describe | sed 's/-dev/dev/;s/-rc/rc/;s/-/+/g'
}

prepare() {
  mkdir build
  cd NetworkManager
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd build
  ../NetworkManager/configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    runstatedir=/run \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib \
    --disable-ifcfg-rh \
    --disable-ifupdown \
    --disable-lto \
    --disable-more-logging \
    --disable-more-warnings \
    --disable-qt \
    --disable-static \
    --enable-bluez5-dun \
    --enable-concheck \
    --enable-config-plugin-ibft \
    --enable-gtk-doc \
    --enable-introspection \
    --enable-json-validation \
    --enable-ld-gc \
    --enable-modify-system \
    --enable-polkit \
    --enable-polkit-agent \
    --enable-teamdctl \
    --enable-wifi \
    --with-config-dhcp-default=internal \
    --with-config-dns-rc-manager-default=symlink \
    --with-config-logging-backend-default=journal \
    --with-config-plugins-default=keyfile,ibft \
    --with-crypto=nss \
    --with-dbus-sys-dir=/usr/share/dbus-1/system.d \
    --with-dhclient=/usr/bin/dhclient \
    --with-dhcpcd-supports-ipv6 \
    --with-dhcpcd=/usr/bin/dhcpcd \
    --with-dist-version="$pkgver-$pkgrel" \
    --with-dnsmasq=/usr/bin/dnsmasq \
    --with-dnssec-trigger=/usr/lib/dnssec-trigger/dnssec-trigger-script \
    --with-hostname-persist=default \
    --with-iptables=/usr/bin/iptables \
    --with-iwd \
    --with-kernel-firmware-dir=/usr/lib/firmware \
    --with-libaudit=yes \
    --with-libnm-glib \
    --with-libpsl \
    --with-modem-manager-1 \
    --with-nmcli \
    --with-nmtui \
    --with-pppd-plugin-dir=/usr/lib/pppd/$_pppver \
    --with-pppd=/usr/bin/pppd \
    --with-resolvconf=/usr/bin/resolvconf \
    --with-session-tracking=systemd \
    --with-suspend-resume=systemd \
    --with-system-ca-path=/etc/ssl/certs \
    --with-systemd-journal \
    --with-systemd-logind \
    --with-systemdsystemunitdir=/usr/lib/systemd/system \
    --with-udev-dir=/usr/lib/udev \
    --with-wext \
    --without-consolekit \
    --without-dhcpcanon \
    --without-more-asserts \
    --without-netconfig \
    --without-ofono \
    --without-selinux
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  make check -C build
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

  DESTDIR="$pkgdir" make install -C build

  # packaged configuration
  install -Dm644 /dev/stdin "$pkgdir/usr/lib/NetworkManager/conf.d/20-connectivity.conf" <<END
[connectivity]
uri=http://www.archlinux.org/check_network_status.txt
END

  # /etc/NetworkManager
  install -d "$pkgdir"/etc/NetworkManager/{conf,dnsmasq}.d
  install -dm700 "$pkgdir/etc/NetworkManager/system-connections"
  install -m644 /dev/stdin "$pkgdir/etc/NetworkManager/NetworkManager.conf" <<END
# Configuration file for NetworkManager.
# See "man 5 NetworkManager.conf" for details.
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
  depends=(glib2 nss libutil-linux jansson libsystemd)
  mv libnm/* "$pkgdir"
}

package_libnm-glib() {
  pkgdesc="NetworkManager client library (legacy)"
  depends=(libnm dbus-glib)
  mv libnm-glib/* "$pkgdir"
}

# vim:set sw=2 et:
