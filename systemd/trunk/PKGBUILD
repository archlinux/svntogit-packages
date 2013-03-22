# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Maintainer: Tom Gundersen <teg@jklm.no>

pkgbase=systemd
pkgname=('systemd' 'systemd-sysvcompat')
pkgver=198
pkgrel=2
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/systemd"
license=('GPL2' 'LGPL2.1' 'MIT')
makedepends=('acl' 'cryptsetup' 'dbus-core' 'docbook-xsl' 'gobject-introspection' 'gperf'
             'gtk-doc' 'intltool' 'kmod' 'libcap' 'libgcrypt'  'libmicrohttpd' 'libxslt'
             'linux-api-headers' 'pam' 'python' 'quota-tools' 'xz')
options=('!libtool')
source=("http://www.freedesktop.org/software/$pkgname/$pkgname-$pkgver.tar.xz"
        'initcpio-hook-udev'
        'initcpio-install-udev'
        'initcpio-install-timestamp'
        '0001-journal-pass-the-pid-to-sd_pid_get_owner_uid.patch'
        '0001-strv-fix-STRV_FOREACH_PAIR-macro-definition.patch'
        '0001-rules-move-builtin-calls-before-the-permissions-sect.patch'
        '0001-Fix-vacuum-logic-error.patch'
        'use-split-usr-path.patch')
md5sums=('26a75e2a310f8c1c1ea9ec26ddb171c5'
         'e99e9189aa2f6084ac28b8ddf605aeb8'
         'fb37e34ea006c79be1c54cbb0f803414'
         'df69615503ad293c9ddf9d8b7755282d'
         'c93785560cd33e25013224ac84689aa3'
         '80db2672a49667a3add02fb07dee9dca'
         'a0d3aca35ff7f71d1a5a79022b715ae0'
         '7ae8e22cef30e57de02ca623b0673f76'
         '76bf83fe34c5b40533abc5dc940576a6')

build() {
  cd "$pkgname-$pkgver"

  # hang onto this until we do the /{,s}bin merge
  patch -Np1 <"$srcdir/use-split-usr-path.patch"

  # upstream commit 83d7d83bcc6c462ecbb4c8003e3a8b41f3b88d46
  patch -Np1 <"$srcdir"/0001-journal-pass-the-pid-to-sd_pid_get_owner_uid.patch

  # upstream commit 961e4526925b7b1e1d3582f2fc9fb38035e2b5fb
  patch -Np1 <"$srcdir"/0001-strv-fix-STRV_FOREACH_PAIR-macro-definition.patch

  # upstream commit bbb7f2ae5035105575365750592caa87213d7072
  # - modified to avoid pulling in disabling of firmware loading
  patch -Np1 <"$srcdir"/0001-rules-move-builtin-calls-before-the-permissions-sect.patch

  # upstream commit 6c142648aaced56ab681fcc97a71b06d588122a9
  patch -Np1 <"$srcdir"/0001-Fix-vacuum-logic-error.patch

  ./configure \
      --enable-static \
      --libexecdir=/usr/lib \
      --localstatedir=/var \
      --sysconfdir=/etc \
      --enable-introspection \
      --enable-gtk-doc \
      --disable-audit \
      --disable-ima \
      --with-sysvinit-path= \
      --with-sysvrcnd-path=

  make
}

check() {
  make -C "$pkgname-$pkgver" check
}

package_systemd() {
  pkgdesc="system and service manager"
  depends=('acl' 'bash' 'dbus-core' 'glib2' 'kbd' 'kmod' 'hwids' 'libcap' 'libgcrypt'
           'pam' 'util-linux' 'xz')
  provides=("libsystemd=$pkgver" 'nss-myhostname' "systemd-tools=$pkgver" "udev=$pkgver")
  replaces=('libsystemd' 'nss-myhostname' 'systemd-tools' 'udev')
  conflicts=('libsystemd' 'nss-myhostname' 'systemd-tools' 'udev')
  optdepends=('cryptsetup: required for encrypted block devices'
              'libmicrohttpd: systemd-journal-gatewayd'
              'quota-tools: kernel-level quota management'
              'python: systemd library bindings'
              'systemd-sysvcompat: symlink package to provide sysvinit binaries')
  backup=(etc/dbus-1/system.d/org.freedesktop.systemd1.conf
          etc/dbus-1/system.d/org.freedesktop.hostname1.conf
          etc/dbus-1/system.d/org.freedesktop.login1.conf
          etc/dbus-1/system.d/org.freedesktop.locale1.conf
          etc/dbus-1/system.d/org.freedesktop.timedate1.conf
          etc/systemd/system.conf
          etc/systemd/user.conf
          etc/systemd/logind.conf
          etc/systemd/journald.conf
          etc/udev/udev.conf)
  install="systemd.install"

  make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install

  printf "d /run/console 0755 root root\n" > "$pkgdir/usr/lib/tmpfiles.d/console.conf"

  install -dm755 "$pkgdir/bin"
  ln -s ../usr/lib/systemd/systemd "$pkgdir/bin/systemd"

  # don't write units to /etc by default -- we'll enable this on post_install
  # as a sane default
  rm "$pkgdir/etc/systemd/system/getty.target.wants/getty@tty1.service"
  rmdir "$pkgdir/etc/systemd/system/getty.target.wants"

  # get rid of RPM macros
  rm -r "$pkgdir/etc/rpm"

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

  ### split out manpages for sysvcompat
  rm -rf "$srcdir/_sysvcompat"
  install -dm755 "$srcdir"/_sysvcompat/usr/share/man/man8/
  mv "$pkgdir"/usr/share/man/man8/{telinit,halt,reboot,poweroff,runlevel,shutdown}.8 \
     "$srcdir"/_sysvcompat/usr/share/man/man8
}

package_systemd-sysvcompat() {
  pkgdesc="sysvinit compat for systemd"
  groups=('base')
  conflicts=('sysvinit')
  depends=('sysvinit-tools' 'systemd')

  mv "$srcdir/_sysvcompat"/* "$pkgdir"

  install -dm755 "$pkgdir/sbin"
  for tool in runlevel reboot shutdown poweroff halt telinit; do
    ln -s '/usr/bin/systemctl' "$pkgdir/sbin/$tool"
  done

  ln -s '../usr/lib/systemd/systemd' "$pkgdir/sbin/init"
}

# vim: ft=sh syn=sh et
