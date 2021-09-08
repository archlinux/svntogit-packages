# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=pam
pkgver=1.5.2
pkgrel=1
pkgdesc="PAM (Pluggable Authentication Modules) library"
arch=('x86_64')
license=('GPL2')
url="http://linux-pam.org"
depends=('glibc' 'libtirpc' 'pambase' 'audit' 'libaudit.so' 'libxcrypt' 'libcrypt.so')
makedepends=('flex' 'w3m' 'docbook-xml>=4.4' 'docbook-xsl')
provides=('libpam.so' 'libpamc.so' 'libpam_misc.so')
backup=(etc/security/{access.conf,faillock.conf,group.conf,limits.conf,namespace.conf,namespace.init,pam_env.conf,time.conf} etc/environment)
source=(https://github.com/linux-pam/linux-pam/releases/download/v$pkgver/Linux-PAM-$pkgver.tar.xz{,.asc}
        $pkgname.tmpfiles)
validpgpkeys=(
        '8C6BFD92EE0F42EDF91A6A736D1A7F052E5924BB' # Thorsten Kukuk
        '296D6F29A020808E8717A8842DB5BD89A340AEB7' #Dimitry V. Levin <ldv@altlinux.org>
)

sha256sums=('e4ec7131a91da44512574268f493c6d8ca105c87091691b8e9b56ca685d4f94d'
            'SKIP'
            '5631f224e90c4f0459361c2a5b250112e3a91ba849754bb6f67d69d683a2e5ac')

options=('!emptydirs')

build() {
  cd Linux-PAM-$pkgver
  ./configure \
    --libdir=/usr/lib \
    --sbindir=/usr/bin \
    --disable-db
  make
}

package() {
  install -Dm 644 $pkgname.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/$pkgname.conf
  cd Linux-PAM-$pkgver
  make DESTDIR="$pkgdir" SCONFIGDIR=/etc/security install

  # set unix_chkpwd uid
  chmod +s "$pkgdir"/usr/bin/unix_chkpwd

  # remove doc which is not used anymore
  # FS #40749
  rm "$pkgdir"/usr/share/doc/Linux-PAM/sag-pam_userdb.html
}

# vim: ts=2 sw=2 et:
