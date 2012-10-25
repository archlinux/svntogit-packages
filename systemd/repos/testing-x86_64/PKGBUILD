# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>

pkgbase=systemd
pkgname=('systemd' 'systemd-sysvcompat')
pkgver=195
pkgrel=2
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/systemd"
license=('GPL2' 'LGPL2.1' 'MIT')
makedepends=('acl' 'cryptsetup' 'dbus-core' 'docbook-xsl' 'gobject-introspection' 'gperf'
             'gtk-doc' 'intltool' 'kmod' 'libcap' 'libgcrypt' 'libxslt' 'linux-api-headers'
             'pam' 'python' 'quota-tools' 'xz')
options=('!libtool')
source=("http://www.freedesktop.org/software/$pkgname/$pkgname-$pkgver.tar.xz"
        'initcpio-hook-udev'
        'initcpio-install-udev'
        'initcpio-install-timestamp'
        '0001-Reinstate-TIMEOUT-handling.patch'
        'use-split-usr-path.patch')
md5sums=('38e8c8144e7e6e5bc3ce32eb4260e680'
         'e99e9189aa2f6084ac28b8ddf605aeb8'
         'fb37e34ea006c79be1c54cbb0f803414'
         'df69615503ad293c9ddf9d8b7755282d'
         '5543be25f205f853a21fa5ee68e03f0d'
         'fd5b5f04ab0a847373d357555129d4c0')

build() {
  cd "$pkgname-$pkgver"

  # still waiting on ipw2x00, et al to get fixed...
  patch -Np1 <"$srcdir/0001-Reinstate-TIMEOUT-handling.patch"

  # hang onto this until we do the /{,s}bin merge
  patch -Np1 <"$srcdir/use-split-usr-path.patch"

  ./configure \
      --libexecdir=/usr/lib \
      --localstatedir=/var \
      --sysconfdir=/etc \
      --enable-introspection \
      --enable-gtk-doc \
      --disable-audit \
      --disable-ima \
      --with-distro=arch \
      --with-usb-ids-path=/usr/share/hwdata/usb.ids \
      --with-pci-ids-path=/usr/share/hwdata/pci.ids

  make
}

check() {
  make -C "$pkgname-$pkgver" check
}

package_systemd() {
  pkgdesc="system and service manager"
  depends=('acl' 'bash' 'dbus-core' 'glib2' 'kbd' 'kmod' 'hwids' 'libcap' 'libgcrypt'
           'pam' 'util-linux' 'xz')
  provides=("libsystemd=$pkgver" "systemd-tools=$pkgver" "udev=$pkgver")
  replaces=('libsystemd' 'systemd-tools' 'udev')
  conflicts=('libsystemd' 'systemd-tools' 'udev')
  optdepends=('initscripts: legacy support for /etc/rc.conf'
              'python: systemd library bindings'
              'python2-cairo: systemd-analyze'
              'python2-dbus: systemd-analyze'
              'systemd-sysvcompat: symlink package to provide sysvinit binaries'
              'cryptsetup: required for encrypted block devices'
              'quota-tools: kernel-level quota management')
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

  # move bash-completion and symlink for *ctl's
  install -Dm644 "$pkgdir/etc/bash_completion.d/systemd-bash-completion.sh" \
    "$pkgdir/usr/share/bash-completion/completions/systemctl"
  for ctl in {login,journal,timedate,locale,hostname}ctl; do
    ln -s systemctl "$pkgdir/usr/share/bash-completion/completions/$ctl"
  done
  rm -rf "$pkgdir/etc/bash_completion.d"

  # don't write units to /etc by default -- we'll enable this on post_install
  # as a sane default
  rm "$pkgdir/etc/systemd/system/getty.target.wants/getty@tty1.service"
  rmdir "$pkgdir/etc/systemd/system/getty.target.wants"

  # get rid of RPM macros
  rm -r "$pkgdir/etc/rpm"

  # can't use py3k yet with systemd-analyze -- the 'plot' verb will not work.
  # https://pokersource.info/show_bug.cgi?id=50989
  sed -i '1s/python$/python2/' "$pkgdir/usr/bin/systemd-analyze"

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
  rm "$pkgdir/usr/lib/sysctl.d/coredump.conf"

  ### split out manpages for sysvcompat
  rm -rf "$srcdir/_sysvcompat"
  install -dm755 "$srcdir"/_sysvcompat/usr/share/man/man8/
  mv "$pkgdir"/usr/share/man/man8/{telinit,halt,reboot,poweroff,runlevel,shutdown}.8 \
     "$srcdir"/_sysvcompat/usr/share/man/man8

  # create /var/log/journal. users can control the actual log destination via journald.conf
  install -dm755 "$pkgdir/var/log/journal"
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
