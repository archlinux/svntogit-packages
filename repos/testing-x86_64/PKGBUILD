# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=pam
pkgver=1.4.0
pkgrel=1
pkgdesc="PAM (Pluggable Authentication Modules) library"
arch=('x86_64')
license=('GPL2')
url="http://linux-pam.org"
depends=('glibc' 'cracklib' 'libtirpc' 'pambase')
makedepends=('flex' 'w3m' 'docbook-xml>=4.4' 'docbook-xsl')
backup=(etc/security/{access.conf,group.conf,limits.conf,namespace.conf,namespace.init,pam_env.conf,time.conf} etc/default/passwd etc/environment)
source=(https://github.com/linux-pam/linux-pam/releases/download/v$pkgver/Linux-PAM-$pkgver.tar.xz
        https://github.com/linux-pam/linux-pam/releases/download/v$pkgver/Linux-PAM-$pkgver.tar.xz.asc)
validpgpkeys=(
        '296D6F29A020808E8717A8842DB5BD89A340AEB7' #Dimitry V. Levin <ldv@altlinux.org>
)

sha256sums=('cd6d928c51e64139be3bdb38692c68183a509b83d4f2c221024ccd4bcddfd034'
            'SKIP')

options=('!emptydirs')

build() {
  cd Linux-PAM-$pkgver
  ./configure --libdir=/usr/lib --sbindir=/usr/bin --disable-db
  make
}

package() {
  cd Linux-PAM-$pkgver
  make DESTDIR="$pkgdir" SCONFIGDIR=/etc/security install

  # set unix_chkpwd uid
  chmod +s "$pkgdir"/usr/bin/unix_chkpwd

  # remove doc which is not used anymore
  # FS #40749
  rm "$pkgdir"/usr/share/doc/Linux-PAM/sag-pam_userdb.html
}
