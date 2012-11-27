# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Maintainer: Tom Gundersen <teg@jklm.no>

pkgbase=systemd
pkgname=('systemd' 'systemd-sysvcompat')
pkgver=196
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
        'use-split-usr-path.patch')
md5sums=('05ebd7f108e420e2b4e4810ea4b3c810'
         'e99e9189aa2f6084ac28b8ddf605aeb8'
         'fb37e34ea006c79be1c54cbb0f803414'
         'df69615503ad293c9ddf9d8b7755282d'
         '76bf83fe34c5b40533abc5dc940576a6')

build() {
  cd "$pkgname-$pkgver"

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
      --with-distro=arch

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
  optdepends=('cryptsetup: required for encrypted block devices'
              'libmicrohttpd: systemd-journal-gatewayd'
              'quota-tools: kernel-level quota management'
              'python: systemd library bindings'
              'python2-cairo: systemd-analyze'
              'python2-gobject: systemd-analyze'
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

  # move bash-completion and symlink for *ctl's
  install -Dm644 "$pkgdir/etc/bash_completion.d/systemd-bash-completion.sh" \
    "$pkgdir/usr/share/bash-completion/completions/systemctl"
  for ctl in {login,journal,timedate,locale,hostname,systemd-coredump}ctl udevadm; do
    ln -s systemctl "$pkgdir/usr/share/bash-completion/completions/$ctl"
  done
  rm -rf "$pkgdir/etc/bash_completion.d"

  # zsh completion isn't installed as part of 196
  # http://i.imgur.com/hMJgX.jpg
  # TODO(dreisner): remove this for 197
  install -Dm644 "$pkgname-$pkgver/shell-completion/systemd-zsh-completion.zsh" \
      "$pkgdir/usr/share/zsh/site-functions/_systemd"

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
