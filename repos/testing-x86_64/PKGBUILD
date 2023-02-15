# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=sudo
_sudover=1.9.13
pkgrel=1
pkgver=${_sudover/p/.p}
pkgdesc="Give certain users the ability to run some commands as root"
arch=('x86_64')
url="https://www.sudo.ws/sudo/"
license=('custom')
depends=('glibc' 'openssl' 'pam' 'libldap' 'zlib')
backup=('etc/pam.d/sudo'
        'etc/sudo.conf'
        'etc/sudo_logsrvd.conf'
        'etc/sudoers')
install=$pkgname.install
source=(https://www.sudo.ws/sudo/dist/$pkgname-$_sudover.tar.gz{,.sig}
        sudo_logsrvd.service
        $pkgname-configure-add-missing-bracket.patch::https://github.com/sudo-project/sudo/commit/defec5d46eec.patch
        $pkgname-tests-pick-first-utf-8-locale.patch::https://github.com/sudo-project/sudo/commit/2845ceafb06d.patch
        sudo.pam)
sha256sums=('3f55455b46edb0a129d925dcc39972f12f7c7fb78d0ccab6017ee16c8177e436'
            'SKIP'
            '8b91733b73171827c360a3e01f4692772b78e62ceca0cf0fd4b770aba35081a1'
            'c6a19646f5dada64977ffa942803f17e6772911f4e62436652455525a45f8f5f'
            '8d8e44bee9bf9aeda194ab5ea789dd73f361498755295bc73a9ffd4b931b64aa'
            'd1738818070684a5d2c9b26224906aad69a4fea77aabd960fc2675aee2df1fa2')
validpgpkeys=('59D1E9CCBA2B376704FDD35BA9F4C021CEA470FB')

prepare() {
  cd $pkgname-$_sudover

  # https://github.com/sudo-project/sudo/issues/238
  patch -Np1 -i ../$pkgname-configure-add-missing-bracket.patch

  # https://github.com/sudo-project/sudo/issues/241
  patch -Np1 -i ../$pkgname-tests-pick-first-utf-8-locale.patch
}

build() {
  cd $pkgname-$_sudover

  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib \
    --with-rundir=/run/sudo \
    --with-vardir=/var/db/sudo \
    --with-logfac=auth \
    --enable-tmpfiles.d \
    --with-pam \
    --with-sssd \
    --with-ldap \
    --with-ldap-conf-file=/etc/openldap/ldap.conf \
    --with-env-editor \
    --with-passprompt="[sudo] password for %p: " \
    --with-all-insults
  make
}

check() {
  cd $pkgname-$_sudover
  make check
}

package() {
  depends+=('libcrypto.so' 'libssl.so')

  cd $pkgname-$_sudover
  make DESTDIR="$pkgdir" install

  # sudo_logsrvd service file (taken from sudo-logsrvd-1.9.0-1.el8.x86_64.rpm)
  install -Dm644 -t "$pkgdir/usr/lib/systemd/system" ../sudo_logsrvd.service

  # Remove sudoers.dist; not needed since pacman manages updates to sudoers
  rm "$pkgdir/etc/sudoers.dist"

  # Remove /run/sudo directory; we create it using systemd-tmpfiles
  rmdir "$pkgdir/run/sudo"
  rmdir "$pkgdir/run"

  install -Dm644 "$srcdir/sudo.pam" "$pkgdir/etc/pam.d/sudo"

  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/sudo"
}

# vim:set ts=2 sw=2 et:
