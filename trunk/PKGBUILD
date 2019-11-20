# Maintainer: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=keyutils
pkgver=1.6.1
pkgrel=3
pkgdesc='Linux Key Management Utilities'
arch=('x86_64')
url='https://www.kernel.org/'
license=('GPL2' 'LGPL2.1')
depends=('glibc' 'sh')
makedepends=('git')
backup=('etc/request-key.conf')
validpgpkeys=('A86E54B0D5E1B4E0AB7C640FFBB7576BA7CB0B6B') # David Howells <dhowells@redhat.com>
source=("git+https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/keyutils.git#tag=v${pkgver}?signed"
        'request-key.conf.patch' 'reproducible.patch')
sha256sums=('SKIP'
            '203c602c61ed94ccd423a0a453d74143d678c641a9a4486367576ee8af2cb8d6'
            '7bb7400b2b8c8f0288c86ec9191f8964a1e682745a204013d5fc7c2e1a253d8e')

prepare() {
  cd ${pkgname}
  # fix paths of binaries in /etc/request-key.conf
  patch -Np0 -i ../request-key.conf.patch

  # make keyutils reproducible
  patch -Np1 -i ../reproducible.patch
}

build() {
  cd ${pkgname}
  make CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}" SBINDIR='/usr/bin' BINDIR='/usr/bin'
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" SBINDIR='/usr/bin' BINDIR='/usr/bin' LIBDIR='/usr/lib' USRLIBDIR='/usr/lib' install
}
