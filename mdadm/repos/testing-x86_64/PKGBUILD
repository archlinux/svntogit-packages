# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=mdadm
pkgver=4.2
pkgrel=2
pkgdesc='A tool for managing/monitoring Linux md device arrays, also known as Software RAID'
arch=('x86_64')
license=('GPL')
url='https://git.kernel.org/pub/scm/utils/mdadm'
makedepends=('git')
depends=('glibc' 'systemd')
optdepends=('bash: mdcheck')
replaces=('raidtools')
backup=('etc/mdadm.conf')
validpgpkeys=('6A86B80E1D22F21D0B26BA75397D82E0531A9C91') # Jes Sorensen
source=("git+https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git#tag=${pkgname}-${pkgver}?signed"
        'disable-werror.patch'
	'mdadm.conf'
        'mdadm_udev_install')
sha256sums=('SKIP'
            '85c98b8fe880bdd365fc0e400af10c2e5d0c439d338e055f66c16162f9282846'
            '4ce1e90690282f98e4828e11576fbd61be65e97a2cdae6c7eac7035ea5ee53e5'
            'b6782029bdae2d7f87ea0e332bb90f72a7792e933580e37602e81e2f1bb82a9c')
prepare() {
  cd mdadm
  patch -Np0 -i ${srcdir}/disable-werror.patch
}

build() {
  cd mdadm

  make CXFLAGS="$CFLAGS" BINDIR=/usr/bin UDEVDIR=/usr/lib/udev 
}

package() {
  cd mdadm

  make INSTALL=/usr/bin/install BINDIR=/usr/bin DESTDIR="$pkgdir" UDEVDIR=/usr/lib/udev install
  make SYSTEMD_DIR="$pkgdir"/usr/lib/systemd/system install-systemd
  install -D -m644 ../mdadm.conf "$pkgdir"/etc/mdadm.conf
  install -D -m644 ../mdadm_udev_install "$pkgdir"/usr/lib/initcpio/install/mdadm_udev
  install -D -m755 misc/mdcheck "$pkgdir"/usr/share/mdadm/mdcheck
  ln -s mdadm_udev "$pkgdir"/usr/lib/initcpio/install/mdadm
}
