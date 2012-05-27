# Maintainer: Dave Reisner <dreisner@archlinux.org>

pkgbase=systemd
pkgname=('systemd' 'libsystemd' 'systemd-tools' 'udev')
pkgver=183
pkgrel=2
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
        'os-release')
md5sums=('e1e5e0f376fa2a4cb4bc31a2161c09f2'
         'e99e9189aa2f6084ac28b8ddf605aeb8'
         '59e91c4d7a69b7bf12c86a9982e37ced'
         'df69615503ad293c9ddf9d8b7755282d'
         '5543be25f205f853a21fa5ee68e03f0d'
         '752636def0db3c03f121f8b4f44a63cd')

build() {
  cd "$pkgname-$pkgver"

  # still waiting on ipw2x00 to get fixed...
  patch -Np1 <"$srcdir/0001-Reinstate-TIMEOUT-handling.patch"

  # fix udev rules dir
  sed -i 's/pkglibexecdir/udevlibexecdir/' src/udev/udev.pc.in

  ./configure \
      --libexecdir=/usr/lib \
      --localstatedir=/var \
      --sysconfdir=/etc \
      --enable-split-usr \
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
  depends=('acl' 'dbus-core' "libsystemd=$pkgver" 'kbd' 'kmod' 'libcap' 'pam' "systemd-tools=$pkgver"
           'util-linux' "udev=$pkgver" 'xz')
  optdepends=('cryptsetup: required for encrypted block devices'
              'dbus-python: systemd-analyze'
              'initscripts: legacy support for hostname and vconsole setup'
              'initscripts-systemd: native boot and initialization scripts'
              'python2-cairo: systemd-analyze'
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

  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/os-release" "$pkgdir/etc/os-release"
  printf "d /run/console 0755 root root\n" > "$pkgdir/usr/lib/tmpfiles.d/console.conf"

  # install external sd-{daemon,readahead} libraries
  install -m644 -t "$pkgdir/usr/share/doc/systemd" \
    src/systemd/sd-daemon.[ch] \
    src/readahead/sd-readahead.[ch]

  install -dm755 "$pkgdir/bin"
  ln -s ../usr/lib/systemd/systemd "$pkgdir/bin/systemd"

  # fix systemd-analyze for python2
  sed -i '1s/python$/python2/' "$pkgdir/usr/bin/systemd-analyze"

  # fix .so links in manpage stubs
  find "$pkgdir/usr/share/man" -type f -name '*.[[:digit:]]' \
      -exec sed -i '1s|^\.so \(.*\)\.\([[:digit:]]\+\)|.so man\2/\1.\2|' {} +

  # rename man pages to avoid conflicts with sysvinit and initscripts
  cd "$pkgdir/usr/share/man"

  manpages=(man8/{telinit,halt,reboot,poweroff,runlevel,shutdown}.8
            man5/{hostname,{vconsole,locale}.conf}.5)

  for manpage in "${manpages[@]}"; do
    IFS='/' read section page <<< "$manpage"
    mv "$manpage" "$section/systemd.$page"
  done
  sed -i '1s|/\([^/]\+\)|/systemd.\1|' "$pkgdir"/usr/share/man/man8/systemd.{poweroff,reboot}.8

  # move bash-completion and symlink for loginctl
  install -Dm644 "$pkgdir/etc/bash_completion.d/systemd-bash-completion.sh" \
    "$pkgdir/usr/share/bash-completion/completions/systemctl"
  ln -s systemctl "$pkgdir/usr/share/bash-completion/completions/loginctl"
  rm -rf "$pkgdir/etc/bash_completion.d"

  # don't write units to /etc by default -- we'll enable this on post_install
  # as a sane default
  rm "$pkgdir/etc/systemd/system/getty.target.wants/getty@tty1.service"
  rmdir "$pkgdir/etc/systemd/system/getty.target.wants"

  ### split off libsystemd (libs, includes, pkgconfig, man3)
  rm -rf "$srcdir/_libsystemd"
  install -dm755 "$srcdir"/_libsystemd/usr/{include,lib/pkgconfig}
  cd "$srcdir"/_libsystemd
  mv "$pkgdir/usr/lib"/libsystemd-*.so* usr/lib
  mv "$pkgdir/usr/include/systemd" usr/include
  mv "$pkgdir/usr/lib/pkgconfig"/libsystemd-*.pc usr/lib/pkgconfig

  ### split out udev
  rm -rf "$srcdir/_udev"
  install -dm755 \
      "$srcdir"/_udev/etc/udev \
      "$srcdir"/_udev/usr/bin \
      "$srcdir"/_udev/usr/include \
      "$srcdir"/_udev/usr/lib/{systemd/system,udev} \
      "$srcdir"/_udev/usr/lib/systemd/system/{sysinit,sockets}.target.wants \
      "$srcdir"/_udev/usr/lib/girepository-1.0 \
      "$srcdir"/_udev/usr/{lib,share}/pkgconfig \
      "$srcdir"/_udev/usr/share/gir-1.0 \
      "$srcdir"/_udev/usr/share/gtk-doc/html/{g,lib}udev \
      "$srcdir"/_udev/usr/share/man/man{7,8}

  cd "$srcdir"/_udev
  mv "$pkgdir"/etc/udev etc
  mv "$pkgdir"/usr/bin/udevadm usr/bin
  mv "$pkgdir"/usr/lib/pkgconfig/*udev*.pc usr/lib/pkgconfig
  mv "$pkgdir"/usr/lib/systemd/systemd-udevd usr/lib/systemd
  mv "$pkgdir"/usr/lib/systemd/system/systemd-udev* usr/lib/systemd/system
  mv "$pkgdir"/usr/lib/systemd/system/sysinit.target.wants/systemd-udev* usr/lib/systemd/system/sysinit.target.wants
  mv "$pkgdir"/usr/lib/systemd/system/sockets.target.wants/systemd-udev* usr/lib/systemd/system/sockets.target.wants
  mv "$pkgdir"/usr/lib/lib{,g}udev* usr/lib
  mv "$pkgdir"/usr/lib/udev usr/lib
  mv "$pkgdir"/usr/include/{libudev.h,gudev-1.0} usr/include
  mv "$pkgdir"/usr/lib/girepository-1.0 usr/lib
  mv "$pkgdir"/usr/share/pkgconfig/udev.pc usr/share/pkgconfig
  mv "$pkgdir"/usr/share/gir-1.0 usr/share
  mv "$pkgdir"/usr/share/gtk-doc/html/{g,lib}udev usr/share/gtk-doc/html
  mv "$pkgdir"/usr/share/man/man7/udev.7 usr/share/man/man7
  mv "$pkgdir"/usr/share/man/man8/{systemd-udevd,udevadm}.8 usr/share/man/man8

  ### split out systemd-tools
  rm -rf "$srcdir/_tools"
  install -dm755 \
      "$srcdir/_tools/usr/lib/systemd" \
      "$srcdir/_tools/usr/bin" \
      "$srcdir"/_tools/etc/{binfmt,modules-load,sysctl}.d \
      "$srcdir"/_tools/usr/share/man/man{1,5}

  cd "$srcdir/_tools"
  mv "$pkgdir"/usr/bin/systemd-{ask-password,delta,detect-virt,tmpfiles,tty-ask-password-agent} usr/bin
  mv "$pkgdir"/usr/lib/systemd/systemd-{ac-power,binfmt,cryptsetup,modules-load,random-seed,remount-fs,reply-password,sysctl,timestamp,vconsole-setup} usr/lib/systemd
  mv "$pkgdir"/usr/share/man/man1/systemd-{ask-password,delta,detect-virt}.1 usr/share/man/man1
  mv "$pkgdir"/usr/share/man/man5/{binfmt,modules-load,sysctl,tmpfiles}.d.5 usr/share/man/man5
  mv "$pkgdir"/usr/share/man/man5/systemd.vconsole.conf.5 usr/share/man/man5
}

package_libsystemd() {
  pkgdesc="systemd client libraries"
  depends=('xz')

  mv "$srcdir/_libsystemd"/* "$pkgdir"
}

package_systemd-tools() {
  pkgdesc='standalone tools from systemd'
  url='http://www.freedesktop.org/wiki/Software/systemd'
  depends=('glibc' 'kmod')
  conflicts=('systemd<183')

  mv "$srcdir/_tools/"* "$pkgdir"
  install -Dm644 "$srcdir/initcpio-install-timestamp" "$pkgdir/usr/lib/initcpio/install/timestamp"
}

package_udev() {
  pkgdesc='userspace dev tools'
  url='http://git.kernel.org/?p=linux/hotplug/udev.git;a=summary'
  groups=('base')
  depends=('acl' 'util-linux' 'glibc' 'glib2' 'kmod' 'hwids' 'bash')
  backup=('etc/udev/udev.conf')
  install='udev.install'

  mv "$srcdir/_udev"/* "$pkgdir"

  # the path to udevadm is hardcoded in some places
  install -d "$pkgdir/sbin"
  ln -s ../usr/bin/udevadm "$pkgdir/sbin/udevadm"

  # udevd is no longer udevd because systemd. why isn't udevadm now udevctl?
  ln -s ../lib/systemd/systemd-udevd "$pkgdir/usr/bin/udevd"
  ln -s ../systemd/systemd-udevd  "$pkgdir/usr/lib/udev/udevd"

  # Replace dialout/tape/cdrom group in rules with uucp/storage/optical group
  sed -i 's#GROUP="dialout"#GROUP="uucp"#g;
          s#GROUP="tape"#GROUP="storage"#g;
          s#GROUP="cdrom"#GROUP="optical"#g' "$pkgdir"/usr/lib/udev/rules.d/*.rules

  # add mkinitcpio hooks for udev
  install -Dm644 "$srcdir/initcpio-install-udev" "$pkgdir/usr/lib/initcpio/install/udev"
  install -Dm644 "$srcdir/initcpio-hook-udev" "$pkgdir/usr/lib/initcpio/hooks/udev"
}

# vim: ft=sh syn=sh et
