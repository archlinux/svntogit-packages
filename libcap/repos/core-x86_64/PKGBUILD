# Maintainer:  David Runge <dvzrv@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>

pkgname=libcap
pkgver=2.63
pkgrel=2
pkgdesc="POSIX 1003.1e capabilities"
arch=(x86_64)
url="https://sites.google.com/site/fullycapable/"
license=(GPL2)
depends=(glibc pam)
makedepends=(linux-api-headers)
provides=(libcap.so libpsx.so)
options=(debug)
source=("https://kernel.org/pub/linux/libs/security/linux-privs/${pkgname}2/${pkgname}-$pkgver.tar."{xz,sign}
)
sha512sums=('832842b71ca32db8f53ca5f1a3010f14e7f42693f62f29632e9948c860f990899bb094165c37307ce8b9e5bc5eb1c833e780ebca98442df3e6d900e4b238834b'
            'SKIP')
b2sums=('a49a628f5b9ddf5a3d077428544a53b9cdedf62053ff296a0aa7d61e12ca05f9ba7597f20ee16a3843736bee2417a3d1585ad6b336651fcb3e4ee29b108cfa0f'
        'SKIP')
validpgpkeys=(38A644698C69787344E954CE29EE848AE2CCF3F4) # Andrew G. Morgan <morgan@kernel.org>

build() {
  make DYNAMIC=yes KERNEL_HEADERS=/usr/include lib=lib prefix=/usr sbindir=bin -C $pkgname-$pkgver
}

check() {
  make test -k -C $pkgname-$pkgver
}

package() {
  make DESTDIR="$pkgdir" RAISE_SETFCAP=no lib=lib prefix=/usr sbindir=bin install -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/{CHANGELOG,README} -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 $pkgname-$pkgver/pam_cap/capability.conf -t "$pkgdir/usr/share/doc/$pkgname/examples/"
}
