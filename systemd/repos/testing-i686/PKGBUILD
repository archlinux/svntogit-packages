# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>

pkgbase=systemd
pkgname=('systemd' 'libsystemd' 'systemd-tools' 'systemd-sysvcompat')
pkgver=188
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/systemd"
license=('GPL2' 'LGPL2.1' 'MIT')
makedepends=('acl' 'cryptsetup' 'dbus-core' 'docbook-xsl' 'gobject-introspection' 'gperf'
             'gtk-doc' 'intltool' 'kmod' 'libcap' 'libxslt' 'linux-api-headers' 'pam' 'xz')
options=('!libtool')
source=("http://www.freedesktop.org/software/$pkgname/$pkgname-$pkgver.tar.xz"
        'initcpio-hook-udev'
        'initcpio-install-udev'
        'initcpio-install-timestamp'
        '0001-Reinstate-TIMEOUT-handling.patch'
        'locale.sh'
        'use-split-usr-path.patch')
md5sums=('d89b42699695554949d072ef46c0dfc9'
         'e99e9189aa2f6084ac28b8ddf605aeb8'
         '59e91c4d7a69b7bf12c86a9982e37ced'
         'df69615503ad293c9ddf9d8b7755282d'
         '5543be25f205f853a21fa5ee68e03f0d'
         'f15956945052bb911e5df81cf5e7e5dc'
         '482dba45a783f06c2239f1355f4ce72f')

build() {
  cd "$pkgname-$pkgver"

  # still waiting on ipw2x00 to get fixed...
  patch -Np1 <"$srcdir/0001-Reinstate-TIMEOUT-handling.patch"
  patch -Np1 < "$srcdir/use-split-usr-path.patch"

  ./configure \
      --libexecdir=/usr/lib \
      --localstatedir=/var \
      --sysconfdir=/etc \
      --enable-introspection \
      --enable-gtk-doc \
      --disable-audit \
      --disable-ima \
      --with-pamlibdir=/usr/lib/security \
      --with-distro=arch \
      --with-usb-ids-path=/usr/share/hwdata/usb.ids \
      --with-pci-ids-path=/usr/share/hwdata/pci.ids \
      --with-firmware-path=/usr/lib/firmware/updates:/lib/firmware/updates:/usr/lib/firmware:/lib/firmware

  make
}

package_systemd() {
  pkgdesc="system and service manager"
  depends=('acl' 'dbus-core' "libsystemd=$pkgver" 'kmod' 'libcap' 'pam'
           "systemd-tools=$pkgver" 'util-linux' 'xz')
  optdepends=('initscripts: legacy support for hostname and vconsole setup'
              'initscripts-systemd: legacy generator for initialization scripts'
              'python2-cairo: systemd-analyze'
              'python2-dbus: systemd-analyze'
              'systemd-arch-units: collection of native unit files for Arch daemon/init scripts'
              'systemd-sysvcompat: symlink package to provide sysvinit binaries')
  backup=(etc/dbus-1/system.d/org.freedesktop.systemd1.conf
          etc/dbus-1/system.d/org.freedesktop.hostname1.conf
          etc/dbus-1/system.d/org.freedesktop.login1.conf
          etc/dbus-1/system.d/org.freedesktop.locale1.conf
          etc/dbus-1/system.d/org.freedesktop.timedate1.conf
          etc/systemd/system.conf
          etc/systemd/user.conf
          etc/systemd/logind.conf
          etc/systemd/journald.conf)
  install="systemd.install"

  make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install

  printf "d /run/console 0755 root root\n" > "$pkgdir/usr/lib/tmpfiles.d/console.conf"

  install -dm755 "$pkgdir/bin"
  ln -s ../usr/lib/systemd/systemd "$pkgdir/bin/systemd"

  # move bash-completion and symlink for loginctl
  install -Dm644 "$pkgdir/etc/bash_completion.d/systemd-bash-completion.sh" \
    "$pkgdir/usr/share/bash-completion/completions/systemctl"
  ln -s systemctl "$pkgdir/usr/share/bash-completion/completions/loginctl"
  rm -rf "$pkgdir/etc/bash_completion.d"

  # don't write units to /etc by default -- we'll enable this on post_install
  # as a sane default
  rm "$pkgdir/etc/systemd/system/getty.target.wants/getty@tty1.service"
  rmdir "$pkgdir/etc/systemd/system/getty.target.wants"

  ### get rid of RPM macros
  rm -r "$pkgdir/etc/rpm/macros.systemd"

  # can't use py3k yet with systemd-analyze -- the 'plot' verb will not work.
  # https://pokersource.info/show_bug.cgi?id=50989
  sed -i '1s/python$/python2/' "$pkgdir/usr/bin/systemd-analyze"

  ### split off libsystemd (libs, includes, pkgconfig, man3)
  rm -rf "$srcdir/_libsystemd"
  install -dm755 "$srcdir"/_libsystemd/usr/{include,lib/pkgconfig}
  cd "$srcdir"/_libsystemd
  mv "$pkgdir/usr/lib"/libsystemd-*.so* usr/lib
  mv "$pkgdir/usr/include/systemd" usr/include
  mv "$pkgdir/usr/lib/pkgconfig"/libsystemd-*.pc usr/lib/pkgconfig

  ### split out manpages for sysvcompat
  rm -rf "$srcdir/_sysvcompat"
  install -dm755 "$srcdir"/_sysvcompat/usr/share/man/man8/
  mv "$pkgdir"/usr/share/man/man8/{telinit,halt,reboot,poweroff,runlevel,shutdown}.8 \
     "$srcdir"/_sysvcompat/usr/share/man/man8

  ### split out systemd-tools/udev
  rm -rf "$srcdir/_tools"
  install -dm755 \
      "$srcdir"/_tools/etc/udev \
      "$srcdir"/_tools/usr/bin \
      "$srcdir"/_tools/usr/include \
      "$srcdir"/_tools/usr/lib/udev \
      "$srcdir"/_tools/usr/lib/systemd/system/{sysinit,sockets}.target.wants \
      "$srcdir"/_tools/usr/lib/girepository-1.0 \
      "$srcdir"/_tools/usr/share/pkgconfig \
      "$srcdir"/_tools/usr/share/gir-1.0 \
      "$srcdir"/_tools/usr/share/gtk-doc/html/{g,lib}udev \
      "$srcdir"/_tools/usr/share/man/man{1,5,7,8}

  cd "$srcdir/_tools"
  mv "$pkgdir"/etc/udev etc
  mv "$pkgdir"/etc/{binfmt,modules-load,sysctl,tmpfiles}.d etc
  mv "$pkgdir"/usr/bin/udevadm usr/bin
  mv "$pkgdir"/usr/bin/systemd-machine-id-setup usr/bin
  mv "$pkgdir"/usr/lib/pkgconfig usr/lib
  mv "$pkgdir"/usr/lib/systemd/systemd-udevd usr/lib/systemd
  mv "$pkgdir"/usr/lib/systemd/system/systemd-udev* usr/lib/systemd/system
  mv "$pkgdir"/usr/lib/systemd/system/sysinit.target.wants/systemd-udev* usr/lib/systemd/system/sysinit.target.wants
  mv "$pkgdir"/usr/lib/systemd/system/sockets.target.wants/systemd-udev* usr/lib/systemd/system/sockets.target.wants
  mv "$pkgdir"/usr/lib/lib{,g}udev* usr/lib
  mv "$pkgdir"/usr/lib/{binfmt,sysctl,modules-load,tmpfiles}.d usr/lib
  mv "$pkgdir"/usr/lib/udev usr/lib
  mv "$pkgdir"/usr/include/{libudev.h,gudev-1.0} usr/include
  mv "$pkgdir"/usr/lib/girepository-1.0 usr/lib
  mv "$pkgdir"/usr/share/pkgconfig/udev.pc usr/share/pkgconfig
  mv "$pkgdir"/usr/share/gir-1.0 usr/share
  mv "$pkgdir"/usr/share/gtk-doc/html/{g,lib}udev usr/share/gtk-doc/html
  mv "$pkgdir"/usr/share/man/man7/udev.7 usr/share/man/man7
  mv "$pkgdir"/usr/share/man/man8/{systemd-tmpfiles,udevadm}.8 usr/share/man/man8
  mv "$pkgdir"/usr/share/man/man8/systemd-udevd{,.service,{-control,-kernel}.socket}.8 usr/share/man/man8
  mv "$pkgdir"/usr/share/man/man1/systemd-{ask-password,delta,detect-virt,machine-id-setup}.1 usr/share/man/man1
  mv "$pkgdir"/usr/share/man/man5/{binfmt,modules-load,sysctl,tmpfiles}.d.5 usr/share/man/man5
  mv "$pkgdir"/usr/share/man/man5/{hostname,{vconsole,locale}.conf,crypttab}.5 usr/share/man/man5
  mv "$pkgdir"/usr/bin/systemd-{ask-password,delta,detect-virt,tmpfiles,tty-ask-password-agent} usr/bin
  mv "$pkgdir"/usr/lib/systemd/systemd-{ac-power,binfmt,cryptsetup,modules-load,random-seed,remount-fs,reply-password,sysctl,timestamp,vconsole-setup} usr/lib/systemd
}

package_systemd-sysvcompat() {
  pkgdesc="sysvinit compat for systemd"
  conflicts=('sysvinit' 'initscripts')

  mv "$srcdir/_sysvcompat"/* "$pkgdir"

  install -dm755 "$pkgdir/sbin"
  for tool in runlevel reboot shutdown poweroff halt telinit; do
    ln -s '/usr/bin/systemctl' "$pkgdir/sbin/$tool"
  done

  ln -s '../usr/lib/systemd/systemd' "$pkgdir/sbin/init"

  install -Dm755 "$srcdir/locale.sh" "$pkgdir/etc/profile.d/locale.sh"
}

package_libsystemd() {
  pkgdesc="systemd client libraries"
  depends=('xz')

  mv "$srcdir/_libsystemd"/* "$pkgdir"
}

package_systemd-tools() {
  pkgdesc='standalone tools from systemd'
  url='http://www.freedesktop.org/wiki/Software/systemd'
  depends=('acl' 'bash' 'glibc' 'glib2' 'libsystemd' 'kmod' 'hwids' 'util-linux' 'kbd')
  optdepends=('cryptsetup: required for encrypted block devices')
  provides=("udev=$pkgver")
  conflicts=('udev')
  replaces=('udev')
  install='systemd-tools.install'

  mv "$srcdir/_tools/"* "$pkgdir"

  # the path to udevadm is hardcoded in some places
  install -d "$pkgdir/sbin"
  ln -s ../usr/bin/udevadm "$pkgdir/sbin/udevadm"

  # udevd is no longer udevd because systemd. why isn't udevadm now udevctl?
  ln -s ../lib/systemd/systemd-udevd "$pkgdir/usr/bin/udevd"

  # add back tmpfiles.d/legacy.conf
  install -m644 "systemd-$pkgver/tmpfiles.d/legacy.conf" "$pkgdir/usr/lib/tmpfiles.d"

  # Replace dialout/tape/cdrom group in rules with uucp/storage/optical group
  sed -i 's#GROUP="dialout"#GROUP="uucp"#g;
          s#GROUP="tape"#GROUP="storage"#g;
          s#GROUP="cdrom"#GROUP="optical"#g' "$pkgdir"/usr/lib/udev/rules.d/*.rules

  # add mkinitcpio hooks
  install -Dm644 "$srcdir/initcpio-install-udev" "$pkgdir/usr/lib/initcpio/install/udev"
  install -Dm644 "$srcdir/initcpio-hook-udev" "$pkgdir/usr/lib/initcpio/hooks/udev"
  install -Dm644 "$srcdir/initcpio-install-timestamp" "$pkgdir/usr/lib/initcpio/install/timestamp"

  # XXX: kill off coredump rule until the journal can recover coredumps
  # this file needs to come back as part of systemd, not systemd-tools
  rm "$pkgdir/usr/lib/sysctl.d/coredump.conf"
}

# vim: ft=sh syn=sh et
