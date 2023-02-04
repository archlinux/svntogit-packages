# Contributor: Camille Moncelier <pix@devlife.org>, simo <simo@archlinux.org>
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=kexec-tools
pkgver=2.0.26
pkgrel=1
pkgdesc="Load another kernel from the currently executing Linux kernel"
arch=('x86_64')
url="https://kernel.org/pub/linux/utils/kernel/kexec/"
source=("git+https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git#tag=v${pkgver}")
makedepends=('git')
depends=('zlib' 'xz')
license=('GPL2')

prepare() {
  cd $pkgname
  ./bootstrap
}

build() {
  cd $pkgname
  CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common
  ./configure --prefix=/usr --sbindir=/usr/bin --without-lzma
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -D -m644 kexec/kexec.8 "$pkgdir"/usr/share/man/man8/kexec.8
}

md5sums=('SKIP')
