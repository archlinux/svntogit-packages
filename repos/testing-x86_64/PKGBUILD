# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=sysfsutils
pkgver=2.1.1
pkgrel=1
pkgdesc="System Utilities Based on Sysfs"
arch=(x86_64)
license=('GPL' 'LGPL')
url="http://linux-diag.sourceforge.net/Sysfsutils.html"
depends=('glibc')
makedepends=('git')
source=("git+https://github.com/linux-ras/sysfsutils.git#tag=v${pkgver}")

prepare() {
cd "$pkgname"
  ./autogen
}

build() {
  cd "$pkgname"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

check() {
  cd "$pkgname"
  make check
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
  rm "$pkgdir/usr/lib/libsysfs.a"
}
md5sums=('SKIP')
