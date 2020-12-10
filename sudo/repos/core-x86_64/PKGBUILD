# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=sudo
_sudover=1.9.4
pkgver=${_sudover/p/.p}
pkgrel=2
pkgdesc="Give certain users the ability to run some commands as root"
arch=('x86_64')
url="https://www.sudo.ws/sudo/"
license=('custom')
groups=('base-devel')
depends=('glibc' 'libgcrypt' 'pam' 'libldap')
backup=('etc/pam.d/sudo'
        'etc/sudo.conf'
        'etc/sudo_logsrvd.conf'
        'etc/sudoers')
install=$pkgname.install
source=(https://www.sudo.ws/sudo/dist/$pkgname-$_sudover.tar.gz{,.sig}
        $pkgname-runas-unknown-user.patch::https://github.com/sudo-project/sudo/commit/a7d670ee3404.patch
        sudo_logsrvd.service
        sudo.pam)
sha256sums=('8b91bd2cc73af18a06a01406e38d154b837107be759f72e89cefeaa94e1103f0'
            'SKIP'
            '0c0d3ff785e0743cfae614497a3792b1f9f4f4d2b750247c8bab5d0d477a702d'
            '8b91733b73171827c360a3e01f4692772b78e62ceca0cf0fd4b770aba35081a1'
            'd1738818070684a5d2c9b26224906aad69a4fea77aabd960fc2675aee2df1fa2')
validpgpkeys=('59D1E9CCBA2B376704FDD35BA9F4C021CEA470FB')

prepare() {
  cd "$srcdir/$pkgname-$_sudover"

  # https://bugzilla.sudo.ws/show_bug.cgi?id=948
  patch -Np1 -i ../$pkgname-runas-unknown-user.patch
}

build() {
  cd "$srcdir/$pkgname-$_sudover"

  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib \
    --with-rundir=/run/sudo \
    --with-vardir=/var/db/sudo \
    --with-logfac=auth \
    --enable-gcrypt \
    --enable-tmpfiles.d \
    --with-pam \
    --with-sssd \
    --with-ldap \
    --with-ldap-conf-file=/etc/openldap/ldap.conf \
    --with-env-editor \
    --with-passprompt="[sudo] password for %p: " \
    --with-sendmail=/usr/bin/sendmail \
    --with-all-insults
  make
}

check() {
  cd "$srcdir/$pkgname-$_sudover"
  make check
}

package() {
  cd "$srcdir/$pkgname-$_sudover"
  make DESTDIR="$pkgdir" install

  # sudo_logsrvd service file (taken from sudo-logsrvd-1.9.0-1.el8.x86_64.rpm)
  install -Dm644 -t "$pkgdir/usr/lib/systemd/system" ../sudo_logsrvd.service

  # Remove sudoers.dist; not needed since pacman manages updates to sudoers
  rm "$pkgdir/etc/sudoers.dist"

  # Remove /run/sudo directory; we create it using systemd-tmpfiles
  rmdir "$pkgdir/run/sudo"
  rmdir "$pkgdir/run"

  install -Dm644 "$srcdir/sudo.pam" "$pkgdir/etc/pam.d/sudo"

  install -Dm644 doc/LICENSE "$pkgdir/usr/share/licenses/sudo/LICENSE"
}

# vim:set ts=2 sw=2 et:
