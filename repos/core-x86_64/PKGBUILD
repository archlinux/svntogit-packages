# Maintainer: Christian Hesse <mail@eworm.de>
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=iproute2
pkgver=6.1.0
pkgrel=4
pkgdesc='IP Routing Utilities'
arch=('x86_64')
license=('GPL2')
url='https://git.kernel.org/pub/scm/network/iproute2/iproute2.git'
depends=('glibc' 'iptables' 'libcap' 'libelf' 'libbpf')
makedepends=('db5.3')
optdepends=('db5.3: userspace arp daemon'
            'linux-atm: ATM support'
            'python: for routel')
provides=('iproute')
backup=('etc/iproute2/bpf_pinning'
        'etc/iproute2/ematch_map'
        'etc/iproute2/group'
        'etc/iproute2/nl_protos'
        'etc/iproute2/rt_dsfield'
        'etc/iproute2/rt_protos'
        'etc/iproute2/rt_realms'
        'etc/iproute2/rt_scopes'
        'etc/iproute2/rt_tables')
makedepends=('linux-atm')
options=('staticlibs')
validpgpkeys=('9F6FC345B05BE7E766B83C8F80A77F6095CDE47E') # Stephen Hemminger
source=("https://www.kernel.org/pub/linux/utils/net/${pkgname}/${pkgname}-${pkgver}.tar."{xz,sign}
        '0001-make-iproute2-fhs-compliant.patch'
        'bdb5.3.patch')
sha256sums=('5ce12a0fec6b212725ef218735941b2dab76244db7e72646a76021b0537b43ab'
            'SKIP'
            '758b82bd61ed7512d215efafd5fab5ae7a28fbfa6161b85e2ce7373285e56a5d'
            '908de44ee99bf78669e7c513298fc2a22ca9d7e816a8f99788b1e9b091035cf4')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # set correct fhs structure
  patch -Np1 -i "${srcdir}"/0001-make-iproute2-fhs-compliant.patch

  # use Berkeley DB 5.3
  patch -Np1 -i "${srcdir}"/bdb5.3.patch

  # do not treat warnings as errors
  sed -i 's/-Werror//' Makefile

}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export CFLAGS+=' -ffat-lto-objects'

  ./configure
  make DBM_INCLUDE='/usr/include/db5.3'
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" SBINDIR="/usr/bin" install

  # libnetlink isn't installed, install it FS#19385
  install -Dm0644 include/libnetlink.h "${pkgdir}/usr/include/libnetlink.h"
  install -Dm0644 lib/libnetlink.a "${pkgdir}/usr/lib/libnetlink.a"
}
